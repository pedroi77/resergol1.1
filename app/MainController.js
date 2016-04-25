/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state, UsuarioService){
	
    var self = this;
	this.brand = "Open Gallo";
    this.IniciarSesion = "Iniciar Sesion";

     
    this.usuario = { 
                    usuario: '', 
                    id:0,
                    contrasenia: '',
                    tipo : '',
                    iscliente : false,
                    };
     
                       
    this.validaLogin = function(){
        
        self.existeUsuario();
        
        if(this.usuario.usuario == "cliente" && this.usuario.contrasenia == "cliente"){
            self.usuario.tipo = 'C'; //esto podria ser otra opcion
            self.usuario.iscliente = true; 
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
        //console.log(self.Usuario.usuario);
        
        UsuarioService.query({user:self.usuario.usuario}).$promise.then(function(data){
            self.usuario.id =  data[0].id;                                                         
            self.usuario.tipo  = data[0].tipo;                             
            
            console.log(self.usuario.id);
            console.log(self.usuario.tipo);
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


