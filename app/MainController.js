/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state, UsuarioService){
	
    var self = this;
	this.brand = "Open Gallo";
    this.IniciarSesion = "Iniciar Sesion";

     
    this.Usuario = { 
                    usuario: '', 
                    id:0,
                    contrasenia: '',
                    tipo : '',
                    iscliente : false,
                    };
     
                       
    this.validaLogin = function(){
        
        //self.existeUsuario();
        
        if(this.Usuario.usuario == "cliente" && this.Usuario.contrasenia == "cliente"){
            self.Usuario.tipo = 'C'; //esto podria ser otra opcion
            self.Usuario.iscliente = true; 
            self.IniciarSesion = 'PEPE';
            $('#loginModal').modal('hide');
         }
         else if(this.Usuario.usuario == "dueño" && this.Usuario.contrasenia == "dueño"){
             $state.go('Duenios');
             $('#loginModal').modal('hide');
         }
        else if(this.Usuario.usuario == "admin" && this.Usuario.contrasenia == "admin"){
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
        console.log(self.Usuario.usuario);
        
        UsuarioService.query({user:self.Usuario.usuario}).$promise.then(function(data){
            self.Usuario.id =  data[0].id;                                                         
            self.Usuario.tipo  = data[0].tipo;                             
            
            console.log(self.Usuario.id);
            console.log(self.Usuario.tipo);
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


