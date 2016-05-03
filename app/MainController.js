/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state,store, UsuarioService, ClientesService,DueniosService,AdminService){
	
    var self = this;
    this.brand;
    this.IniciarSesion;
  
                       
    this.validaLogin = function(form){
        
        switch(self.Usuario.tipo){
            case 'C':
                self.getCliente(form);
                break;
            case 'D':
                self.getDuenio(form);
                break;
            case 'A':
                self.getAdministrador(form);
                break;
        };
    };
    
   this.getCliente = function(form){
         ClientesService.query({user:self.Usuario.usuario, pass:self.Usuario.contrasenia}).$promise.then(function(data){
            cliente = {};
            cliente = data;       
                   
            if(cliente[0] != '-1'){
                self.Usuario.passInvalida = false;
                self.Usuario.login = true;
                self.IniciarSesion = cliente[0].Usuario;
                store.set('token',  cliente[1]); //guardo el token
                store.set('tipo',  self.Usuario.tipo)
                store.set('usuario',  self.Usuario.usuario)
                store.set('pass',  btoa(self.Usuario.contrasenia))
                if(!(form == null)){
                    $('#loginModal').modal('hide');
                    form.$setPristine();
                }
            }
            else{
                self.Usuario.login = false;
                self.Usuario.passInvalida = true;
            }
         });
    };
    
     this.getDuenio = function(form){
         DueniosService.query({user:self.Usuario.usuario, pass:self.Usuario.contrasenia}).$promise.then(function(data){
            duenio = {};
            duenio = data;       
                   
            if(duenio[0] != '-1'){
                self.Usuario.passInvalida = false;
                self.Usuario.login = true;
                self.IniciarSesion = duenio[0].Usuario;
                store.set('token',  duenio[1]);
                store.set('tipo',  self.Usuario.tipo)
                store.set('usuario',  self.Usuario.usuario)
                store.set('pass',  btoa(self.Usuario.contrasenia))
                $state.go('Duenios.reserva');
                if(!(form == null)){
                    $('#loginModal').modal('hide');
                    form.$setPristine();
                }
            }
            else{
                self.Usuario.login = false;
                self.Usuario.passInvalida = true;
            }
         });
    };
    
    this.getAdministrador = function(form){
         AdminService.query({user:self.Usuario.usuario, pass:self.Usuario.contrasenia}).$promise.then(function(data){
            admin = {};
            admin = data;       
                   
            if(admin[0] != '-1'){
                self.Usuario.passInvalida = false;
                self.Usuario.login = true;
                self.IniciarSesion = admin[0].Usuario;
                store.set('token',  admin[1]); //guardo el token
                store.set('tipo',  self.Usuario.tipo)
                store.set('usuario',  self.Usuario.usuario)
                store.set('pass',  btoa(self.Usuario.contrasenia))
                $state.go('Admin.administracion');
                if(!(form == null)){
                    $('#loginModal').modal('hide');
                    form.$setPristine();
                }
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
            store.set('tipo', undefined);    
            store.set('usuario', undefined);    
            store.set('pass', undefined);    
            self.init();
            $state.go('Clientes.buscarCanchas');   
        }
    };
    
    this.init = function(){
        self.Usuario = { 
                            usuario: '', 
                            id:0,
                            contrasenia: '',
                            tipo : '',
                            existe: true, 
                            passInvalida:false,
                            login: false
                            };
        
        var token = store.get("token") || null;
        if(!token){
            self.IniciarSesion = 'Iniciar Sesion';
            self.brand = "Open Gallo"; //???
        }    
        else{
            self.Usuario.tipo=  store.get("tipo");
            self.Usuario.usuario= store.get("usuario"); 
            self.Usuario.contrasenia= atob(store.get("pass"));
            self.validaLogin(null);
        }            
    };
    
    
    self.init();
});


