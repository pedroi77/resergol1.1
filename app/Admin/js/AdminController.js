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
        console.log(Id_Duenio);
        var duePen = new AceptarDueniosService();
     
        duePen.data = {
                        "IdDuenio": Id_Duenio,
                        "acepta": p_Acepta
  	       };   
        
        AceptarDueniosService.update(duePen.data, function(reponse){
            /*if(p_Acepta == 1)
                alert("Se acepto la solicitud!");  
            else
                alert("Se rechazo la solicitud! ");*/ 
            
          },function(errorResponse){
              //console.log(errorResponse.data.message);
                console.log("Error");
         });
        
        
        self.init();
        $state.go("Admin.administracion");
        //$scope.table.reload();
        //$('#tablaDuenios').modal('refresh');
        //$scope.tablaDuenios.refresh();
    };
    
    this.init = function()
    {
        self.getDueniosPendientes();
    }
    
    
    self.getDueniosPendientes();
}); 