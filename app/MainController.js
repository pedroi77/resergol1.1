/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state){
	
	this.brand = "Open Gallo";
     
    this.usuario = { 
                    usuario: '', 
                    contrasenia: ''
                    };
     
                       
    this.validaLogin = function(){
         if(this.usuario.usuario == "dueño" && this.usuario.contrasenia == "dueño"){
             $state.go('Duenios');
         };
       
        if(this.usuario.usuario == "admin" && this.usuario.contrasenia == "admin"){
             $state.go('Admin');
        };
    };

 
	
});


