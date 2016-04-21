/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state){
	
    var self = this;
	this.brand = "Open Gallo";
    this.IniciarSesion = "Iniciar Sesion";
     
    this.usuario = { 
                    usuario: '', 
                    contrasenia: '',
                    };
     
                       
    this.validaLogin = function(){
        
        if(this.usuario.usuario == "cliente" && this.usuario.contrasenia == "cliente"){
             $state.go('Clientes');
             $('#loginModal').modal('hide');
         }
         else if(this.usuario.usuario == "dueño" && this.usuario.contrasenia == "dueño"){
             $state.go('Duenios');
             $('#loginModal').modal('hide');
         }
        else if(this.usuario.usuario == "admin" && this.usuario.contrasenia == "admin"){
             $state.go('Admin');
             $('#loginModal').modal('hide');
        }
        else
            {   
                this.bEsCliente = false;
            }
    };

 
	
});


