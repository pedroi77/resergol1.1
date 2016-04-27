/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state, UsuarioService, ClientesService){
	
    var self = this;
	this.brand = "Open Gallo";
    this.IniciarSesion = "Iniciar Sesion";

     
    this.Usuario = { 
                    usuario: '', 
                    id:0,
                    contrasenia: '',
                    tipo : '',
                    iscliente : false,
                    existe: true
                    };
     
                       
    this.validaLogin = function(){
        
        switch(self.Usuario.tipo){
            case 'C':
                ClientesService.query({user:self.Usuario.usuario, pass:self.Usuario.contrasenia}).$promise.then(function(data){
                    console.log(data);
                });
            case 'D':
            case 'A':
        }
        
        
        /*
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
            */
    };
    
   
    
    this.existeUsuario = function(){
        
        if(self.Usuario.usuario!=undefined){
            UsuarioService.query({user:self.Usuario.usuario}).$promise.then(function(data){
                self.Usuario.id =  data[0].id;                                                         
                self.Usuario.tipo  = data[0].tipo;                             

                if(self.Usuario.id > -1){
                    self.Usuario.existe = true;
                }
                else{
                    self.Usuario.existe = false;
                }
            });
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


