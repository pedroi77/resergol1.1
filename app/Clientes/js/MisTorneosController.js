
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MisTorneosController", function($scope,$state, $stateParams, store, ProvinciasService, LocalidadesService, DuenioDiasService, TorneosClientesService, DevolucionesService, EquipoTorneoService){
	
    var self = this;
    
    this.inscripcion = true;
    this.activos = true;
    this.finalizados=false;
    this.todos=false;
    
    this.estaLogueado = false;
    //$rootScope.$state = $state;
    $scope.idCliente = $stateParams.idCli;
    $scope.misTor = [];
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
            self.inscripcion = false;
            self.activos = false;
            self.finalizados=false;
        }
    };
    
    this.imprimirComprobante = function(ins) {
      
      //Configuro el PDF.    
      var doc = new jsPDF();
      doc.setFontStyle("bolditalic");
      doc.setFontSize(16);
      doc.text(20, 20, 'RESERGOL - COMPROBANTE DE INSCRIPCIÓN A TORNEO');
      doc.setFontSize(14);
      doc.setFontStyle("italic");
      doc.text(20, 30, 'Usuario: ' + sessionStorage.usuario + ' - Equipo: ' + ins.Equipo);
      doc.text(20, 40, 'Torneo: ' + ins.Nombre + " ("+ins.TipoTorneo+")");
      doc.text(20, 50, 'Complejo: ' + ins.Complejo);
      doc.text(20, 60, ins.Calle + " " + ins.Altura + ", " + ins.Localidad + " - " + ins.Provincia);
      doc.text(20, 70, 'Fecha de inicio: ' + ins.FechaInicioFormateada);
      doc.text(20, 80, 'Fecha de fin: ' + ins.FechaFinFormateada);
      doc.line(20, 85, 200, 85);
      doc.setFontStyle("bolditalic");
      doc.setFontSize(18);
      doc.text(30, 100, 'Se abonaron: $' + parseFloat(ins.PrecioInscripcion) + '  (valor total de la inscripción)'); 
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
    
    this.borrarReserva = function(tor)
    {
        /*Verifico si puede borrar al equipo del torneo.
        El estado del torneo no tiene que ser finalizado, 

         Para esto, tanto la fecha de hoy, como la del partido, debe ser
         Menor a la FechaCancelacion que traigo desde el SP,
         Si el cliente había pagado algo, se le devuelve el importe...
        */
        
        //Hay tiempo para realizar la cancelacion hasta esta fecha/hora
        var fCancelacion = tor.CancelacionHasta.substring(0,10);
        console.log('ivo fcanc-->' + fCancelacion);
        var vAhora = new Date();
        function pad(n) {return n < 10 ? "0"+n : n;}
        var ahora = vAhora.getFullYear()+"-"+pad(vAhora.getMonth()+1)+"-"+pad(vAhora.getDate())+" "+ vAhora.getHours()+":"+vAhora.getMinutes();
        
        var result = self.compararFechas(fCancelacion, ahora);
        //var fPartido = tor.FPartido.substring(0,16);
        //var result2 = self.compararFechas(fPartido, ahora);
        
        var devuelvo = true;
            if(result == -1) //SI YA NO SE PUEDE CANCELAR CON DEVOLUCION
                devuelvo = false;
                
            var sPag = parseFloat(tor.PrecioInscripcion);
            var msj = "";
            if(!devuelvo)
                msj = "No se realizará el reembolso ya que se superaron las horas de antelación de aviso";
            else if(sPag > 0) 
                msj = "Se te reembolsará la suma de $"+sPag+".";
                
            bootbox.confirm("¿Seguro desea cancelar la reserva? <br>" + msj, function(result) {
                if(result)
                {
                    if(devuelvo)
                    {
                        
                        //BORRO AL EQUIPO DEL TORNEO...
                        //console.log('idEq->' + tor.IdEquipo + '---idTor-->' + tor.IdTorneo);
                        EquipoTorneoService.delete({idEquipo: tor.IdEquipo, idTorneo: tor.IdTorneo }, function(reponse){
                                    idRetorno = reponse.data[0];
                                    console.log('SE BORRO...... RETORNO -->' + idRetorno);
                                    self.init();
                                    bootbox.alert("¡Se borró a tu equipo del torneo!", function() {});
                            
                                    },function(errorResponse){
                                        console.log('ERROR BORRAR RES...' + errorResponse); 
                                    });
          
                      //INSERTO LA DEVOLUCION
                        /*var devNueva = new DevolucionesService();
                        devNueva.data = {
                            "idCliente": $scope.idCliente,
                            "idDuenio": tor.IdDuenio,
                            "monto": parseFloat(tor.Pagado)
                        };  
                   
                        DevolucionesService.save(devNueva.data, function(reponse){
                                idRetorno = reponse.data[0];
                                console.log('se guardo devolucion -->' + idRetorno);
                                
                                ReservasCancelacionService.delete({idReserva: tor.IdReserva}, function(reponse){
                                    idRetorno = reponse.data[0];
                                    console.log('SE BORRO...... RETORNO -->' + idRetorno);
                                    self.init();
                                    bootbox.alert("¡Cancelación de reserva, y reembolso exitoso!", function() {});
                                    },function(errorResponse){
                                        console.log('ERROR BORRAR RES...' + errorResponse); 
                                    });
                            
                              },function(errorResponse){
                                console.log('ERROR devolucion...' + errorResponse); 
                             });*/ 
                    }
                    else
                    {
                        /*ReservasCancelacionService.delete({idReserva: tor.IdReserva}, function(reponse){
                            idRetorno = reponse.data[0];
                            console.log('SE BORRO...... RETORNO -->' + idRetorno);
                            self.init();
                            bootbox.alert("¡Cancelación de reserva exitosa!", function() {});
                        },function(errorResponse){
                            console.log('ERROR BORRAR RES...' + errorResponse); 
                        });*/
                    }
                }
            }); 
    };
    
    this.init = function(){
        var vInscripcion = 0;
        var vActivos=0;
        var vFinalizados=0;
        var vTodos =0;
        
        vInscripcion=(self.inscripcion)?2:0;
        vActivos=(self.activos)?1:0;
        vFinalizados=(self.finalizados)?3:0;
        vTodos=(self.todos)?1:0;
        
        TorneosClientesService.query({idCliente:$scope.idCliente, todos:vTodos, inscripcion:vInscripcion, activos:vActivos, finalizados:vFinalizados}).$promise.then(function(data){
                    $scope.misTor = data;
            
                    angular.forEach($scope.misTor,function(aux){
                     //aux.FechaReservaFormateada = aux.FechaReservaFormateada.substring(0,16);
                     //aux.DiaDePartidoFormat = aux.FechaPartidoFormateada + ' (' + horaIn + ' a ' + horaFn + ')';
                     aux.PagadoFormat = '$' + parseFloat(aux.PrecioInscripcion);
                    
                    if(aux.IdEstado != "2" || aux.IdEstado != 2)
                      aux.NoInscripcion = true;
                    else
                      aux.NoInscripcion = false;    
                     //aux.RestanteFormat = '$' + parseFloat(aux.Restante);
                 });
            
            });
    }
    
    self.init();
   

        
    this.verTorneo = function(torneo)
    {
        console.log(torneo.IdTipoTorneo);

        if(torneo.IdTipoTorneo == 1 || torneo.IdTipoTorneo == "1")
            $state.go("Clientes.verTorneoLiga",{idTorneo:torneo.IdTorneo});
        else if(torneo.IdTipoTorneo == 2 || torneo.IdTipoTorneo == "2")
                $state.go("Clientes.verTorneoCopa",{idTorneo:torneo.IdTorneo});

        $('html,body').animate({scrollTop:10},'fast');return false;
    }
    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });  
    });
    
    
     this.verComplejo = function(torneo)
    {
        console.log(torneo.IdComplejo);
        $state.go("Clientes.verComplejo",{idComp:torneo.IdComplejo});
        $('html,body').animate({scrollTop:10},'fast');return false;
    }
    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });  
    });
   
    
});