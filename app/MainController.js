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
             $('#loginModal').modal('hide');
         };
       
        if(this.usuario.usuario == "admin" && this.usuario.contrasenia == "admin"){
             $state.go('Admin');
             $('#loginModal').modal('hide');
        };
    };
    
    //Para JWT modificar
    /*this.login = function(user)
    {
        authFactory.login(user).then(function(res)
        {
            if(res.data && res.data.code == 0)
            {
                store.set('token', res.data.response.token);
                $location.path("/home");
            }
        });*/

 
	
});


