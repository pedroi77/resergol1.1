/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($state,store, UsuarioService, ClientesService,DueniosService,AdminService){
	
    var self = this;
	this.brand;
    this.IniciarSesion; 

     
    this.Duenio = {
        duenio:'',
        dni:0,
        existeDni:false
    }
     
                       
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
                /*store.set('tipo',  self.Usuario.tipo)
                store.set('usuario',  self.Usuario.usuario)
                store.set('pass',  btoa(self.Usuario.contrasenia))*/
                self.guardarSession();
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
                self.guardarSession();
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
                self.guardarSession();
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
    
    
    //Preguntar si esto se hace asi
    this.existeDni = function(){
        
        if(self.Duenio.duenio!=undefined){
            DocumentosService.query({user:self.Duenio.duenio}).$promise.then(function(data){
                self.Duenio.id =  data[0].id;                                                         
                self.Duenio.tipo  = data[0].tipo; 
                self.Duenio.dni  = data[0].dni;

                if(self.Duenio.id > -1){
                    self.Duenio.existeDni = true;
                }
                else{
                    self.Duenio.existeDni = false;
                }
            });
        }
        
    };

    this.guardarSession = function(){
        sessionStorage.tipo = self.Usuario.tipo;
        sessionStorage.usuario = self.Usuario.usuario;
        sessionStorage.pass = btoa(self.Usuario.contrasenia);    
    };
    
    this.desloguearse = function(){
        if(confirm('Seguro desea cerrar sesión?'))
        {
            store.set('token', undefined);    
            sessionStorage.tipo = '';
            sessionStorage.usuario = '';
            sessionStorage.pass = '';  
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
             self.Usuario.tipo=  sessionStorage.tipo;
             self.Usuario.usuario= sessionStorage.usuario; 
             self.Usuario.contrasenia= atob(sessionStorage.pass);
             self.validaLogin(null);
         }         
    };
    
    self.init();
    
});


