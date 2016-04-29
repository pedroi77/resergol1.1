/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state,store, UsuarioService, ClientesService){
	
    var self = this;
	this.brand = "Open Gallo";
    this.IniciarSesion = "Iniciar Sesion";

     
    this.Usuario = { 
                    usuario: '', 
                    id:0,
                    contrasenia: '',
                    tipo : '',
                    existe: true, 
                    passInvalida:false,
                    login: false
                    };
    
    this.cliente = {};
     
                       
    this.validaLogin = function(){
        
        switch(self.Usuario.tipo){
            case 'C':
                self.getCliente();
            case 'D':
            case 'A':
        };
        
        
        /*
             $state.go('Duenios');
             $state.go('Admin');
            */
    };
    
   this.getCliente = function(){
         ClientesService.query({user:self.Usuario.usuario, pass:self.Usuario.contrasenia}).$promise.then(function(data){
            
            self.cliente = data;       
                   
            if(self.cliente[0] != '-1'){
                //console.log(self.cliente[1]);
                self.Usuario.passInvalida = false;
                self.Usuario.login = true;
                self.IniciarSesion = self.cliente[0].Usuario;
                store.set('token',  self.cliente[1]); //guardo el token
                $('#loginModal').modal('hide');
            }
            else{
                self.Usuario.login = false;
                self.Usuario.passInvalida = true;
            }
         });
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
            store.set('token', undefined);     
            self.init();
            $state.go('Clientes.buscarCanchas');
        }
    };
    
    this.init = function(){
        self.Usuario.tipo = '';
        self.Usuario.existe = true;
        self.Usuario.login = false;
        self.IniciarSesion = 'Iniciar Sesion';
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


