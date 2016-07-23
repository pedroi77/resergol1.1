var resergolApp = angular.module("resergolApp");

resergolApp.controller("MiCuentaController", function($scope, $rootScope, $sce, store, $timeout, $state, $stateParams, TarjetasClienteService, MiCuentaService, DocumentosService, PersonasService){

	
    var self = this;
    
    $rootScope.$state = $state;
    //$scope.torneo = [];    
    $scope.idCliente = sessionStorage.id;
    
    this.tipoDocSeleccionado = {IdTipoDoc: '-1', Descripcion: 'Otro'};
    this.tiposDoc = {
        tipos: [],
        selectedOption: {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'} //This sets the default value of the select in the ui
    }; 
    
    this.datos = null;
    this.contrasenia = null;
    this.contraseniaNueva1 = null;
    this.contraseniaNueva2 = null;
    this.habilitaModifContrasenia = false;
    
    
    
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
                    	self.datos = data[0];
                        DocumentosService.query().$promise.then(function(data) {
                            self.tiposDoc.tipos = data;
                            self.tiposDoc.tipos.splice(0, 0, {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'});
                            
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
    
    this.validarDatos = function()
    {
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
    
    this.borrarCuenta = function()
    {
        bootbox.confirm(self.datos.Usuario + ": ¿Seguro deseas borrar tu cuenta de Resergol?", function(result) {
            if(result)
            {
              //"Borro" al cliente (se le cambia el estado a 2 (inactivo))
                MiCuentaService.delete({idCliente: self.datos.IdCliente}, function(reponse){
                idRetorno = reponse.data;
                console.log('SE BORRO AL CLIENTE...... RETORNO -->' + idRetorno);
                
                bootbox.alert("Se ha borrado tu cuenta. El equipo de Resergol.", function(){});
                
                store.set('token', undefined);    
                sessionStorage.tipo = '';
                sessionStorage.usuario = '';
                sessionStorage.pass = '';  
                sessionStorage.id = '';
                $state.go('Clientes.buscarCanchas');    
                    
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
                        if(nroTarj != null && nroTarj != undefined && nroTarj != "")
                        {
                             var TarjetaNueva = new TarjetasClienteService();
                             TarjetaNueva.data = {
                                "idCliente": self.datos.IdCliente,
                                "nroTarjeta": self.datos.NroTarjeta,
                                "mes": self.datos.Mes,
                                "anio": self.datos.Anio,
                                "codigo": self.datos.Anio, //Igual no guardo nada en código...
                                "valor": 0
                             };  

                            TarjetasClienteService.save(TarjetaNueva.data, function(reponse){
                                    idRetorno = reponse.data[0];
                                    console.log('SE GUARDO LA TARJETA -->' + idRetorno);
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
        else
        {
            bootbox.alert("No se pueden guardar los cambios, corrija los errores por favor...", function() {});
        }
    };
    
   
    
    this.guardarTarjeta = function(){
        
       
    };
    
    
    this.guardarDatos = function()
    {
        self.guardarUsuario();
    };

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