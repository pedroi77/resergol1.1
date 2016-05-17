var app = angular.module("resergolApp");

app.controller("AdminController", function(DueniosPendientesService, AceptarDueniosService, $state, $scope, $resource){
    
    var self = this;
    this.duePendientes = [];  
   
    this.mensajePrincipal = 'Listado de los usuario que se registraron como dueños de un complejo!';
    
    this.getDueniosPendientes = function(){
        DueniosPendientesService.query().$promise.then(function(data){
            console.log("holaaa");
            self.duePendientes = data;
        });
    };
    
//    this.aceptarDuenio = function(Id_Duenio, p_Acepta)
//    {   
//        console.log("ID: " + Id_Duenio + "acepta: " + p_Acepta);
//        AceptarDueniosService.update({IdDuenio:13, acepta:1}).$promise.then(function(data){
//        duenio = {};
//        duenio = data;       
//        console.log("asdklajsjkahcjhasjkchajkschjkahcjkashc");
//        if(duenio[0] == '1'){
//            console.log("Se dio cambio el estado");
//        }
//        else{
//            console.log("No se dio cambio el estado");
//        }
//     });
//            
//    };
    
    this.aceptarDuenio = function(Id_Duenio, p_Acepta)
    {   
        console.log("Entro al aceptarDuenio");
        var duePen = new AceptarDueniosService();
     
        duePen.data = {
                        "IdDuenio": 1,
                        "acepta": 1
  	       };   
        
        AceptarDueniosService.update(duePen.data, function(reponse){
            alert("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
            
          },function(errorResponse){
              //console.log(errorResponse.data.message);
                console.log("Error");
         });
        
//        console.log("ID: " + Id_Duenio + "acepta: " + p_Acepta);
//        AceptarDueniosService.update({IdDuenio:13, acepta:1}).$promise.then(function(data){
//        duenio = {};
//        duenio = data;       
//        console.log("asdklajsjkahcjhasjkchajkschjkahcjkashc");
//        if(duenio[0] == '1'){
//            console.log("Se dio cambio el estado");
//        }
//        else{
//            console.log("No se dio cambio el estado");
//        }
//     });

    };
    
    
    self.getDueniosPendientes();
}); 