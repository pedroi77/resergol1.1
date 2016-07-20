var resergolApp = angular.module("resergolApp");

resergolApp.controller("InscripcionTorneoController", function($scope, $rootScope, $sce, store, $timeout, $state,  $stateParams, ReservasService, TarjetasClienteService, ListasNegrasService, ReservasTempService, EquiposService, EquipoTorneoService, EquiposImagenesAltaService, EquiposImagenesDBService, EquiposImagenesService, $compile, Upload, EquipoTorneoService, TorneoService){
	
    var self = this;
    
    this.estaLogueado = false;
    $scope.tiempoTimer = 300;
    $rootScope.$state = $state;
    $scope.torneo = [];
    $scope.idTorneo = $stateParams.idTorneo;
    //$scope.idTorneo = 3;
    $scope.idDuenio = -1;
    $scope.idCliente = sessionStorage.id;
    this.equiposTor = null;
    
    this.msjPantalla ="" ;
    this.archivoInvalido = true;
    this.bMensaje = false;
    this.imagenes = {
        tipos: [],
        selectedOption: {idComplejo: '1', idCancha:'1', nombre: '', url:'', imagen:''} 
    };    
    
    this.vURL = "/../resergol1.1/images/complejos/complejo2.jpg";

    this.paso1Completo = false;
    $scope.precioAPagar = 0;
    $scope.restante = 0;
    $scope.porcentajePago = 0;

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
                        estadoReserva: 2, //1-Señado 2-PagoCompleto
                        idTorneo:$scope.idTorneo
                      };

    this.Tarjeta ={
                        idCliente:sessionStorage.id,
                        nroTarjeta:'123456789123456',
                        mes: 11,
                        anio: 18,
                        codigo: '12'
                      };
    
    
         var token = store.get("token") || null;
         var sesion = sessionStorage.usuario || null;
        
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
    
    
    TorneoService.query({idTorneo:$scope.idTorneo}).$promise.then(function(data) {
        $scope.torneo = data[0];
        $scope.precioAPagar = $scope.torneo.PrecioInscripcion;
        console.log($scope.torneo);
    });
    
    this.imprimirComprobante = function() {
      //Traigo el horario de la reserva.    
      
      //var horario = self.selectedHoraDId + ":00 hs. a " + self.selectedHoraHId + ":00 hs.";

      //Configuro el PDF.    
        
      /*var doc = new jsPDF();
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
        
      window.open(string, "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top="+topPosition+",left="+leftPosition+",width=500,height=500");*/  
    };
    
     

    
  this.verificarListaNegra = function(){
			ListasNegrasService.query({idCliente:sessionStorage.id, idComplejo:1}).$promise.then(function(data){
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
        
    
    
    
    /*this.mostrarReservar = function(){
        
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
    };*/

    this.borrarReservaTemp = function(){
            ReservasTempService.delete({idCancha: $scope.idCancha, idComplejo: $scope.idComplejo}, function(reponse){
                    console.log('Se borro la res TEMP ->' + reponse.data);
                  },function(errorResponse){
                    console.log('ERROR al borrar res TEMP ->' + reponse.data);
                 });
    };
    
    
    //Evento destroy del controller.
    /*$scope.$on("$destroy", function(){
        //Si se estaba reservando y se cambia de pagina o se cierra la pestaña,
        //borro la reserva temporal para que no quede bloqueada.
        console.log($state.current.name);
        if($state.current.name != 'Clientes.verCancha' && $state.current.name != 'Clientes.verCancha.Reservar.ok')
            self.borrarReservaTemp();
    });*/
    
    
    
    //Si el cliente tiene tarjeta guardada, traigo los datos de la misma...
    this.getTarjeta = function(){
            var id = sessionStorage.id;
			TarjetasClienteService.query({idCliente:id, idAux:0}).$promise.then(function(data){
                    console.log(data);
                    if(data != null && data != undefined)
                    {
                        if(data[0].NroTarjeta != null && data[0].NroTarjeta != undefined)
                             document.getElementById("cardNumber").value = data[0].NroTarjeta;

                        if(data[0].Anio != null && data[0].Anio != undefined)
                             document.getElementById("expYear").value = data[0].Anio;

                        if(data[0].Mes != null && data[0].Mes != undefined)
                             document.getElementById("expMonth").value = data[0].Mes;
                    }
                        
            });
	};
    
    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });
 
    });
    

    /*this.paso1Click = function(){
        $('ul.setup-panel li:eq(1)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        $(this).remove();
        
        function pad(n) {return n < 10 ? "0"+n : n;}
            $scope.fechaPartido = pad($scope.fechaElegida.getDate())+"/"+pad($scope.fechaElegida.getMonth()+1)+"/"+$scope.fechaElegida.getFullYear();
        
        
        if(self.estaLogueado)
            self.getTarjeta();
     
    };*/
    
    
    if(self.estaLogueado)
            self.getTarjeta();
    
    this.reservar = function(){
    
        //GUARDO EL EQUIPO
        //self.vURL = self.vURL.replace('//', '/');
        var url = null;
        if(self.vURL != '/../resergol1.1/images/complejos/complejo2.jpg')
            url = self.vURL;
                
        var EquipoNuevo = new EquiposService();
        EquipoNuevo.data = {
                        "idCliente": $scope.idCliente,
                        "nombre": document.getElementById("nombreEquipo").value,
                        "url": url,
                        "pResultado": 0
  	       };  
        
        
        EquiposService.save(EquipoNuevo.data, function(reponse){
                idRetorno = reponse.data[0];
                console.log('retorno -->' + idRetorno);
            
                if(idRetorno != -1)
                {
                    //Una vez que guardo el equipo, guardo el equipo en el torneo.
                    var InscripcionNuevo = new EquipoTorneoService();
                    InscripcionNuevo.data = {
                                    "idTorneo": $scope.idTorneo,
                                    "idEquipo": parseInt(idRetorno),
                                    "pResultado": 0
                       };
                    
                    EquipoTorneoService.save(InscripcionNuevo.data, function(reponse){
                        idRetorn = reponse.data[0];
                        console.log('retorno inscripcion -->' + idRetorn);
                        var msjTor = "Inscripción a torneo exitosa, con el equipo " + document.getElementById("nombreEquipo").value +"! <br>";
                        msjTor += 'El torneo podrás seguirlo en la sección "Mis Torneos". <br>¡Que gane el mejor!';
                    
                        bootbox.alert(msjTor, function(){});
                        
                        if($scope.torneo.idTipoTorneo == 1)
                            $state.go('Clientes.verTorneoLiga'); 
                        else if($scope.torneo.idTipoTorneo == 2)
                            $state.go('Clientes.verTorneoCopa'); 
                        
                        if(document.getElementById('chkGuardaTarjeta').checked)
                            self.guardarTarjeta();
            
                    },function(errorResponse){
                        console.log('ERROR INSCRIPCION DEL EQUIPO AL TORNEO...' + errorResponse); 
                    });
            
                }
                else
                    console.log('Error al insertar equipo...');
            
              },function(errorResponse){
                console.log('ERROR EQUIPO...' + errorResponse); 
             });
        
        /*var ReservaNueva = new ReservasService();
        
        self.Reserva.fechaPartido = $scope.fechaPartido;
        self.Reserva.horaD = $scope.hDesdePartido;
        self.Reserva.horaH = $scope.hHastaPartido;
        var precioTotal =  $scope.precioAPagar + $scope.restante;
        self.Reserva.importeAPagar = precioTotal;
        self.Reserva.pagado = $scope.precioAPagar;
        self.Reserva.porcentajePago = $scope.porcentajePago;
        var estadoRes = (document.getElementById('rbPagaCanchaCompleta').checked) ? 2 : 1;
        self.Reserva.estadoReserva = estadoRes;
        
        console.log(self.Reserva.fechaPartido);
        console.log(self.Reserva.horaD);
        console.log(self.Reserva.horaH);
        ReservaNueva.data=self.Reserva;
        
        ReservasService.save(ReservaNueva.data, function(reponse){
                idReserva = reponse.data[0];
                console.log('idReserva -->' + idReserva);
        

         if(document.getElementById('chkGuardaTarjeta').checked)
             self.guardarTarjeta();
        
            self.borrarReservaTemp();
            
            $state.go('Clientes.verCancha.Reservar.ok'); 
            
          },function(errorResponse){
            console.log('ERROR...'); 
         });*/
        
        
        
    };
    
    this.getEquiposTorneo = function(){
			EquipoTorneoService.query({idTorneo:$scope.idTorneo}).$promise.then(function(data){
                 self.equiposTor = data;
            });
	};
    
    self.getEquiposTorneo();
    
    this.pagarYReservar = function(){
        
        var errores = "";
        var nom = document.getElementById("nombreEquipo").value;

        if(self.equiposTor.length >= $scope.torneo.CantEquipos)
            errores += "* No hay más cupos para inscribirse al torneo, lo sentimos! <br>";
        else
            {
                if(nom == undefined || nom == "")
                   errores = "* Por más malo que sea, el equipo debe tener un nombre! <br>";
                if(nom.length > 18)
                   errores += "* El nombre del equipo es muy largo! <br>";

                //Recorro los equipos inscriptos para ver si el cliente ya se inscribió o si ya existe un equipo con el mismo nombre...
                angular.forEach(self.equiposTor, function(aux) { 
                    if(aux.IdCliente == sessionStorage.id)
                        errores += "* Ya te inscribiste en este torneo con el equipo " +aux.Nombre+"! <br>";
                    if(aux.Nombre == nom)
                        errores += "* El equipo llamado "+nom+" ya existe en el torneo! <br>";
                });
            }

        if(errores != "")     
        {
            bootbox.alert(errores, function(){}); 
            return false;
        }
    
        bootbox.confirm("¿Seguro desea realizar el pago de $"+ $scope.precioAPagar +" para inscribirte al torneo?", function(result) {
        if(result)
        {
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
    
    
  
    ////////////////////////////////////////********IMAGEN EQUIPO**********/////////////////////////////////////////////
    
     $scope.uploadFile = function()
	{
		var file = $scope.file;
        console.log(file);
        
		EquiposImagenesService.uploadFile(file).then(function(res)
		{
            self.vURL = 'http://localhost:8080/resergol1.1/api/Imagenes/equipos/' + res.data;
            //console.log('VURL---->' + self.vURL);
		})
	}
    
     $scope.onChange = function (files) {
         
        if(files[0] == undefined) return;
            $scope.fileExt = files[0].name.split(".").pop()
            return $scope.isImage($scope.fileExt );
        }
        
        
        $scope.isImage = function(ext) {
            var res =  ("jpg" || ext == "jpeg"|| ext == "gif" || ext=="png");
            self.archivoInvalido = !res;
            self.bMensaje= !res ;
            
            return res;          
        };
    
    
   
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var $form = $('#payment-form');


/* Form validation */
jQuery.validator.addMethod("month", function(value, element) {
  return this.optional(element) || /^(01|02|03|04|05|06|07|08|09|10|11|12)$/.test(value);
}, "Mes inválido...");

jQuery.validator.addMethod("year", function(value, element) {
  return this.optional(element) || (/^[0-9]{2}$/.test(value) && value >= 16 && value <= 25);
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

paymentFormReady = function() {
    if ($form.find('[name=cardNumber]').hasClass("success") &&
        $form.find('[name=expMonth]').hasClass("success") &&
        $form.find('[name=expYear]').hasClass("success") &&
        $form.find('[name=cvCode]').val().length > 2 && $form.find('[name=cvCode]').val().length < 5) {
        return true;
    } else {
        return false;
    }
}

//$form.find('[type=submit]').prop('disabled', true);
var readyInterval = setInterval(function() {
    if (paymentFormReady()) {
        $form.find('[type=submit]').prop('disabled', false);
        //clearInterval(readyInterval);
    }
    else
        $form.find('[type=submit]').prop('disabled', true);
}, 250);
    ////////////////////////////////////////////////////////**************************************************************
    


    
});


resergolApp.directive('uploaderModel', ["$parse", function ($parse) {
	return {
		restrict: 'A',
		link: function (scope, iElement, iAttrs) 
		{
			iElement.on("change", function(e)
			{
				$parse(iAttrs.uploaderModel).assign(scope, iElement[0].files[0]);
			});
		}
	};
}])
