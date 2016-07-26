var app = angular.module("resergolApp");

app.controller("AdminController", function(DueniosPendientesService, AceptarDueniosService, $state, $scope, $resource, MandarMailsService){
    
    var self = this;
    this.duePendientes = [];  
   
    this.mensajePrincipal = 'Listado de los usuario que se registraron como dueños de un complejo!';
    
    this.getDueniosPendientes = function(){
        DueniosPendientesService.query().$promise.then(function(data){
          
            self.duePendientes = data;
        });
    };

    
    this.aceptarDuenio = function(Id_Duenio, p_Acepta, indice)
    {   
        console.log(Id_Duenio);
        var duePen = new AceptarDueniosService();
     
        duePen.data = {
                        "IdDuenio": Id_Duenio,
                        "acepta": p_Acepta
  	       };   
        
        AceptarDueniosService.update(duePen.data, function(reponse){
            if(p_Acepta == 1){
                //alert("Se acepto la solicitud!");  
                self.mandarMail(indice);
            }else{
                //alert("Se rechazo la solicitud! ");
                self.mandarMailRechazo(indice);
                }
            
          },function(errorResponse){
              //console.log(errorResponse.data.message);
                console.log("Error");
         });
        
        
        self.init();
        //$state.go("Admin.administracion");
        $state.reload("Admin.administracion")
      
    };
    
    this.mandarMail = function(indice){
        
        var mailNuevo = new MandarMailsService();
        
        mailNuevo.data = {
            "receptor":  self.duePendientes[indice].Email,
            "asunto": 'Aviso Resergol ' ,
            "mensaje": 'Resergol le informa que se activo su cuenta de complejo. Desde este momento puede ingresar con el usuario y contraseña que se registro. <br> Le deseamos la mejor experiencia en la plataforma RESERGOL.<br><br> Atentamente el equipo de resergol.' 
        };  

        MandarMailsService.save(mailNuevo.data, function(reponse){
            console.log('se mando el mail');
          },function(errorResponse){
            console.log('no se mando el mail' + errorResponse); 
         }); 
      
    };
    
    this.mandarMailRechazo = function(indice){
        
        var mailNuevo = new MandarMailsService();
        
        mailNuevo.data = {
            "receptor":  self.duePendientes[indice].Email,
            "asunto": 'Aviso Resergol ' ,
            "mensaje": 'Resergol le informa que su solicitud de cuenta de complejo ha sido rechazada por reglas del negocio. Lamentamos no poder aceptarlo. <br><br> Atentamente el equipo de resergol.' 
        };  

        MandarMailsService.save(mailNuevo.data, function(reponse){
            console.log('se mando el mail');
          },function(errorResponse){
            console.log('no se mando el mail' + errorResponse); 
         }); 
      
    };
    
    
    
    this.init = function()
    {
        self.getDueniosPendientes();
    }
    
    
    self.getDueniosPendientes();
}); 