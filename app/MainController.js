/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("MainController", function($scope, $state,store, UsuarioService, ClientesService,DueniosService,AdminService){
	
    var self = this;
	this.brand;
    this.IniciarSesion;
    this.rta = false;
    this.pregunta = "";
     
    this.mayusculas = function(){
        self.Usuario.usuario = self.Usuario.usuario.toUpperCase();
    };
    
    $scope.map = { center: { latitude: 45, longitude: -73 }, zoom: 8 };
    
    this.home = function(){
        
          switch(self.Usuario.tipo){
            case 'C':
                $state.go('Clientes.buscarCanchas');
                break;
            case 'D':
                $state.go('Duenios.reserva');
                break;
            case 'A':
                $state.go('Admin.administracion');
                break;
        };
    };
    
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
    
    this.limpiarModal = function(form){
        self.Usuario.usuario ="";
        self.Usuario.contrasenia = "";
        form.$setPristine();
    };
    

    
    $('#loginModal').on('hidden', function () {
        console.log('pepe');
    })
    
   this.getCliente = function(form){
         ClientesService.query({user:self.Usuario.usuario, pass:self.Usuario.contrasenia}).$promise.then(function(data){
            cliente = {};
            cliente = data;       
                   
            if(cliente[0].IdCliente != '-1'){
                if(cliente[0].IdCliente != -3 ){ //Esta bloqueado
                    self.Usuario.passInvalida = false;
                    self.Usuario.login = true;
                    self.Usuario.id = cliente[0].IdCliente;
                    self.Usuario.email = cliente[0].Email;
                    store.set('token',  cliente[1]); //guardo el token
                    self.guardarSession();
                    if(!(form == null)){
                          $('#loginModal').modal('hide');
                          form.$setPristine();
                    }    
                }else{
                    bootbox.alert("Ingreso la contraseña 3 veces mal, su usuario a sido bloqueado. Contactese con el administrador de la pagina para reactivar su cuenta.", function() {});
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
                   
            if(duenio[0].IdDuenio != '-1'){
                if(duenio[0].IdDuenio != '-3'){
                    self.Usuario.id = duenio[0].IdDuenio;
                    self.Usuario.idComplejo = duenio[0].IdComplejo;
                    self.Usuario.passInvalida = false;
                    self.Usuario.login = true;
                    store.set('token',  duenio[1]);
                    self.guardarSession();
                    $state.go('Duenios.reserva');
                    if(!(form == null)){
                         $('#loginModal').modal('hide');
                         form.$setPristine();
                     }
                }else{
                    bootbox.alert("Ingreso la contraseña 3 veces mal, su usuario a sido bloqueado. Contactese con el administrador de la pagina para reactivar su cuenta.", function() {});
                 }
                
            }else{
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
                self.Usuario.id = admin[0].id;
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
        sessionStorage.id = self.Usuario.id;
        sessionStorage.idComplejo = self.Usuario.idComplejo;
        sessionStorage.email = self.Usuario.email;
    };
    
    this.desloguearse = function(){
        
         bootbox.confirm('¿Seguro desea cerrar sesión?', function(result) {
         if(result)
         {
            store.set('token', undefined);    
            sessionStorage.tipo = '';
            sessionStorage.usuario = '';
            sessionStorage.pass = '';  
            sessionStorage.id = '';
            self.init();
            $state.go('Clientes.buscarCanchas');
         }
             
         });
    };
    
    
    this.acercaDe = function(){
         bootbox.alert("ReserGol es una plataforma web en la que podrás buscar las mejores canchas de fútbol! y reservar tu turno para jugar, con sólo un click!", function() {});
    }
    
    this.init = function(){
       self.Usuario = { 
                     usuario: '', 
                     id:0,
                     contrasenia: '',
                     tipo : '',
                     idComplejo:0,
                     existe: true, 
                     passInvalida:false,
                     login: false
                     };
         
         var token = store.get("token") || null;
         var sesion = sessionStorage.usuario  || null;
        
         if(!token || !sesion ){
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
    
    
    this.irMisReservas = function(){            
            $state.go('Clientes.misReservas', {idCli: self.Usuario.id});
        };
    
    this.irMisTorneos = function(){            
            $state.go('Clientes.misTorneos', {idCli: self.Usuario.id});
        };
    
    this.irMiCuenta = function(){            
            $state.go('Clientes.miCuenta', {idCli: self.Usuario.id});
        };
    
    self.init();
    
});


