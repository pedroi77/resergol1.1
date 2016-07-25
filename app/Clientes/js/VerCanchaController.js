var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerCanchaController", function($scope, $rootScope, $sce, store, $timeout, $state,  $stateParams, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DuenioDiasService, ReservasService, TarjetasClienteService, ListasNegrasService, ReservasFijasService, ReservasTempService, ComplejosDiasServices, PuntuacionesCanchaService, ComentariosCanchaService, CanchaImagenesDBServices, MandarMailsService, $log){
	
    var self = this;
    
    this.estaLogueado = false;
    $scope.tiempoTimer = 300;
    $rootScope.$state = $state;
    $scope.cancha = [];
    $scope.idCancha = $stateParams.idCan;
    $scope.idComplejo = $stateParams.idComp;
    $scope.idDuenio = -1;
    $scope.idCliente = sessionStorage.id;
    $scope.mailCliente = sessionStorage.email;
    
    this.myInterval =5000;
    this.noWrapSlides = false;
    this.active = 0;
    
    //Puntuacion que hizo el cliente si es que puntuó.
    this.PuntuacionCliente = 0;
    this.Puntuacion = {
                        idCancha:$scope.idCancha,
                        idComplejo:$scope.idComplejo,
                        idCliente:sessionStorage.id,
                        puntaje: 0
                     };
    
    this.PuntajeDesc = "";//"":
    this.PuntajeClass = "button-md label-warning";//"";

    this.seVoto5 = false;
    this.seVoto4 = false;
    this.seVoto3 = false;
    this.seVoto2 = false;
    this.seVoto1 = false;
    
    //Esto es para el MAPA. Inicio
    $scope.map = {center: {latitude: -34.602473, longitude: -58.381057 }, zoom: 14 };
    //$scope.map = {center: {latitude: -34.602473, longitude: -58.381057 }, zoom: 14 };
    $scope.options = {scrollwheel: false};
    $scope.coordsUpdates = 0;
    $scope.dynamicMoveCtr = 0;
    $scope.marker = {
      id: 0,
      coords: {
        latitude: 0,
        longitude: 0
      },
      options: { draggable: true },
      events: {
        dragend: function (marker, eventName, args) {
          $log.log('marker dragend');
          var lat = marker.getPosition().lat();
          var lon = marker.getPosition().lng();
          $log.log(lat);
          $log.log(lon);

          $scope.marker.options = {
            draggable: true,
            labelContent: "lat: " + $scope.marker.coords.latitude + ' ' + 'lon: ' + $scope.marker.coords.longitude,
            labelAnchor: "100 0",
            labelClass: "marker-labels"
          };
        }
      }
    };
    $scope.$watchCollection("marker.coords", function (newVal, oldVal) {
      if (_.isEqual(newVal, oldVal))
        return;
      $scope.coordsUpdates++;
    });
    
    /*
    $scope.marker.coords = {
        latitude:-34.602473,
        longitude: -58.381057 
      };
    */
    /*
    $timeout(function () {
      $scope.marker.coords = {
        latitude:-34.602473,
        longitude: -58.381057 
      };
      $scope.dynamicMoveCtr++;
      $timeout(function () {
        $scope.marker.coords = {
          latitude: 43.1451,
          longitude: -102.6680
        };
        $scope.dynamicMoveCtr++;
      }, 2000);
    }, 1000);
    */
    //Esto es para el MAPA. Fin

    $scope.ComentariosCancha = []; //usuario,comentario y fecha.   
    this.Comentario = {
                        idCancha:$scope.idCancha,
                        idComplejo:$scope.idComplejo,
                        idCliente:sessionStorage.id,
                        comentario: ''
                     };
    this.comment = "";

    this.diasComplejo = [];
    $scope.dt = null;
    $scope.FechasReservaFija = [];
    $scope.noDisponibles = []; //Fechas no disp. para una reserva fija si es que las hay.
    $scope.aceptaReservaFija = 0;
    $scope.tooltipDiasComplejo = "";
    
    $scope.listasReservasFijas = [];
    
    $scope.DiasYHorariosTooltip = "";
    
    this.horaDesde = 0;
    this.horasDesde = [];
    this.horaHasta = 24;
    
    this.horaDesde2 = 0;
    this.horasDesde2 = [];
    this.horaHasta2 = 24;
    
    this.paso1Completo = false;
    $scope.precioAPagar = 0;
    $scope.restante = 0;
    $scope.porcentajePago = 0;
    
    $scope.fechaPartido = null;
    $scope.hDesdePartido = null;
    $scope.hHastaPartido = null;
    
    this.horasD = [];
    this.horasH = [];
    
    this.selectedHoraDId;
    this.selectedHoraHId;
    
    $scope.HorasDisponibles = [];
    $scope.HorasReservasDia = [];
    
    $scope.fechaIngresoListaNegra = 0; //Si es 0, no está en la lista negra. Si está, guardo la fecha que ingresó a la misma.
    
    this.Reserva ={
                        idCliente:sessionStorage.id,
                        idComplejo: $scope.idComplejo,
                        idCancha: $scope.idCancha,
                        fechaPartido: null,
                        horaD: '18:00:00',
                        horaH: '19:00:00',
                        importeAPagar: 800,
                        pagado: 800,
                        porcentajePago: 100,
                        estadoReserva: 2 //1-Señado 2-PagoCompleto
                      };
    
    this.ReservaFija ={
                        idCliente:sessionStorage.id,
                        idComplejo: $scope.idComplejo,
                        idCancha: $scope.idCancha,
                        fechaPartido: null,
                        horaD: '18:00:00',
                        horaH: '19:00:00',
                        importeAPagar: 0,
                        pagado: 0,
                        porcentajePago: 0,
                        estadoReserva: 3 //1-Señado 2-PagoCompleto 3-Fija
                      };
    
    this.Tarjeta ={
                        idCliente:sessionStorage.id,
                        nroTarjeta:'123456789123456',
                        mes: 11,
                        anio: 18,
                        codigo: '12'
                      };
    
    this.bTarjetaDeLaBD = false;
    
    
         var token = store.get("token") || null;
         var sesion = sessionStorage.usuario  || null;
        
         if(!token || !sesion ){
             self.estaLogueado = false;
         }    
         else{
             self.estaLogueado = true;
         }   
    
    
    
    
    $scope.counter = $scope.tiempoTimer;
    var mytimeout = null;
    
    $scope.onTimeout = function() {
        if($scope.counter ===  0) {
            $scope.$broadcast('timer-stopped', 0);
            $timeout.cancel(mytimeout);
            return;
        }
        $scope.counter--;
        mytimeout = $timeout($scope.onTimeout, 1000);
    };
    
    $scope.startTimer = function() {
        mytimeout = $timeout($scope.onTimeout, 1000);
    };
 
    // stops and resets the current timer
    $scope.stopTimer = function() {
        $scope.$broadcast('timer-stopped', $scope.counter);
        $scope.counter = $scope.tiempoTimer;
        $timeout.cancel(mytimeout);
    };
    
    $scope.$on('timer-stopped', function(event, remaining) {
        if(remaining === 0 && $state.current.name == 'Clientes.verCancha.Reservar') {
             self.borrarReservaTemp();

             bootbox.alert("Tiempo máximo de reserva alcanzado.", function() {
             });
            
            $state.go('Clientes.verCancha'); 
            $('html,body').animate({scrollTop:10},'slow');return false;
        }
        
    });
    
    this.desactivarBotonPuntuacion = function(punt){
        switch(punt) {
            case 1:
                self.seVoto1 = true;
                self.seVoto2 = false;
                self.seVoto3 = false;
                self.seVoto4 = false;
                self.seVoto5 = false;
                break;
            case 2:
                self.seVoto1 = false;
                self.seVoto2 = true;
                self.seVoto3 = false;
                self.seVoto4 = false;
                self.seVoto5 = false;
                break;
            case 3:
                self.seVoto1 = false;
                self.seVoto2 = false;
                self.seVoto3 = true;
                self.seVoto4 = false;
                self.seVoto5 = false;
                break;
            case 4:
                self.seVoto1 = false;
                self.seVoto2 = false;
                self.seVoto3 = false;
                self.seVoto4 = true;
                self.seVoto5 = false;
                break;
            case 5:
                self.seVoto1 = false;
                self.seVoto2 = false;
                self.seVoto3 = false;
                self.seVoto4 = false;
                self.seVoto5 = true;
                break;
        }
    };
    
    //Traigo la puntuacion que hizo el cliente, para darle algun efecto al botón que votó.
    this.getPuntuacionCliente = function(){
			PuntuacionesCanchaService.query({idCancha: $scope.idCancha, idComplejo: $scope.idComplejo, idCliente:sessionStorage.id}).$promise.then(function(data){
                    if(data != null && data != undefined && data.length > 0)
                    {
                        if(data[0].Puntaje != null && data[0].Puntaje != 0)
                        {
                        	self.PuntuacionCliente = parseInt(data[0].Puntaje);
                            self.desactivarBotonPuntuacion(self.PuntuacionCliente);
                        }
                        else
                        {
                            self.seVoto1 = false;
                            self.seVoto2 = false;
                            self.seVoto3 = false;
                            self.seVoto4 = false;
                            self.seVoto5 = false;
                        }
                    }
                        
            });
	};
    
    //Traigo la puntuacion que de la cancha.
    this.getPuntuacionCancha = function(){
            PuntuacionesCanchaService.query({idCancha: $scope.idCancha, idComplejo: $scope.idComplejo}).$promise.then(function(data){       
                    if(data != null && data != undefined)
                    {
                        console.log('ENTRE 22222222222222');
                        if(data[0].Puntaje != null)
                        {
                           var punt = parseFloat(data[0].Puntaje);
                           console.log('3333 PUNTAJE-->' + punt);

                                if(punt == 0){
                                    self.PuntajeDesc = 'Sin votos.';
                                    self.PuntajeClass = "btn-xs label-info";
                                }
                                else
                                    if(punt > 0 && punt <= 1){
                                        self.PuntajeDesc = 'Muy mala';
                                        self.PuntajeClass = "btn-xs label-danger";
                                    }
                                     else
                                        if(punt > 1 && punt <= 2){ 
                                            self.PuntajeDesc = 'No me gustan';
                                            self.PuntajeClass = "btn-xs label-warning";
                                        }
                                    else
                                        if(punt > 2 && punt <= 3){
                                            self.PuntajeDesc = 'Mas o menos';
                                            self.PuntajeClass = "btn-xs label-info";
                                        }
                                        else
                                            if(punt > 3 && punt <= 4){
                                                self.PuntajeDesc = 'Muy buena';
                                                self.PuntajeClass = "btn-xs label-primary";
                                            }
                                            else
                                                if(punt > 4 && punt <= 5){
                                                    console.log('555555555555555');
                                                    self.PuntajeDesc = 'Una fantasía';
                                                    self.PuntajeClass = "btn-xs block label-success";
                                                }
                        }
                    }
                    else
                    {
                        self.PuntajeDesc = 'Sin votos.';
                        self.PuntajeClass = "btn-xs label-info";
                    }

            });
    };

    self.getPuntuacionCancha();
    
    //Traigo los comentarios de la cancha.
    this.getComentariosCancha = function(){
                ComentariosCanchaService.query({idCancha: $scope.idCancha, idComplejo: $scope.idComplejo}).$promise.then(function(data){
                        if(data != null && data != undefined)
                            $scope.ComentariosCancha = data;
                });
        };

     //Mandar mail.
    this.mandarMail = function(mensaje, asunto){
        
        console.log(mensaje);
        var mailNuevo = new MandarMailsService();
                    mailNuevo.data = {
                        "receptor": $scope.mailCliente,
                        "asunto": asunto,
                        "mensaje": mensaje
                    };  
        
                MandarMailsService.save(mailNuevo.data, function(reponse){
                        console.log('se mando el mail');
                      },function(errorResponse){
                        console.log('no se mando el mail' + errorResponse); 
                     }); 
        };


    self.getComentariosCancha();
    
this.getImagenes = function()
{
    CanchaImagenesDBServices.query({idComplejo:$scope.idComplejo, idCancha:$scope.idCancha}).$promise.then(function(data) {
            self.imagenes = data;
            if (self.imagenes.length > 0){
                var contador = 0;
                //Esto lo hago para agregar un id a cada imagen
                angular.forEach(data, function(aux) {
                    self.imagenes[contador]["id"]=contador;
                    aux.contador = contador;
                    contador++;
                });	
            }else{
                self.imagenes = [];
                self.imagenes.push({ "imagen": "http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg", "id":0});
            };   
        }); 
 };
    
    this.getCancha = function(){
        
			CanchasService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo}).$promise.then(function(data){
                    $scope.cancha = data;
                    $scope.idDuenio = data[0].IdDuenio; 
                
                console.log(data);
                $scope.map = {center: {latitude: data[0].X, longitude: data[0].Y}, zoom: 14 };
                
                 $scope.marker.coords = {
                    latitude:data[0].X,
                    longitude:  data[0].Y 
                  };
                
                DuenioDiasService.query({idDuenio:$scope.idDuenio}).$promise.then(function(data) {
                    self.diasComplejo = data;
                }); 
                
                self.getImagenes();
                
                if(self.estaLogueado)
                {
                    self.getPuntuacionCliente();
                    self.verificarListaNegra();
                }
                
            });
	};
    
    
   self.getCancha();
    
    

    
    this.setDiasComplejoAMostrar = function(){
        var texto = "";
        ComplejosDiasServices.query({idComplejo:$scope.idComplejo, aux:0}).$promise.then(function(data){
            angular.forEach(data,function(aux){
                if(aux.diaDesde != aux.diaHasta)
                {
                    texto += '<div class="label label-success">' + aux.diaDesde.substring(0,3) + '   a   '+aux.diaHasta.substring(0,3)+' de   ' + aux.horaDesde.substring(0,5) + 'hs    a   '+ aux.horaHasta.substring(0,5) + 'hs</div><br>';
                }
                else
                {
                    texto += '<div class="label label-success">' + aux.diaDesde.substring(0,3) + '   de    ' + aux.horaDesde.substring(0,5) + 'hs a ' + aux.horaHasta.substring(0,5) + 'hs </div><br> ';
                }
                
             });
            
            $scope.DiasYHorariosTooltip = $sce.trustAsHtml(texto);
        });
    };
                                                                          
    self.setDiasComplejoAMostrar();
    
    
    //Si el cliente ya puntuó la cancha, el SP hace un update.
    this.puntuar = function(puntaje){

        var puntuacionNueva = new PuntuacionesCanchaService();
        self.Puntuacion.puntaje = puntaje;
        
        console.log(self.Puntuacion.puntaje);
        puntuacionNueva.data=self.Puntuacion;
        
        PuntuacionesCanchaService.save(puntuacionNueva.data, function(reponse){
                idPunt = reponse.data[0];
                console.log('idPunt -->' + idPunt);
            
            self.getPuntuacionCliente();
            self.getPuntuacionCancha();
            
          },function(errorResponse){
            console.log('ERROR...'); 
         });

    };
    
    this.comentar = function(){
        if(self.comment != null && self.comment != '' && self.comment != undefined)
        {
            var comentarioNuevo = new ComentariosCanchaService();
            self.Comentario.comentario = self.comment;
            
            comentarioNuevo.data=self.Comentario;
            
            ComentariosCanchaService.save(comentarioNuevo.data, function(reponse){
                    idComm = reponse.data[0];
                    console.log('idComm -->' + idComm);
                
                self.comment = "";
                //Actualizo los comentarios...
                self.getComentariosCancha();
                
              },function(errorResponse){
                console.log('ERROR...'); 
             });

         }

    };
    
    
    this.imprimirComprobante = function() {
      //Traigo el horario de la reserva.    
      var horario = self.selectedHoraDId + ":00 hs. a " + self.selectedHoraHId + ":00 hs.";

      //Configuro el PDF.    
      var doc = new jsPDF();
      doc.setFontStyle("bolditalic");
      doc.setFontSize(16);
      doc.text(50, 20, 'RESERGOL - COMPROBANTE DE RESERVA');
      doc.setFontSize(14);
      doc.setFontStyle("italic");
      doc.text(20, 30, 'Usuario: ' + sessionStorage.usuario);
      doc.text(20, 40, 'Complejo: ' + $scope.cancha[0].Complejo);
      doc.text(20, 50, $scope.cancha[0].Calle + " " + $scope.cancha[0].Altura + ", " + $scope.cancha[0].Localidad + " - " + $scope.cancha[0].Provincia);
      doc.text(20, 60, 'Cancha: ' + $scope.cancha[0].nombre);
      doc.text(20, 70, 'Fecha: ' + $scope.fechaPartido + " " + horario);
      doc.line(20, 85, 200, 85);
      doc.setFontStyle("bolditalic");
      doc.setFontSize(18);
      doc.text(20, 100, 'A Pagar: $' + parseFloat($scope.precioAPagar + $scope.restante));
      doc.text(85, 100, 'Pagado: $' + $scope.precioAPagar); 
      doc.text(150, 100, 'Restante: $' + $scope.restante);
      doc.line(20, 110, 200, 110);
      doc.setFontSize(12);
      doc.text(40, 130, 'www.resergol.com.ar - 2016 - Todos los derechos reservados.');

      var string = doc.output('datauristring');
        
      var leftPosition = (window.screen.width / 2) - ((500 / 2) + 10);
      var topPosition = (window.screen.height / 2) - ((500 / 2) + 50);
        
      window.open(string, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top="+topPosition+",left="+leftPosition+",width=500,height=500");
      
        
    };
    
   
  this.verificarListaNegra = function(){
			ListasNegrasService.query({idCliente:sessionStorage.id, idComplejo:$scope.idComplejo}).$promise.then(function(data){
                
                 console.log(data);
                 if(data != null && data != undefined && data[0] != undefined)
                 {
                     if(data[0].FechaIngreso != null && data[0].FechaIngreso != undefined)
                        $scope.fechaIngresoListaNegra = data[0].FechaIngreso;
                     else
                        $scope.fechaIngresoListaNegra = 0;     
                 }
                else
                    $scope.fechaIngresoListaNegra = 0;
                 
            });
	};
        
    
    
    this.getHorasDisponiblesByFecha = function(fecha, horaActual){
			ReservasService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo, fecha:fecha}).$promise.then(function(data){
                    $scope.HorasDisponibles = data;
                
                
                if($scope.HorasDisponibles.length == 0)
                {
                    bootbox.alert("No existen horarios disponibles para la fecha seleccionada...", function() {});
                    self.horasD = [];
                    self.horasH = [];
                    $scope.dt = null;
                    self.paso1Completo = false;
                    $scope.precioAPagar = 0;
                    $scope.restante = 0;
                }
                else
                {
                
                    this.selectedHoraDId = "1";

                    self.horasD = [];
                    angular.forEach(data, function(aux)
                    {

                      //console.log(aux.hora);
                      var sID = parseInt(aux.hora.substring(0,2));  
                      
                      //SI QUIERO RESERVAR HOY, CALCULO A PARTIR DE LA HORA QUE ES EN ESTE MOMENTO PARA LLENAR EL COMBO DE HORAS.    
                      if(horaActual != -1)
                      {
                        if(sID > horaActual)
                        {
                          var sDesc = sID + ':00 hs';
                          self.horasD.push({id: sID, desc: sDesc});             
                        }
                      }
                     else
                     {
                         //SI NO QUIERO RESERVAR HOY, CARGO EL COMBO NORMALMENTE, CON LAS HORAS EN LAS QUE ABRE EL COMPLEJO.
                        var sDesc = sID + ':00 hs';
                        self.horasD.push({id: sID, desc: sDesc});              
                     }
                     

                    });

                    self.selectedHoraDId = self.horasD[0].id;  

                    /****************************************************************************************/

                    var dia = $scope.fechaElegida.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
                    var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
                    var horaHastaDia = -1; //Hora que cierra para el día seleccionado.

                    if(dia == 0)
                        dia = 7;

                    var HoraAbre = -1;
                    var HoraCierra = -1;

                    angular.forEach(self.diasComplejo, function(aux) {
                        if(parseInt(aux.iddia) == dia)
                        {
                            HoraAbre = parseInt(aux.HoraDesde.substring(0,2));
                            HoraCierra = parseInt(aux.HoraHasta.substring(0,2));
                            if(HoraCierra == 0)
                                HoraCierra = 24;

                            return;
                        }
                    });

                    self.getHorariosReservasByDia(fecha,  self.selectedHoraDId, HoraCierra);    

                }
                
	       });
        
        };
    
    
    this.getHorariosReservasByDia = function(fecha, horaSeleccionada, horaCierra)
    {
        ReservasService.query({idComplejoo:$scope.idComplejo, idCanchaa:$scope.idCancha, fechaHorarios:fecha, bReservas:1}).$promise.then(function(data){
            $scope.HorasReservasDia = data;
            //console.log('data' + $scope.HorasReservasDia[0].HoraInicio);
            
            
            self.horasH = [];
            
            if($scope.HorasReservasDia.length > 0) //Si hay reservas para el dia, sino, lo manejo como lo hago actualmente...
            {
                //for de 23 a 24
                for(i=horaSeleccionada+1; i<=horaCierra; i++)
                {
                    var bAgrego = true;
                    
                    //HoraInicio y Fin de las reservas del dia ordenadas por HoraInicio.
                    angular.forEach($scope.HorasReservasDia, function(aux)
                    {   
                        var horaIni = parseInt(aux.HoraInicio.substring(0,2));
                        var horaFn = parseInt(aux.HoraFin.substring(0,2));
                        if(i > horaIni && i <= horaFn)
                        {
                            //console.log('no agrego');
                            bAgrego = false;
                            console.log('NO AGREGO A ' + i);
                            return;
                        }	

                    });

                    if(bAgrego)
                    {
                        var sDesc = i + ':00 hs.';
                        console.log('AGREGO A ' + i);
                        self.horasH.push({id: i, desc: sDesc});
                        
                        //console.log('se agregaron--> ' + self.horasH.length);
                        self.selectedHoraHId = self.horasH[0].id; 
                    }
                    else
                        {
                            self.calcularPrecioReservar();
                            return; //Ya tengo que salir del for principal acá...
                        }
                        
                }
                
            }
            else
            {
                //for de 23 a 24
                for(i=horaSeleccionada+1; i<=horaCierra; i++)
                {
                    var sDesc = i + ':00 hs.';
                    self.horasH.push({id: i, desc: sDesc});
                    self.selectedHoraHId = self.horasH[0].id; 
                    
                }
            }
                
            //console.log('SELECTED D-> ' + self.selectedHoraDId);
            //console.log('SELECTED H-> ' + self.selectedHoraHId);
            self.calcularPrecioReservar();
                     
        });
        
        
    };
    
    this.getFechasReservaFija = function(hDesde, idDia, anio, fprimerReserva){
			ReservasFijasService.query({pIdCancha:$scope.idCancha, pIdComplejo:$scope.idComplejo, pHoraDesde:hDesde, pIdDia:idDia, pAnio:anio, pFechaPrimerReserva:fprimerReserva}).$promise.then(function(data){
                    $scope.FechasReservaFija = data;
                    //console.log('PRIMERA FECHA FIJA->' + $scope.FechasReservaFija[0].fecha);
                
                
                $scope.noDisponibles = [];
                console.log(data);
                var hHasta = self.selectedHoraHId + ":00:00";
                if($scope.FechasReservaFija.length == 0)
                {
                    bootbox.alert("La reserva fija no se hará ya que no hay días disponibles en lo que resta del año para el horario seleccionado...", function() {});
                }
                else
                {
                    var noDispEnString = "";
                    var importeTotal = parseFloat($scope.precioAPagar + $scope.restante);
                    var horaHasta = self.selectedHoraHDId + ":00:00";
                     angular.forEach($scope.FechasReservaFija, function(aux) {
                         //Guardo las fechas no disponibles para la reserva fija, asi se las muestro al cliente.
                        if(aux.NoDisponible != undefined && aux.NoDisponible != null && aux.NoDisponible != "")
                        {

                            $scope.noDisponibles.push(aux.NoDisponible); 
                            noDispEnString += aux.NoDisponible + "<br>";
                        }
                        else
                        {
                            $scope.listasReservasFijas.push({idCliente: sessionStorage.id, idComplejo: $scope.idComplejo, idCancha: $scope.idCancha, fechaPartido: aux.fecha, horaD: hDesde, horaH: hHasta, importeAPagar: importeTotal, pagado: 0, porcentajePago: 0, estadoReserva: 3, "usuarioReserva": ''});
                            
                        }
                         
                     });
                    
                 
                    if($scope.noDisponibles.length > 0)
                    {
                        var mensaje = 'La reserva fija se realizará para el día y horario elegido en lo que resta del año. \n ';
                        
                        mensaje += 'Sin embargo las siguientes fechas no se podrán reservar ya que no están disponibles: <br> ';
                        mensaje += noDispEnString + "\n \n" + '¿Desea realizar la reserva fija igualmente?';
                        
                        bootbox.confirm(mensaje, function(result) {
                        if(result)
                        {
                            bootbox.alert("Por favor completá el pago de la reserva (sólo se paga lo correspondiente a la primer reserva), las fechas restantes las reservará el sistema, y se pagarán personalmente en el complejo correspondiente. ", function() {});
                            
                            $scope.aceptaReservaFija = 1;
            
                        }
                        else
                        {
                            $scope.aceptaReservaFija = 0;
                        }

                        }); 
                        
                    }
                    else
                    {
                        //Se puede hacer la reserva fija por el resto del año para todos los dias!.
                        var mensaje = 'La reserva fija se realizará para el día y horario elegido en lo que resta del año. \n ';
                        mensaje += noDispEnString + "\n \n" + '¿Desea realizar la reserva fija?';
                        bootbox.confirm(mensaje, function(result) {
                        if(result)
                        {
                            bootbox.alert("Por favor completá el pago de la reserva (sólo se paga lo correspondiente a la primer reserva), las fechas restantes las reservará el sistema, y se pagarán personalmente en el complejo correspondiente. ", function() {});
                            
                            $scope.aceptaReservaFija = 1;
                        }
                        else
                            $scope.aceptaReservaFija = 0;
                            
                        });
                    }
                }
                
	       });
        
        };
   
    
    this.mostrarReservar = function(){
        
        if($scope.fechaIngresoListaNegra == 0)
        {
          ReservasTempService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo}).$promise.then(function(data){
              console.log(data[0].existe);
              if(data[0].existe == 1)
              {
                bootbox.alert("La cancha está siendo reservada por otra persona. \n Por favor volvé a intentarlo en unos segundos...", function() {});  
                return false;  
              }
              else
              {
                  $scope.stopTimer();
                  $scope.startTimer();
                  $('html,body').animate({scrollTop:1000},'slow');
                  
                  var resTempNueva = new ReservasTempService();
                    resTempNueva.data = {
                        "idCancha": $scope.idCancha,
                        "idComplejo": $scope.idComplejo,
                        "valor": 0
                    };  
        
        
                ReservasTempService.save(resTempNueva.data, function(reponse){
                        idRetorno = reponse.data[0];
                        console.log('se guardo la res TEMP -->' + idRetorno);
                        //Acá iniciar el TIMER!!!
                      },function(errorResponse){
                        console.log('ERROR res temp...' + errorResponse); 
                     });
                  
                  $state.go('Clientes.verCancha.Reservar');                    
              }
                
          });


        }
        else
        {
            var msj = 'No podés reservar ya que estás en la lista negra del complejo desde el ' + $scope.fechaIngresoListaNegra;
            bootbox.alert(msj, function() {});
        }
    };

    this.borrarReservaTemp = function(){
            ReservasTempService.delete({idCancha: $scope.idCancha, idComplejo: $scope.idComplejo}, function(reponse){
                    console.log('Se borro la res TEMP ->' + reponse.data);
                  },function(errorResponse){
                    console.log('ERROR al borrar res TEMP ->' + reponse.data);
                 });
    };
    
    
    //Evento destroy del controller.
    $scope.$on("$destroy", function(){
        //Si se estaba reservando y se cambia de pagina o se cierra la pestaña,
        //borro la reserva temporal para que no quede bloqueada.
        console.log($state.current.name);
        if($state.current.name != 'Clientes.verCancha' && $state.current.name != 'Clientes.verCancha.Reservar.ok')
            self.borrarReservaTemp();
    });
    
    
    
    //Si el cliente tiene tarjeta guardada, traigo los datos de la misma...
    this.getTarjeta = function(){
            var id = sessionStorage.id;
			TarjetasClienteService.query({idCliente:id, idAux:0}).$promise.then(function(data){
                    
                    if(data != null && data != undefined)
                    {
                        if(data[0].NroTarjeta != null && data[0].NroTarjeta != undefined)
                             document.getElementById("cardNumber").value = data[0].NroTarjeta;

                        if(data[0].Anio != null && data[0].Anio != undefined)
                             document.getElementById("expYear").value = data[0].Anio;

                        if(data[0].Mes != null && data[0].Mes != undefined)
                        {
                            var sMes = data[0].Mes.toString();
                            if(data[0].Mes < 10)
                                sMes = "0" + sMes;
                            
                            document.getElementById("expMonth").value = sMes;
                        }
                             
                        
                        self.bTarjetaDeLaBD = true;
                    }
                        
            });
	};
    
    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });

        
    });
    

    this.paso1Click = function(){
        $('ul.setup-panel li:eq(1)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        $(this).remove();
        
        function pad(n) {return n < 10 ? "0"+n : n;}
            $scope.fechaPartido = pad($scope.fechaElegida.getDate())+"/"+pad($scope.fechaElegida.getMonth()+1)+"/"+$scope.fechaElegida.getFullYear();
        
        
        if(self.estaLogueado)
            self.getTarjeta();
        
        /////////
        
        if(document.getElementById('chkReservaFija').checked)
        {
            //Si quiere reserva fija, traigo todos los días que se van a reservar de acá a fin de año.
            var hDesde = self.selectedHoraDId + ":00:00";
            var idDeDia = $scope.fechaElegida.getDay() == 0 ? 7 : $scope.fechaElegida.getDay();
            var anio = $scope.fechaElegida.getFullYear();
            function pad(n) {return n < 10 ? "0"+n : n;}
            var fPrimerReser = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
            
            self.getFechasReservaFija(hDesde, idDeDia, anio, fPrimerReser);
            
        }
        //*****//
        
        
    };
    
    
    
    
    this.reservar = function(){
    
        var ReservaNueva = new ReservasService();
        
        self.Reserva.fechaPartido = $scope.fechaPartido;
        self.Reserva.horaD = $scope.hDesdePartido;
        self.Reserva.horaH = $scope.hHastaPartido;
        var precioTotal =  $scope.precioAPagar + $scope.restante;
        self.Reserva.importeAPagar = precioTotal;
        self.Reserva.pagado = $scope.precioAPagar;
        self.Reserva.porcentajePago = $scope.porcentajePago;
        var estadoRes = (document.getElementById('rbPagaCanchaCompleta').checked) ? 2 : 1;
        self.Reserva.estadoReserva = estadoRes;
        self.Reserva.usuarioReserva = '';
        
        console.log(self.Reserva.fechaPartido);
        console.log(self.Reserva.horaD);
        console.log(self.Reserva.horaH);
        
        ReservaNueva.data=self.Reserva;
        
        ReservasService.save(ReservaNueva.data, function(reponse){
                idReserva = reponse.data[0];
                console.log('idReserva -->' + idReserva);
        
        var horario = self.selectedHoraDId + ":00 hs. a " + self.selectedHoraHId + ":00 hs.";
        var msjMail = "<u>" + sessionStorage.usuario + "</u>" + ": Realizaste una reserva de la cancha <b>" + $scope.cancha[0].nombre + "</b> del complejo <b>";
            msjMail += $scope.cancha[0].Complejo + "</b> para el dia <b>" + $scope.fechaPartido + " de "+horario+"</b> <br><br>";
            msjMail += "<u>Direccion de " + $scope.cancha[0].Complejo +":</u><b> " + $scope.cancha[0].Calle + " " + $scope.cancha[0].Altura + ", " + $scope.cancha[0].Localidad + " - " + $scope.cancha[0].Provincia + "</b><br><br>";
            msjMail += "Pagaste <b>$" + $scope.precioAPagar + "</b><br>";
            if($scope.restante > 0)
                msjMail += "Debes <b>$" + $scope.restante + "</b><br>";
            msjMail += "De un total de <b>$" + parseFloat($scope.precioAPagar + $scope.restante) + "</b><br><br><br>";
            msjMail += "Muchas gracias por confiar en nosotros, el equipo de Resergol desea que disfrutes el partido!";
            
            
                
            
        //Si realizó reserva fija, hago todas las reservas despues de haber reservado la primera normalmente.
        if($scope.aceptaReservaFija == 1)
        {
            var ReservaFijaNueva = new ReservasFijasService();
            ReservaFijaNueva.data = $scope.listasReservasFijas;
            console.log(ReservaFijaNueva.data[0]);
            ReservasFijasService.save(ReservaFijaNueva.data, function(reponse){    
                idReservaFija = reponse.data[0];
                //Mail para avisar de la reserva fija y de los dias que no se reservó si es que esta ocupada en el resto del año.
                if(idReservaFija > 0)
                {
                    
                    var sIddia = $scope.fechaElegida.getDay();
                    var sDia = "";
                    console.log('DIAAAAAAAAAA--->' + sIddia);
                    switch(sIddia) {
                        case 1:
                            sDia = "Lunes";
                            break;
                        case 2:
                            sDia = "Martes";
                            break;
                        case 3:
                            sDia = "Miercoles";
                            break;
                        case 4:
                            sDia = "Jueves";
                            break;
                        case 5:
                            sDia = "Viernes";
                            break;
                        case 6:
                            sDia = "Sabados";
                            break;
                        case 0:
                            sDia = "Domingos";
                            break;
                    }
                    
                    //console.log(dia);
                    var MailResFija = "<u>" + sessionStorage.usuario + "</u>" + ": Realizaste una reserva fija de la cancha <b>" + $scope.cancha[0].nombre + "</b> del complejo <b>";
                    MailResFija += $scope.cancha[0].Complejo + "<br></b> para los dias <b>" + sDia + " restantes del a&ntilde;o de "+horario+"</b> <br><br>";
                    
                    //Si hay dias de la reserva fija que no se pudieron reservar xq estaban ocupados, vuelvo a avisar en el mail.
                    if($scope.noDisponibles.length > 0)
                    {
                        var sFechasNoDisp = "";
                        angular.forEach($scope.noDisponibles, function(noDis) {
                            sFechasNoDisp += noDis + " <br>";
                        });
                        
                        MailResFija += "Excepto las siguientes fechas que se encuentran reservadas por otra persona: <br>";
                        MailResFija += "<b> "+ sFechasNoDisp +" </b><br><br>";
                    }
                    
                    MailResFija += "<u>Direccion de " + $scope.cancha[0].Complejo +":</u><b> " + $scope.cancha[0].Calle + " " + $scope.cancha[0].Altura + ", " + $scope.cancha[0].Localidad + " - " + $scope.cancha[0].Provincia + "</b><br><br>";
                    MailResFija += "Muchas gracias por confiar en nosotros, el equipo de Resergol desea que disfrutes cada uno de los partidos restantes del a&ntilde;o!";
                    
                    self.mandarMail(MailResFija, 'Nueva Reserva Fija! Gracias por confiar en Resergol');
                }
                
            },function(errorResponse){
                console.log('ERROR res fija...'); 
            });
        }    
            
         if(document.getElementById('chkGuardaTarjeta').checked)
             self.guardarTarjeta();
        
            self.borrarReservaTemp();
            self.mandarMail(msjMail, 'Reservaste! Gracias por confiar en Resergol'); //Mando mail de la reserva que se realizo.
            
            $state.go('Clientes.verCancha.Reservar.ok'); 
            
          },function(errorResponse){
            console.log('ERROR...'); 
         });
        
        
        
        
    };
    
    this.cancelarPaso = function(){
        $scope.stopTimer();
        self.borrarReservaTemp();
    };
    
    this.pagarYReservar = function(){
        
        bootbox.confirm("¿Seguro desea realizar el pago?", function(result) {
        if(result)
        {
            $('ul.setup-panel li:eq(2)').removeClass('disabled');
            
            $('ul.setup-panel li a[href="#step-3"]').trigger('click');
            //$(this).remove();
            $(this).prop('disabled', true);
            $('ul.setup-panel li:eq(0)').addClass('disabled');
            $('ul.setup-panel li:eq(1)').addClass('disabled');
            
            
            //Preparo los parametros para reservar la cancha.
            function pad(n) {return n < 10 ? "0"+n : n;}
            //$scope.fechaPartido = pad($scope.fechaElegida.getDate())+"/"+pad($scope.fechaElegida.getMonth()+1)+"/"+$scope.fechaElegida.getFullYear();
            //var fechaPartido = $scope.fechaElegida.toLocaleDateString();
            $scope.hDesdePartido = self.selectedHoraDId + ":00:00";
            $scope.hHastaPartido = self.selectedHoraHId + ":00:00";        
            //console.log(fechaPartido);
            
            //******************************************************************************************************************//
            
            self.reservar();
            
        }
  
        }); 

    };
    
    
    this.guardarTarjeta = function(){
        
        var TarjetaNueva = new TarjetasClienteService();
        TarjetaNueva.data = {
                        "idCliente": self.Tarjeta.idCliente,
                        "nroTarjeta": document.getElementById("cardNumber").value,
                        "mes": document.getElementById("expMonth").value,
                        "anio": document.getElementById("expYear").value,
                        "codigo": document.getElementById("cvCode").value,
                        "valor": 0
  	       };  
        
        
        TarjetasClienteService.save(TarjetaNueva.data, function(reponse){
                idRetorno = reponse.data[0];
                console.log('retorno -->' + idRetorno);
              },function(errorResponse){
                console.log('ERROR TARJETA...' + errorResponse); 
             });
    };
    
    
    
     /*INICIO FECHAS*/
    /*PARA FECHAS*/

     $scope.today = function() {         
        $scope.dt = new Date();
      };
      //$scope.today();

      $scope.clear = function() {
        $scope.dt = null;
      };
    
         
      $scope.inlineOptions = {
        customClass: getDayClass,
        minDate: new Date(),
        showWeeks: true,
        showButtonPanel: false
      };

      $scope.dateOptions = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        //maxDate: new Date(2020, 5, 22), 
        minDate: new Date(),
        //Hago que no se pueda reservar a mas de 2 meses a futuro.
        maxDate: new Date().getDate+60,
        startingDay: 1  
      };


      // Disable weekend selection
      function disabled(data) {
        var date = data.date,
          mode = data.mode;
          //Acá deshabilito los días que el complejo no abre.
          /*
          0 = domingo.
          1 = lunes.
          2 = martes.
          3 = miercoles.
          4 = jueves.
          5 = viernes.
          6 = sabado.
          */
         var diasQueAbre = []; 
         angular.forEach(self.diasComplejo, function(aux) {
             switch(aux.iddia) {
                case '1':
                    diasQueAbre.push(1);
                    break;
                case '2':
                    diasQueAbre.push(2);
                    break;
                case '3':
                    diasQueAbre.push(3);
                    break;
                case '4':
                    diasQueAbre.push(4);
                    break;
                case '5':
                    diasQueAbre.push(5);
                    break;
                case '6':
                    diasQueAbre.push(6);
                    break;
                case '7':
                    diasQueAbre.push(0);
                    break;
            }
             
          });
          
          return mode === 'day' && diasQueAbre.indexOf(date.getDay()) === -1;
      }
    
      $scope.dateOptionsFechaFiltro = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.toggleMin = function() {
        $scope.dateOptionsFechaFiltro.minDate = new Date();
      };

      $scope.toggleMin();

      $scope.open1 = function() {
        $scope.popup1.opened = true;
      };

      $scope.open2 = function() {
        $scope.popup2.opened = true;
      };

      $scope.setDate = function(year, month, day) {
        $scope.dt = new Date(year, month, day);
      };

      $scope.formats = ['dd/MM/yyyy', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
      $scope.format = $scope.formats[0];
      $scope.altInputFormats = ['M!/d!/yyyy'];

      $scope.popup1 = {
        opened: false
      };

      $scope.popup2 = {
        opened: false
      };

      var tomorrow = new Date();
      tomorrow.setDate(tomorrow.getDate() + 1);
      var afterTomorrow = new Date();
      afterTomorrow.setDate(tomorrow.getDate() + 1);
      $scope.events = [
        {
          date: tomorrow,
          status: 'full'
        },
        {
          date: afterTomorrow,
          status: 'partially'
        }
      ];

      function getDayClass(data) {
        var date = data.date,
          mode = data.mode;
        if (mode === 'day') {
          var dayToCheck = new Date(date).setHours(0,0,0,0);

          for (var i = 0; i < $scope.events.length; i++) {
            var currentDay = new Date($scope.events[i].date).setHours(0,0,0,0);

            if (dayToCheck === currentDay) {
              return $scope.events[i].status;
            }
          }
        }

        return '';
      }
    /*FIN FECHAS*/
	
    
        //////////////////////////////////////////////////////////
    
    this.cambiaFecha = function(dt)
    {   
        function pad(n) {return n < 10 ? "0"+n : n;}
        $scope.fechaElegida = dt;
        
        var hoy = new Date();
        hoy = pad(hoy.getFullYear()+"-"+pad(hoy.getMonth()+1)+"-"+hoy.getDate());
        
        var fechaSelect = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
        
        
        console.log('hoy-> ' + hoy);
        console.log('eleccion-> ' + fechaSelect);
        
        var horaActual = -1;
        if(hoy == fechaSelect) //Si quiero reservar HOY. y son las 5, no voy a poder reservar a las 3 o a las 4...
        {
            var HoyHora = new Date();
            horaActual = HoyHora.getHours();
            console.log('horaActual------> ' + horaActual);
        }
            
        /*--------------------------------------------------------------------------------*/
        
        self.getHorasDisponiblesByFecha(fechaSelect, horaActual);
        
    };
    
    
    
    this.changeSelectedHoraD = function(selectedHoraDId)
    {
        var dia = $scope.fechaElegida.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
        var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
        var horaHastaDia = -1; //Hora que cierra para el día seleccionado.
        
        if(dia == 0)
            dia = 7;
        
        var HoraAbre = -1;
        var HoraCierra = -1;
        angular.forEach(self.diasComplejo, function(aux) {
            if(parseInt(aux.iddia) == dia)
            {
                HoraAbre = parseInt(aux.HoraDesde.substring(0,2));
                HoraCierra = parseInt(aux.HoraHasta.substring(0,2));
                if(HoraCierra == 0)
                    HoraCierra = 24;
                
                return;
            }
        });
        
        //console.log(selectedHoraDId); 
        /*-----------------------------------------------------------------------------*/
        
        function pad(n) {return n < 10 ? "0"+n : n;}
        
        var fechaSelect = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
        
        if(self.horasD.length > 0)
            self.getHorariosReservasByDia(fechaSelect, selectedHoraDId, HoraCierra);
        
        //self.calcularPrecioReservar();
        
    };
    
    
    
    
    this.changeSelectedHoraH = function(selectedHoraHId)
    {
        self.calcularPrecioReservar();
        
    };
    
    
    this.validarFechaYHora = function()
    {   
        var fecha = document.getElementById("fecha").value;
        if(fecha == "" || fecha == null || fecha == undefined)
            return false;
        
        if(self.selectedHoraDId == null || self.selectedHoraHId == null)
            return false;
        
        
        return true;
        
        
    };
    
    $scope.clickRadioButton = function()
    {
        self.calcularPrecioReservar();
    };
    
    
    this.calcularPrecioReservar = function()
    {
        //Calculo el precio a pagar siempre y cuando se haya elegido una fecha y hora desde y hasta.
        if(this.validarFechaYHora())
        {
            console.log('CALCULANDO PRECIO.....');
            ////////NUEVO////////////////////////////////////////////////////
            //Traigo las hora desde y hasta.
            var hd = parseInt(self.selectedHoraDId);
            var hh = parseInt(self.selectedHoraHId);
            
            
            if(self.selectedHoraDId == '00')
                hd = 0;
            else if(self.selectedHoraDId == '01')
                hd = 1;
            
            if(self.selectedHoraHId == '00')
                hh = 0;
            else if(self.selectedHoraHId == '01')
                hh = 1;
            
            //console.log('hd->' + hd);
            //console.log('hh->' + hh);
            
            if(hh == 0)
                hh = 24;
            else if(hh == 1)
                hh = 25;
            
           
            
            //Calculo cuantas horas se van a alquilar...
            var horasAlq = hh - hd;
            console.log('horas alq--> ' + horasAlq);
            var precio = parseFloat($scope.cancha[0].Precio);
            var horaLuz = -1;
            if($scope.cancha[0].HoraCobroLuz != undefined && $scope.cancha[0].HoraCobroLuz != null)
                horaLuz = $scope.cancha[0].HoraCobroLuz.substring(0,2);
            console.log('luz desde-->' + horaLuz);
            var porcentajeLuz = 0;
            if($scope.cancha[0].PorcentajeLuz != null && $scope.cancha[0].PorcentajeLuz != undefined);
                porcentajeLuz = parseFloat($scope.cancha[0].PorcentajeLuz);
                    
              console.log('porcent luz-->' + porcentajeLuz);
            
            var horasConLuz = 0;
            if($scope.cancha[0].Luz == 1 && horaLuz != -1)
            {
                for (i=0; i<horasAlq; i++)
                {
                    var num =  parseInt(hd + i);
                    //console.log(num);
                    if(num >= horaLuz)
                        horasConLuz++;
                }   
            }
            
            var precioAMostrar = 0;
            if(horasConLuz == 0)
                precioAMostrar = precio * horasAlq;
            else if(horasConLuz == horasAlq){
                precioAMostrar = (precio * horasAlq) + ((precio * horasAlq) * porcentajeLuz / 100);
                //console.log('precio*horasalq->' + precio * horasAlq);
                //console.log('*' + porcentajeLuz);
            }
            else //Si una parte se cobra con luz y otra no...
                {
                    //console.log('porcentajeluz--> ' + porcentajeLuz);
                    var precioCLuz = (precio * horasConLuz) + ((precio * horasConLuz) * porcentajeLuz / 100);
                    var precioSLuz = (horasAlq - horasConLuz) * precio;
                    
                    precioAMostrar = precioCLuz + precioSLuz;
                }
            
            //console.log('precioamostrar-> ' + precioAMostrar);
            
            if (document.getElementById('rbPagaCanchaCompleta').checked)
            {
                $scope.precioAPagar = precioAMostrar;
                $scope.restante = 0;
                $scope.porcentajePago = 100;
            }
            else if(document.getElementById('rbPagaSeña').checked)
            {
                var PorcentSenia = 0;
                //console.log('porcentttttt ' + $scope.cancha[0].PorcentSenia);
                if($scope.cancha[0].PorcentSenia != undefined && $scope.cancha[0].PorcentSenia != null)
                    PorcentSenia = parseFloat($scope.cancha[0].PorcentSenia);
                
                if(PorcentSenia > 0)
                    {
                        $scope.precioAPagar = parseFloat(precioAMostrar * PorcentSenia) / 100 ;
                        $scope.restante = parseFloat(precioAMostrar - $scope.precioAPagar);
                        var porcentPago = parseFloat($scope.precioAPagar / ($scope.precioAPagar + $scope.restante) * 100);
                        $scope.porcentajePago = porcentPago;
                    }
                else
                    {
                        $scope.precioAPagar = 0;
                        $scope.restante = parseFloat(precioAMostrar);
                        $scope.porcentajePago = 0;
                    }
            }
            
            
            self.paso1Completo = true;
            console.log('PASO 1 COMPLETO->' + self.paso1Completo);
            
        }
        else
        {
            
            self.paso1Completo = false;
            console.log('PASO 1 COMPLETO->' + self.paso1Completo);
            
        }
            
        
};
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var $form = $('#payment-form');
//$form.on('submit', payWithStripe);

/* If you're using Stripe for payments */
//function payWithStripe(e) {
//    e.preventDefault();

    /* Visual feedback */
  //  $form.find('[type=submit]').html('Validando <i class="fa fa-spinner fa-pulse"></i>');

    //var PublishableKey = 'pk_test_6pRNASCoBOKtIshFeQd4XMUh'; // Replace with your API publishable key
    //Stripe.setPublishableKey(PublishableKey);
    //Stripe.card.createToken($form, function stripeResponseHandler(status, response) {
    //    console.log
    //    if (response.error) {
            /* Visual feedback */
    //$form.find('[type=submit]').html('Intente nuevamente');
            /* Show Stripe errors on the form */
    //        $form.find('.payment-errors').text(response.error.message);
    //        $form.find('.payment-errors').closest('.row').show();
    //    } else {
            /* Visual feedback */
    //        $form.find('[type=submit]').html('Processing <i class="fa fa-spinner fa-pulse"></i>');
            /* Hide Stripe errors on the form */
      //      $form.find('.payment-errors').closest('.row').hide();
        //    $form.find('.payment-errors').text("");
          //  // response contains id and card, which contains additional card details
            //var token = response.id;
           // console.log(token);
            // AJAX
            //$.post('/account/stripe_card_token', {
            //        token: token
            //    })
                // Assign handlers immediately after making the request,
            //    .done(function(data, textStatus, jqXHR) {
            //        $form.find('[type=submit]').html('Pago realizado <i class="fa fa-check"></i>').prop('disabled', true);
              //  })
                //.fail(function(jqXHR, textStatus, errorThrown) {
                  //  $form.find('[type=submit]').html('Hubo un error').removeClass('success').addClass('error');
                    /* Show Stripe errors on the form */
                    //$form.find('.payment-errors').text('Intente nuevamente.');
                    //$form.find('.payment-errors').closest('.row').show();
                //});
        //}
    //});
//}

/* Form validation */
jQuery.validator.addMethod("month", function(value, element) {
  return this.optional(element) || /^(01|02|03|04|05|06|07|08|09|10|11|12)$/.test(value);
}, "Mes inválido...");

jQuery.validator.addMethod("year", function(value, element) {
    var hoy = new Date();
    var anioMax = hoy.getFullYear().toString();
    anioMax = parseInt(anioMax.substring(2,4));
    var anioMin = anioMax;
    anioMax += 5;    
  return this.optional(element) || (/^[0-9]{2}$/.test(value) && value >= anioMin && value <= anioMax);
}, "Año inválido...");
    
validator = $form.validate({
    rules: {
        cardNumber: {
            required: true,
            creditcard: true,
            digits: true
        },
        expMonth: {
            required: true,
            month: true
        },
        expYear: {
            required: true,
            year: true
        },
        cvCode: {
            required: true,
            digits: true
        }
    },
    highlight: function(element) {
        $(element).closest('.form-control').removeClass('success').addClass('error');
    },
    unhighlight: function(element) {
        $(element).closest('.form-control').removeClass('error').addClass('success');
    },
    errorPlacement: function(error, element) {
        $(element).closest('.form-group').append(error);
    }
});

this.paymentFormReady = function() {
    if ((($form.find('[name=cardNumber]').hasClass("success") &&
        $form.find('[name=expMonth]').hasClass("success") &&
        $form.find('[name=expYear]').hasClass("success")) /*|| self.bTarjetaDeLaBD*/) &&
        $form.find('[name=cvCode]').val().length > 2 && $form.find('[name=cvCode]').val().length < 5) {
        return true;
    } else {
        return false;
    }
    
}

//$form.find('[type=submit]').prop('disabled', true);
var readyInterval = setInterval(function() {
    
    if (self.paymentFormReady()) {
        $form.find('[type=submit]').prop('disabled', false);
        //clearInterval(readyInterval);
    }
    else
        $form.find('[type=submit]').prop('disabled', true);
}, 250);
    ////////////////////////////////////////////////////////**************************************************************
    

});
