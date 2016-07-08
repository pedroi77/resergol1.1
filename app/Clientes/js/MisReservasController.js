var resergolApp = angular.module("resergolApp");

resergolApp.controller("MisReservasController", function($scope,$state, $stateParams, store, ProvinciasService, LocalidadesService, CanchasService, DuenioDiasService, ReservasService, ReservasCancelacionService, DevolucionesService){
	
    var self = this;
    
    this.pagoCompleto = true;
    this.seniada = true;
    this.fija=false;
    this.todos=false;
    
    this.estaLogueado = false;
    //$rootScope.$state = $state;
    $scope.idCliente = $stateParams.idCli;
    $scope.misRes = [];
     var token = store.get("token") || null;
     var sesion = sessionStorage.usuario  || null;

     if(!token || !sesion ){
         self.estaLogueado = false;
     }    
     else{
         self.estaLogueado = true;
     }   
    
    this.setTodos= function(){
        if(self.todos){
            self.pagoCompleto = false;
            self.seniada = false;
            self.fija=false;
        }
    };
    
    this.imprimirComprobante = function(res) {
        
      //Traigo el horario de la reserva.    
      var horario = res.HoraInicio.substring(0,2) + ":00 hs. a " + res.HoraFin.substring(0,2) + ":00 hs.";

      //Configuro el PDF.    
      var doc = new jsPDF();
      doc.setFontStyle("bolditalic");
      doc.setFontSize(16);
      doc.text(50, 20, 'RESERGOL - COMPROBANTE DE RESERVA');
      doc.setFontSize(14);
      doc.setFontStyle("italic");
      doc.text(20, 30, 'Usuario: ' + sessionStorage.usuario);
      doc.text(20, 40, 'Complejo: ' + res.Complejo);
      doc.text(20, 50, res.Calle + " " + res.Altura + ", " + res.Localidad + " - " + res.Provincia);
      doc.text(20, 60, 'Cancha: ' + res.Cancha);
      doc.text(20, 70, 'Fecha: ' + res.FechaPartidoFormateada + " " + horario);
      doc.line(20, 85, 200, 85);
      doc.setFontStyle("bolditalic");
      doc.setFontSize(18);
      doc.text(20, 100, 'A Pagar: $' + parseFloat(parseFloat(res.Pagado) + parseFloat(res.Restante)));
      doc.text(85, 100, 'Pagado: $' + parseFloat(res.Pagado)); 
      doc.text(150, 100, 'Restante: $' + parseFloat(res.Restante));
      doc.line(20, 110, 200, 110);
      doc.setFontSize(12);
      doc.text(40, 130, 'www.resergol.com.ar - 2016 - Todos los derechos reservados.');

      var string = doc.output('datauristring');
        
      var leftPosition = (window.screen.width / 2) - ((500 / 2) + 10);
      var topPosition = (window.screen.height / 2) - ((500 / 2) + 50);
        
      window.open(string, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top="+topPosition+",left="+leftPosition+",width=500,height=500");
      
        
    };
    
    
    this.compararFechas = function (DateA, DateB) {     // this function is good for dates > 01/01/1970

        var a = new Date(DateA);
        var b = new Date(DateB);

        var msDateA = Date.UTC(a.getFullYear(), a.getMonth()+1, a.getDate());
        var msDateB = Date.UTC(b.getFullYear(), b.getMonth()+1, b.getDate());
        console.log(msDateA);
        console.log(msDateB);

        if (parseFloat(msDateA) < parseFloat(msDateB))
          return -1;  // lt
        else if (parseFloat(msDateA) == parseFloat(msDateB))
          return 0;  // eq
        else if (parseFloat(msDateA) > parseFloat(msDateB))
          return 1;  // gt
        else
          return null;  // error
    };
    
    this.borrarReserva = function(res)
    {
        /*Verifico si puede cancelar la reserva.
         Para esto, tanto la fecha de hoy, como la del partido, debe ser
         Menor a la FechaCancelacion que traigo desde el SP,
         Si el cliente había pagado algo, se le devuelve el importe...
        */
        
        //Hay tiempo para realizar la cancelacion hasta esta fecha/hora
        var fCancelacion = res.CancelacionHasta.substring(0,16);
        var vAhora = new Date();
        function pad(n) {return n < 10 ? "0"+n : n;}
        var ahora = vAhora.getFullYear()+"-"+pad(vAhora.getMonth()+1)+"-"+pad(vAhora.getDate())+" "+ vAhora.getHours()+":"+vAhora.getMinutes();
        
        var result = self.compararFechas(fCancelacion, ahora);
        var fPartido = res.FPartido.substring(0,16);
        var result2 = self.compararFechas(fPartido, ahora);
        
        if(result2 == -1) //SI EL PARTIDO YA SE JUGO....
            bootbox.alert("No se puede cancelar la reserva.", function() {});
        else
        {
            var devuelvo = true;
            if(result == -1) //SI YA NO SE PUEDE CANCELAR CON DEVOLUCION
                devuelvo = false;
                
            var sPag = parseFloat(res.Pagado);
            var msj = "";
            if(!devuelvo)
                msj = "No se realizará el reembolso ya que se superaron las horas de antelación de aviso";
            else if(sPag > 0) 
                msj = "Se te reembolsará la suma de $"+sPag+".";
                
            bootbox.confirm("¿Seguro desea cancelar la reserva? <br>" + msj, function(result) {
                if(result)
                {
                    if(sPag > 0 && devuelvo)
                    {
                      //INSERTO LA DEVOLUCION
                        var devNueva = new DevolucionesService();
                        devNueva.data = {
                            "idCliente": $scope.idCliente,
                            "idDuenio": res.IdDuenio,
                            "monto": parseFloat(res.Pagado)
                        };  
                   
                        DevolucionesService.save(devNueva.data, function(reponse){
                                idRetorno = reponse.data[0];
                                console.log('se guardo devolucion -->' + idRetorno);
                                
                                ReservasCancelacionService.delete({idReserva: res.IdReserva}, function(reponse){
                                    idRetorno = reponse.data[0];
                                    console.log('SE BORRO...... RETORNO -->' + idRetorno);
                                    self.init();
                                    bootbox.alert("¡Cancelación de reserva, y reembolso exitoso!", function() {});
                                    },function(errorResponse){
                                        console.log('ERROR BORRAR RES...' + errorResponse); 
                                    });
                            
                              },function(errorResponse){
                                console.log('ERROR devolucion...' + errorResponse); 
                             }); 
                    }
                    else
                    {
                        ReservasCancelacionService.delete({idReserva: res.IdReserva}, function(reponse){
                            idRetorno = reponse.data[0];
                            console.log('SE BORRO...... RETORNO -->' + idRetorno);
                            self.init();
                            bootbox.alert("¡Cancelación de reserva exitosa!", function() {});
                        },function(errorResponse){
                            console.log('ERROR BORRAR RES...' + errorResponse); 
                        });
                    }
                }
            }); 
            
        }
    };
    
    this.init = function(){
        var vPagoCompleto = 0;
        var vSeniada=0;
        var vFija=0;
        var vTodos =0;
        
        vPagoCompleto=(self.pagoCompleto)?2:0;
        vSeniada=(self.seniada)?1:0;
        vFija=(self.fija)?3:0;
        vTodos=(self.todos)?1:0;
        
        ReservasService.query({idCliente:$scope.idCliente, todos:vTodos, pagosCompletos:vPagoCompleto, seniadas:vSeniada, fijas:vFija}).$promise.then(function(data){
                    $scope.misRes = data;
            
                    angular.forEach($scope.misRes,function(aux){
                     aux.FechaReservaFormateada = aux.FechaReservaFormateada.substring(0,16);
                     var horaIn = aux.HoraInicio.substring(0,2) + 'hs';
                     var horaFn = aux.HoraFin.substring(0,2) + 'hs';    
                     aux.DiaDePartidoFormat = aux.FechaPartidoFormateada + ' (' + horaIn + ' a ' + horaFn + ')';
                     aux.PagadoFormat = '$' + parseFloat(aux.Pagado);
                     aux.RestanteFormat = '$' + parseFloat(aux.Restante);
                 });
            
            });
    }
    
    self.init();
     
   
    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });  
    });
   
    
[]});
