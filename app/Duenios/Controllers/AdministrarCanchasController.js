var resergolApp = angular.module("resergolApp");

resergolApp.controller("AdministrarCanchasController", function($scope, $state, AdministrarCanchasService, DueniosReservasMailsService, CanchasService, TiposSuperficiesService, DueniosReservasAumentoService, DueniosReservasMailsService, MandarMailsService, $uibModal,  $uibModalStack){
    
//Seccion de Datos
var self = this;
    
this.cantJugadores = [
          
      ];
    
this.Canchas = [];   
this.mails = []; 
    
this.CanchaSeleccionada = {
                    
    IdComplejo: parseInt(sessionStorage.idComplejo)
    ,IdCancha: 0
    ,nombre: ''
    ,CantJugadores: 0
    ,IdSuperficie: 0
    ,Techada: 0
    ,Luz: 0
    ,Precio: 0
    ,precioModificado: 0
    ,IdEstado: 1    
    ,guardoCancha: false  
    ,imagenCancha: ''
    ,mensajeBoton: 'Guardar'
    
};
    
this.AumentoCancha = {
    
    
};
    
this.selectedCantJugadoresId = -1;
this.superficies = [];
    
//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//

//Llenar Datos Superficie
self.superficies = {
    sup: [],
    selectedOption:{IdSuperficie: '', Descripcion: ''} 
};
    
self.cantJugadores = {
    jug: [
            { id: 5, desc: '5 vs 5' },
            { id: 6, desc: '6 vs 6' },
            { id: 7, desc: '7 vs 7' },
            { id: 8, desc: '8 vs 8' },
            { id: 9, desc: '9 vs 9' },
            { id: 10, desc: '10 vs 10' },
            { id: 11, desc: '11 vs 11' }
         ],
    selectedOption:{id: '', desc: ''}
};
    
//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
    
this.init = function(){
    //Trae las superficies disponibles para las canchas
    TiposSuperficiesService.query().$promise.then(function(data) {
        self.superficies.sup = data;
        self.superficies.selectedOption = self.superficies.sup[0];
    });
    
    //Trae las canchas cargadas
    AdministrarCanchasService.query({idComplejo: self.CanchaSeleccionada.IdComplejo, aux:0}).$promise.then(function(data){ //, aux: 0
        self.Canchas = data;  
    });
    
    self.cantJugadores.selectedOption = self.cantJugadores.jug[0];
};

this.guardarCancha = function(){
    
    var AdministrarCancha = new AdministrarCanchasService();

    self.CanchaSeleccionada.CantJugadores = self.cantJugadores.selectedOption.id;
    self.CanchaSeleccionada.IdSuperficie = self.superficies.selectedOption.IdSuperficie;

    AdministrarCancha.data = self.CanchaSeleccionada;

    console.log("Datos de la cancha--> Cantidad de Jugadores: " + self.superficies.selectedOption.IdSuperficie + " Superficie: " + self.cantJugadores.selectedOption.id + " ID Cancha--> " + self.CanchaSeleccionada.IdCancha);

    AdministrarCanchasService.save(AdministrarCancha.data, function(reponse){
        //no hace nada
    });

    bootbox.alert("Cancha guardada con exito! <br>", function() {
        self.blanquearDatos();
    });
    
    //
};

this.validarDatos = function(){
    
    var mensaje = '';
    var hayError = 0;
    
    if(self.CanchaSeleccionada.nombre.length == 0){
            
            mensaje += '* Tiene que ingresar un nombre. <br>'; 
            hayError = 1;
    }
    
    if(self.CanchaSeleccionada.Precio.length == 0){
            
            mensaje += '* Tiene que ingresar un precio por hora. <br>'; 
            hayError = 1;
    }
    
    if(self.CanchaSeleccionada.Precio <= 0){
            
            mensaje += '* Tiene que ingresar un precio por hora. <br>';  
            hayError = 1;
    }
    
    if(hayError == 1)    
    {
        bootbox.alert(mensaje, function() {
        });
    }
    else
    {
        self.guardarCancha();
        
        //si el precio de la camcha fue modificado puede pasar 2 cosas
        //Puede pedir que los que alquilaron las canchas no se les modifique el precio
        //o el duenio puede optar por cambiar el precio de las canchas aunque la cancha ya fue alquilada
        if(self.CanchaSeleccionada.precioModificado != self.CanchaSeleccionada.Precio && self.CanchaSeleccionada.precioModificado != 0){
            
            console.log("Son distintos");
            bootbox.confirm("¿Desea actualizar el importe de todas las reservas de esta cancha notificando a los clientes que la alquilaron?", function(result) {
                
                if(result){
                    self.cambiarPreciosReservas();
                }   
            }); 
        }
    }
};

this.elegirCancha = function(cancha){
    
    self.CanchaSeleccionada.nombre = cancha.nombre;
    self.CanchaSeleccionada.Luz = cancha.Luz;
    
    if(self.CanchaSeleccionada.Luz == 1)
        document.getElementById("luz").checked = true;
    else
        document.getElementById("luz").checked = false;
        
    self.CanchaSeleccionada.Techada = cancha.Techada;
    
    if(self.CanchaSeleccionada.Techada == 1)
        document.getElementById("techada").checked = true;
    else
        document.getElementById("techada").checked = false;
    
    self.CanchaSeleccionada.Precio = parseInt(cancha.Precio);
    self.CanchaSeleccionada.precioModificado = parseInt(cancha.Precio);
    
    self.superficies.selectedOption.IdSuperficie = cancha.IdSuperficie;
    self.cantJugadores.selectedOption.id = cancha.CantJugadores;
    self.CanchaSeleccionada.IdCancha = parseInt(cancha.IdCancha);
    self.CanchaSeleccionada.guardoCancha = true;
    self.CanchaSeleccionada.mensajeBoton = "Guardar";
    self.CanchaSeleccionada.imagenCancha = cancha.imagen;
    $scope.idCancha = parseInt(cancha.IdCancha);
    
    if(cancha.IdEstado == 2){
        
        self.CanchaSeleccionada.guardoCancha = false;
        self.CanchaSeleccionada.mensajeBoton = "Activar";
    } 
    
    //console.log(cancha);
    //console.log(self.CanchaSeleccionada);
    $('html,body').animate({scrollTop:120},'fast');return false;
};

this.inactivarCancha = function(){
    
    var AdministrarCancha = new AdministrarCanchasService();
    
    bootbox.confirm("¿Seguro desea inactivar esta cancha? <br>", function(result) {
        if(result){
            
            self.CanchaSeleccionada.IdSuperficie = self.superficies.selectedOption.IdSuperficie;
            self.CanchaSeleccionada.CantJugadores = self.cantJugadores.selectedOption.id;
            self.CanchaSeleccionada.IdComplejo = sessionStorage.idComplejo;
            //self.CanchaSeleccionada.IdCancha = cancha.IdCancha;
            self.CanchaSeleccionada.IdEstado = 2;

            console.log("se inactivo la cancha: " + self.CanchaSeleccionada.IdCancha);
            AdministrarCancha.data = self.CanchaSeleccionada;

            AdministrarCanchasService.save(AdministrarCancha.data, function(reponse){
                //no hace nada
            });

            self.init();
        }
    });
};

this.blanquearDatos = function(){
    
    self.CanchaSeleccionada.IdComplejo = sessionStorage.idComplejo;
    self.CanchaSeleccionada.IdCancha = 0;
    self.CanchaSeleccionada.nombre = '';
    self.CanchaSeleccionada.CantJugadores = 0;
    self.CanchaSeleccionada.IdSuperficie = 0;
    self.CanchaSeleccionada.Techada = 0;
    self.CanchaSeleccionada.Luz = 0;
    self.CanchaSeleccionada.Precio = 0;
    self.CanchaSeleccionada.IdEstado = 1;
    self.CanchaSeleccionada.precioModificado = 0;
    self.CanchaSeleccionada.imagenCancha = '';
    self.CanchaSeleccionada.guardoCancha = false;
    document.getElementById("luz").checked = false;
    document.getElementById("techada").checked = false;
       
    self.init();
};

this.irImagenes = function(){
    
    $state.go('Duenios.canchaImagenes', {idComplejo: self.CanchaSeleccionada.IdComplejo, idCancha: self.CanchaSeleccionada.IdCancha});
    
};
    
this.cambiarPreciosReservas = function(){
   
    var aumento;
    var porcentaje;
    var AdministrarAumento = new DueniosReservasAumentoService();
    
    //calculo el precio que se aumento(ej. anterior precio 200p. ahora es 250, 250 - 200 = 50, 50 = aumento)
    aumento = self.CanchaSeleccionada.Precio - self.CanchaSeleccionada.precioModificado;
    
    //calculo el porcentaje de aumento para modificar las demas reservas
    porcentaje = (aumento / self.CanchaSeleccionada.precioModificado) * 100;
    
    porcentaje = Math.round(porcentaje*100)/100;

    AdministrarAumento.data = {
                    "idComplejo": self.CanchaSeleccionada.IdComplejo,
                    "idCancha": self.CanchaSeleccionada.IdCancha,
                    "porcentajeAumento": porcentaje
    }; 
    
    DueniosReservasAumentoService.save(AdministrarAumento.data, function(reponse){
        
        DueniosReservasMailsService.query({ pIdComplejo: self.CanchaSeleccionada.IdComplejo , pIdCancha: self.CanchaSeleccionada.IdCancha}).$promise.then(function(dataMails) {
            self.mails = dataMails;
            
            angular.forEach(self.mails, function(aux) {

                self.mandarMail(aux.Email, aux.Usuario, aux.nombreComplejo);
            });
        });
        
        },function(errorResponse){
        console.log('ERROR TARJETA...' + errorResponse); 
    });
};
    
 //Mandar mail.
this.mandarMail = function(receptor, nombreUsuario, nombreComplejo){

    var asunto = "ReserGol - Notificacion de Aumento de Cancha";
    var mensaje = "<u><b>" + nombreUsuario + "</u></b>: Se le informa que hubo un aumento en el precio de la cancha <b>" + self.CanchaSeleccionada.nombre + "</b><br> del complejo <b> "+ nombreComplejo +"</b>. <br><br>En caso de desearlo, puede cancelar la reserva en la seccion 'Mis Reservas' <br><br>";
    mensaje += "Atentamente, el equipo de ReserGol.";
    
    console.log(mensaje);
    var mailNuevo = new MandarMailsService();
                mailNuevo.data = {
                    "receptor": receptor, //PONER $scope.mailCliente!!!!!!!!!!!!!!!!!
                    "asunto": asunto,
                    "mensaje": mensaje
                };  

    MandarMailsService.save(mailNuevo.data, function(reponse){
            console.log('se mando el mail');
          },function(errorResponse){
            console.log('no se mando el mail' + errorResponse); 
         }); 
};

//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//

self.init();
    
});