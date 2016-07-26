var resergolApp = angular.module("resergolApp");

resergolApp.controller("MiCuentaController", function($scope, $rootScope, $sce, store, $timeout, $state, $stateParams, TarjetasClienteService, MiCuentaService, DocumentosService, PersonasService, TipoYDocumentosService, EmailService, UsuarioService){

	
    var self = this;
    
    $rootScope.$state = $state;
    //$scope.torneo = [];    
    $scope.idCliente = sessionStorage.id;
    
    this.tipoDocSeleccionado = {IdTipoDoc: '-1', Descripcion: 'Otro'};
    this.tiposDoc = {
        tipos: [],
        selectedOption: {/*IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'*/}
    }; 
    
    this.datos = null;
    this.contrasenia = null;
    this.contraseniaNueva1 = null;
    this.contraseniaNueva2 = null;
    this.habilitaModifContrasenia = false;
    
    this.usuarioOrig = null;
    this.emailOrig = null;
    this.idTipoDocOrig = null;
    this.numDocOrig = null;
    
    /*Validaciones tarjeta*/
    var hoy = new Date();
    this.anioMax = hoy.getFullYear().toString();
    self.anioMax = parseInt(self.anioMax.substring(2,4));
    this.anioMin = self.anioMax;
    self.anioMax += 5;
    
    console.log(self.anioMin);
    console.log(self.anioMax);
    
    $scope.tarjValida = true;
    
    /**********************/
    
    /*this.Reserva ={
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
                      };*/

    /*this.Tarjeta ={
                        idCliente:sessionStorage.id,
                        nroTarjeta:'123456789123456',
                        mes: 11,
                        anio: 18,
                        codigo: '12'
                      };*/
	    
	//Traigo los datos de la cuenta del cliente.
    this.getDatosCliente = function(){
            var id = sessionStorage.id;
			MiCuentaService.query({idCliente:id}).$promise.then(function(data){
                    console.log(data[0]);
                    if(data != null && data != undefined)
                    {
                        data[0].NroDoc = parseInt(data[0].NroDoc);
                        data[0].Mes = parseInt(data[0].Mes);
                        data[0].Anio = parseInt(data[0].Anio);
                        data[0].NroTarjeta = parseInt(data[0].NroTarjeta);
                        
                    	self.datos = data[0];
                        self.datos.Usuario = self.datos.Usuario.toUpperCase();
                        
                        self.usuarioOrig = data[0].Usuario.toUpperCase();
                        self.emailOrig = data[0].Email;
                        self.idTipoDocOrig = data[0].IdTipoDoc;
                        self.numDocOrig = data[0].NroDoc;
                        
                        DocumentosService.query().$promise.then(function(data) {
                            self.tiposDoc.tipos = data;
                            //self.tiposDoc.tipos.splice(0, 0, {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'});
                            
                            angular.forEach(self.tiposDoc.tipos, function(aux) {
                                if(aux.IdTipoDoc == self.datos.IdTipoDoc)    
                                {
                                    self.tipoDocSeleccionado.IdTipoDoc = aux.IdTipoDoc;
                                    self.tipoDocSeleccionado.Descripcion = aux.Descripcion;
                                }
                            });
                        
                            
                        });
                        
                        //self.tiposDoc.selectedOption = self.datos.IdTipoDoc;

                        /*if(data[0].NroTarjeta != null && data[0].NroTarjeta != undefined)
                             document.getElementById("cardNumber").value = data[0].NroTarjeta;

                        if(data[0].Anio != null && data[0].Anio != undefined)
                             document.getElementById("expYear").value = data[0].Anio;

                        if(data[0].Mes != null && data[0].Mes != undefined)
                             document.getElementById("expMonth").value = data[0].Mes;*/

                    }
                        
            });
	};
	   
    self.getDatosCliente();
    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });
 
    });
    
    this.mayusculas = function(){
        if(self.datos.Usuario != undefined)
            self.datos.Usuario = self.datos.Usuario.toUpperCase();
    };
    
    this.existeDni = function(){
        
        if(self.datos.IdTipoDoc != self.idTipoDocOrig || self.datos.NroDoc != self.numDocOrig)
        {
            self.datos.IdTipoDoc = self.tipoDocSeleccionado.IdTipoDoc;
            if(self.datos.NroDoc!=undefined){
                TipoYDocumentosService.query({tipoDoc:self.datos.IdTipoDoc, nroDoc:self.datos.NroDoc, tipoUsu:'C'}).$promise.then(function(data){

                    var valor = data[0].duenio;

                    console.log('valor: ' + valor);

                    if(valor == 1){
                        self.datos.existeDni = true;
                        console.log('EXISTE DNI');
                    }
                    else{
                        self.datos.existeDni = false;
                        console.log('NO EXISTE DNI');
                    }
                });
            }
            else
                {
                    self.datos.existeDni = false;        
                }
        }
        else
            self.datos.existeDni = false;
        
    };
    
    this.existeEmail = function(){

    if(self.datos.Email!=undefined){
        console.log(self.datos.Email + " - " + self.emailOrig);
        if(self.datos.Email != self.emailOrig)
        {    
            EmailService.query({email:self.datos.Email}).$promise.then(function(data){
                //alert(data[0].resultado);
                var bExisteEmail = data[0].resultado;                                                             
                if(bExisteEmail == 1){
                    self.datos.existeMail = true;
                }
                else{
                    self.datos.existeMail = false;
                }
            });
         }
        else
            {
                self.datos.existeMail = false;
            }

    }
    else
    {
        self.datos.existeMail = false;
    }

};
    
this.existeUsuario = function(){
    if(self.datos.Usuario!=undefined){
        if(self.datos.Usuario != self.usuarioOrig)
        {  
            UsuarioService.query({user:self.datos.Usuario}).$promise.then(function(data){
                if(data[0].id > -1){
                    self.datos.existe = true;
                    console.log('existe usuario');

                }
                else{
                    self.datos.existe = false;
                    console.log('NO existe usuario');
                }
            });
        }
        else
            {
                self.datos.existe = false;
            }
    }
    else
        self.datos.existe = false;
        
};
    
    this.validarDatos = function()
    {
        //SI QUIERE MODIFICAR LA PASS, ME FIJO QUE INGRESE LA PASS ACTUAL CORRECTA.
        if(self.habilitaModifContrasenia)
        {
            console.log('PASS1:' + self.contrasenia + "---- PASS ORIG" + self.datos.Contrasenia);
            if(self.contrasenia == null)
            {
                bootbox.alert("Ingrese contraseña actual...", function(){ 
                });
                return false;
            }
                console.log('NUEVA '+ self.contraseniaNueva1);
                if((self.contrasenia != self.datos.Contrasenia) || (self.contraseniaNueva1 != self.contraseniaNueva2) || self.contraseniaNueva1 == null)
                {
                    if(self.contrasenia == self.datos.Contrasenia)
                    {
                        bootbox.alert("Las contraseñas nuevas no coinciden", function(){ 
                        });
                        return false;   
                    }
                    else
                    {
                        bootbox.alert("Contraseña actual incorrecta.", function(){ 
                        });
                        return false;   
                    }
                }

        }
        
        console.log(self.datos.Mes);
        console.log(self.datos.Anio);
        console.log(self.datos.NroTarjeta);
        if(self.datos.NroTarjeta != null || self.datos.Anio != null || self.datos.Mes != null)
        {
            if(self.datos.NroTarjeta == null || isNaN(self.datos.NroTarjeta) || self.datos.Anio == null || isNaN(self.datos.Anio) || self.datos.Mes == null)
            {
                bootbox.alert("Datos de la tarjeta incompletos o inválidos.", function(){ 
                });
                return false;   
            }
        }
        
        if(!$scope.tarjValida)
        {
            bootbox.alert("Número de tarjeta inválido.", function(){ 
                });
                return false;   
        }
        
        
        
        return true;
    };
    
    this.habilitarModPass = function(valor)
    {
        if(valor == 1)
            self.habilitaModifContrasenia = true;
        else{
                self.habilitaModifContrasenia = false;
                self.contrasenia = null;
                self.contraseniaNueva1 = null;
                self.contraseniaNueva2 = null;
            }
    };
    
    this.desloguearCliente = function(){
        
            store.set('token', undefined);    
            sessionStorage.tipo = '';
            sessionStorage.usuario = '';
            sessionStorage.pass = '';  
            sessionStorage.id = '';
        
            //self.init();
            self.Usuario = { 
                     usuario: '', 
                     id:0,
                     contrasenia: '',
                     tipo : '',
                     idComplejo:0,
                     existe: true, 
                     passInvalida:false,
                     login: false
                     };
        
        location.href = "http://localhost:8080/resergol1.1/index.html#/clientes/Canchas";
        
         var token = store.get("token") || null;
         var sesion = sessionStorage.usuario  || null;
        
         if(!token || !sesion ){
             self.IniciarSesion = 'Iniciar Sesion';
             self.brand = "Open Gallo"; //???
         }    
         else{
             self.Usuario.tipo=  sessionStorage.tipo;
             self.Usuario.usuario= sessionStorage.usuario; 
             self.Usuario.contrasenia= atob(sessionStorage.pass);
             self.validaLogin(null);
         }         
            
            //$state.go('Clientes.buscarCanchas');
    };
    
    this.borrarCuenta = function()
    {
        bootbox.confirm(self.datos.Usuario + ": ¿Seguro deseas borrar tu cuenta de Resergol?", function(result) {
            if(result)
            {
                self.desloguearCliente();
              //"Borro" al cliente (se le cambia el estado a 2 (inactivo))
                MiCuentaService.delete({idCliente: self.datos.IdCliente}, function(reponse){
                idRetorno = reponse.data;
                console.log('SE BORRO AL CLIENTE...... RETORNO -->' + idRetorno);
                
                bootbox.alert("Se ha borrado tu cuenta. El equipo de Resergol.", function(){});
                
                self.desloguearCliente();    
                    
                },function(errorResponse){
                    console.log('ERROR BORRAR CLIENTE...' + errorResponse); 
                });
            }
        });
    };
    
    this.guardarUsuario = function(){
        
        if(self.validarDatos())
        {
            //Si modificó contrasenia...
            var pass;
            if(self.contraseniaNueva1 != null)
                pass = self.contraseniaNueva1;
            else
                pass = self.datos.Contrasenia;

            var CuentaNueva = new MiCuentaService();
            CuentaNueva.data = {
                            "idCliente": self.datos.IdCliente,
                            "usuario": self.datos.Usuario,
                            "contrasenia": pass,
                            "valor": 0
               };  
            
            //GUARDO LOS DATOS PROPIOS DEL USUARIO.
            MiCuentaService.save(CuentaNueva.data, function(reponse){
                    idRetorno = reponse.data;
                    console.log('usuario guardado --> ' + idRetorno);
                
                    //GUARDO LOS DATOS DE LA PERSONA
                    var PersonaNueva = new PersonasService();
                    PersonaNueva.data = {
                                "idPersona": self.datos.IdPersona,
                                "email": self.datos.Email,
                                "nombre": self.datos.Nombre,
                                "apellido": self.datos.Apellido,
                                "idTipoDoc": self.tipoDocSeleccionado.IdTipoDoc,
                                "nroDoc": self.datos.NroDoc,  
                                "resultado": 0
                    };  
                    
                    console.log(PersonaNueva.data);
                    PersonasService.save(PersonaNueva.data, function(reponse){
                    idRetorno = reponse.data;
                    console.log('persona guardada --> ' + idRetorno);
                    
                        
                        //SI HAY DATOS, GUARDO/ACTUALIZO LOS DATOS DE LA TARJETA
                        console.log('SELF TARJ ' + self.datos.NroTarjeta);
                        var nroTarj = self.datos.NroTarjeta;
                        
                        if(nroTarj != null && nroTarj != undefined && nroTarj != "" && nroTarj != 0 && !isNaN(nroTarj) )
                        {
                                
                             var TarjetaNueva = new TarjetasClienteService();
                             TarjetaNueva.data = {
                                "idCliente": self.datos.IdCliente,
                                "nroTarjeta": self.datos.NroTarjeta.toString(),
                                "mes": self.datos.Mes ,
                                "anio": self.datos.Anio,
                                "codigo": self.datos.Anio, //Igual no guardo nada en código...
                                "valor": 0
                             };  

                            TarjetasClienteService.save(TarjetaNueva.data, function(reponse){
                                    idRetorno = reponse.data[0];
                                    console.log('SE GUARDO LA TARJETA -->' + idRetorno);
                                
                                    bootbox.alert("Cambios actualizados con éxito...", function(){ 
                                    });
                                
                                  },function(errorResponse){
                                    console.log('ERROR TARJETA...' + errorResponse); 
                                 });
                          }
                           else
                           {
                               //Si existe, borro la tarjeta...
                               console.log('tengo que borrar la tarjeta...');
                                TarjetasClienteService.delete({idCliente: self.datos.IdCliente}, function(reponse){
                                    idRetorno = reponse.data[0];
                                    console.log('SE BORRO LA TARJETA...... RETORNO -->' + idRetorno);
                                    bootbox.alert("Cambios actualizados con éxito...", function(){ 
                                    });
                                    },function(errorResponse){
                                        console.log('ERROR BORRAR TARJETA...' + errorResponse); 
                                    });
                           }
                        
                        
                        
                  },function(errorResponse){
                    console.log('ERROR AL GUARDAR PERSONA...' + errorResponse);
                  });    
                
                
                  },function(errorResponse){
                    console.log('ERROR AL GUARDAR USUARIO...' + errorResponse); 
                 });
            
        }
    };
    
    
    this.guardarDatos = function()
    {
        self.guardarUsuario();
    };

var $form = $('#frmTarj');

/* Form validation */
/*jQuery.validator.addMethod("month", function(value, element) {
  return this.optional(element) || /^(01|02|03|04|05|06|07|08|09|10|11|12)$/.test(value);
}, "Mes inválido...");

jQuery.validator.addMethod("year", function(value, element) {
  return this.optional(element) || (/^[0-9]{2}$/.test(value) && value >= 16 && value <= 25);
}, "Año inválido...");*/

validator = $form.validate({
    rules: {
        nroTarjeta: {
            required: false,
            creditcard: true,
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
    if ($form.find('[name=nroTarjeta]').hasClass("success")) {
        return true;
    } else {
        return false;
    }
}

//$form.find('[type=submit]').prop('disabled', true);
var readyInterval = setInterval(function() {
    if (paymentFormReady()) {
        //console.log('NUM PERFECTO!!!');
        //$form.find('[name="guardar"]').prop('disabled', false);
        $scope.tarjValida = true;
        //clearInterval(readyInterval);
    }
    else
        {   //console.log('NUM INVALIDO!!!');
            //$form.find('[name="guardar"]').prop('disabled', true);
            if(self.datos != null)
            if(self.datos.NroTarjeta != '' && !isNaN(self.datos.NroTarjeta) && self.datos.NroTarjeta != undefined && self.datos.NroTarjeta != null)
                $scope.tarjValida = false;
        }
}, 250);
    ////////////////////////////////////////////////////////**************************************************************


});