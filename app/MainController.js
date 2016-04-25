/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state, UsuarioService){
	
    var self = this;
	this.brand = "Open Gallo";
    this.IniciarSesion = "Iniciar Sesion";

     
    this.Usuario = { 
                    usuario: '', 
                    contrasenia: '',
                    tipo : '',
                    iscliente : false,
                    };
     
                       
    this.validaLogin = function(){
        
        self.existeUsuario();
        
        if(this.usuario.usuario == "cliente" && this.usuario.contrasenia == "cliente"){
            self.Usuario.tipo = 'C'; //esto podria ser otra opcion
            self.Usuario.iscliente = true; 
            self.IniciarSesion = 'PEPE';
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
    
    this.desloguearse = function(){
        if(confirm('Seguro desea cerrar sesión?'))
        {
            self.Usuario.tipo = '';
            self.Usuario.iscliente = false; 
            self.IniciarSesion = 'Iniciar Sesion';
        }
    };
    
    this.existeUsuario = function(){
        
        UsuarioService.query({user:'HOMERO'}).$promise.then(function(data){
               console.log(data);                                                         
            });
        
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


