var app = angular.module("resergolApp");

app.controller("BloqueadosController", function(UsuariosBloqueadosService,  $state, $scope, $resource, MandarMailsService){
    
    var self = this;
    this.usuarios = [];  
    this.usuario = '';  
   
    
    this.mayusculas = function(){
        self.usuario =self. usuario.toUpperCase();
    };
    
    this.getUsuariosBloqueados = function(){
        
        if(self.usuario.trim() == ''){
            self.usuario = 'A';
        }
        
        UsuariosBloqueadosService.query({usuario:self.usuario}).$promise.then(function(data){
            self.usuarios = data;
        });
    };
    
    
    this.buscar = function(){
        self.getUsuariosBloqueados();
    }

    
    this.desbloquear = function(indice)
    {   
        
        var usrDesbloqueado = new UsuariosBloqueadosService();
        
        
     
        usrDesbloqueado.data = {
                        "usuario": self.usuarios[indice].Usuario
  	       };   
        
        console.log(usrDesbloqueado.data);
        
        UsuariosBloqueadosService.update(usrDesbloqueado.data, function(reponse){
           
            //self.init();
            $state.reload("Admin.bloqueados");
          },function(errorResponse){
              //console.log(errorResponse.data.message);
                console.log("Error");
         });
        
         //self.mandarMail(indice);
        
        
        
    };
    
    
    this.mandarMail = function(indice){
        
        var mailNuevo = new MandarMailsService();
        
        mailNuevo.data = {
            "receptor":  self.usuarios[indice].Email,
            "asunto": 'Aviso Resergol ' ,
            "mensaje": 'Resergol le informa que se desbloqueo su usuario.  <br> Le recordamos que se contraseña es: ' + self.usuarios[indice].contrasenia + '<br><br> Atentamente el equipo de resergol.' 
        };  

        MandarMailsService.save(mailNuevo.data, function(reponse){
            console.log('se mando el mail');
          },function(errorResponse){
            console.log('no se mando el mail' + errorResponse); 
         }); 
      
    };
    
    /*
    this.mandarMailRechazo = function(indice){
        
        var mailNuevo = new MandarMailsService();
        
        mailNuevo.data = {
            "receptor":  self.duePendientes[indice].Email,
            "asunto": 'Aviso Resergol ' ,
            "mensaje": 'Resergol le informa que su solicitud de cuenta de complejo a sido rechazada por reglas del negocio. Lamentamos no poder aceptarlo. <br><br> Atentamente el equipo de resergol.' 
        };  

        MandarMailsService.save(mailNuevo.data, function(reponse){
            console.log('se mando el mail');
          },function(errorResponse){
            console.log('no se mando el mail' + errorResponse); 
         }); 
      
    };
    
    */
    
    this.init = function()
    {
        self.getUsuariosBloqueados();
         self.usuario = '';
    }
    
    
    self.init();
}); 