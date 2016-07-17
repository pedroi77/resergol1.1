var resergolApp = angular.module("resergolApp");

resergolApp.controller("DueniosReservasController", function($scope, DueniosReservasServices, AdministrarCanchasService, $state, $uibModal,  $uibModalStack){
    
//Seccion de Datos
var self = this;
  
//this.reservas = [];
this.canchas = [];
this.IdComplejo = sessionStorage.idComplejo;
this.Fecha = '2016-07-16';
    
this.reservas = {
    
    canchas: [{
        
        datos: []
    }]
}

this.cosas = [
    
    /*{ num: 1},
    { num: 1},
    { num: 1},
    { num: 1},
    { num: 1}*/
]

this.horas = [
    
    
]

this.calcular = "Horas";
    
/**************************************PRUEBA PARA LLENAR LA TABLA DE RESERVAS***************************************************************************/

this.MyRecCollection = [
    /*{
        Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        asdasd:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }, {
        Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }, {
        Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }, {
       Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }, {
       Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }, {
       Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }, {
       Horas: {usuario: "10:00", datos:{precio:200, notas:'algunas'} },
        Horas: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Horas:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    }*/
];
    
//self.MyRecCollection[5].Lencho.usuario = "Flogger";
//var cancha = self.MyRecCollection[5].Monu;
//self.MyRecCollection[5].Monu = {usuario: "Pedrovich", datos:{precio:700, notas:'algunas'} };
    
/*self.MyRecCollection.push({
       Horas: {usuario: "55:00", datos:{precio:700, notas:'algunas'} },
       Maracana: {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
       Fortin:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
       Acade:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
       Monu:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} },
        Lencho:  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }
    })*/

$scope.data= [
//["Hora", "Maracana", "Lencho"],
//["11:00", "Disponible", "Matias"]
    
["Hora"]
];
/********************************************************************************************************************/
    
this.traerReservas = function(){
    
    //Traigo todas las canchas del complejo del dueño que se logueo
    AdministrarCanchasService.query({idComplejo: self.IdComplejo, aux:0}).$promise.then(function(data){ //, aux: 0
        
        //cargo la lista de las canchas del complejo
        self.reservas.canchas = data; 
        //self.canchas = data;
        
        var index = 0;
        
        //Recorro la lista de canchas por complejo 
        angular.forEach(self.reservas.canchas, function(unaCancha) {
        
            //console.log(unaCancha.nombre);
            $scope.data[0].push({"nombre": unaCancha.nombre, "estilo": "background-color:#B5CBDE;"});
        
            //Traigo las reservas de cada cancha
            DueniosReservasServices.query({idComplejo: self.IdComplejo, fecha: self.Fecha, idCancha: unaCancha.IdCancha}).$promise.then(function(data){
                
                console.log(index);
                //Lleno cada cancha con su lista de reservas
                self.reservas.canchas[index].datos = data;
                //self.cosas.push({'usuario': data.usuario, 'hora': data.hora})
                index++;
                
                if(index == 1){
                    
                    var i = 1;
                    //recorro la primer lista de "reservas" para llenar la lista de horas
                    angular.forEach(self.reservas.canchas[0].datos, function(h) {
            
                        //$scope.data[i] = [h.hora];
                        $scope.data[i] = [{"nombre": h.hora, "estilo": "background-color:#B5CBDE;"}];
                        i++;
                    });
                }
                   
                var index2 = 1;
                
                //Recorro la lista de reservas
                angular.forEach(unaCancha.datos, function(res) {
                    
                    var estilo = "background-color:#FF6E6E;";
                    
                    if(res.usuario == null){
                        
                        res.usuario = "Disponible";
                        estilo = "background-color:#A5D29C;";
                    }
                        
                    
                    //$scope.data[index2][index] = index2.toString() + index.toString();//res.usuario + 

                    $scope.data[index2][index] = {"nombre": res.usuario, "estilo": estilo}// 
                    index2++;
                });
            });
        });  
    });
};
    
self.traerReservas();
    
});