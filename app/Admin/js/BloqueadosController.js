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
             
            self.mandarMail(indice);
            $state.reload("Admin.bloqueados");
          },function(errorResponse){
              //console.log(errorResponse.data.message);
                console.log("Error");
         });  
    };
    
    
    this.mandarMail = function(indice){
        
        var mailNuevo = new MandarMailsService();
        
        mailNuevo.data = {
            "receptor":  self.usuarios[indice].Email,
            "asunto": 'Aviso Resergol ' ,
            "mensaje": 'Resergol le informa que se desbloqueo su usuario.  <br> Le recordamos que su contraseña es: ' + self.usuarios[indice].contrasenia + '<br> <br> Atentamente el equipo de resergol.' 
        };  

        MandarMailsService.save(mailNuevo.data, function(reponse){
            //console.log('se mando el mail');
          },function(errorResponse){
            //console.log('no se mando el mail' + errorResponse); 
         }); 
      
    };
    
    
    this.init = function()
    {
        self.getUsuariosBloqueados();
         self.usuario = '';
    }
    
    
    self.init();
}); 