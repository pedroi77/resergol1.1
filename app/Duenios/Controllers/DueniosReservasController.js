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
        "Maracana":  {usuario: "pepe", datos:{precio:200, notas:'algunas'} }, aux.nombre: { usuario: "pepe", datos:{precio:200, notas:'algunas'} }
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
    AdministrarCanchasService.query({idComplejo: self.IdComplejo, aux:0}).$promise.then(function(dataCancha){ //, aux: 0
        
        //cargo la lista de las canchas del complejo
        ///self.reservas.canchas = dataCancha; 
        //self.canchas = data;
        console.log(dataCancha);
        var index = 0;
        
        //Recorro la lista de canchas por complejo 
        angular.forEach(dataCancha, function(unaCancha) { //self.reservas.canchas
        
            //console.log(unaCancha.nombre);
            $scope.data[0].push({"nombre": unaCancha.nombre, "estilo": "background-color:#B5CBDE;", referencia:"" , pagado:0, precioCancha: 0});
        
            //Traigo las reservas de cada cancha
            DueniosReservasServices.query({idComplejo: self.IdComplejo, fecha: self.Fecha, idCancha: unaCancha.IdCancha}).$promise.then(function(dataRes){
               
                //console.log(index);
                
                if(index == 0){
                    
                    var i = 1;
                    
                    //recorro la primer lista de "reservas" para llenar la lista de horas
                    angular.forEach(dataRes, function(h) {
            
                        $scope.data[i] = [{"nombre": h.hora, "estilo": "background-color:#B5CBDE;", referencia:"", pagado:0, precioCancha: 0}];
                        i++;
                    });
                }
                
                //Lleno cada cancha con su lista de reservas
                dataCancha[index].datos = dataRes;
                index++;

                var index2 = 1;
                
                //Recorro la lista de reservas
                angular.forEach(dataRes, function(res) {
                    
                    var estilo = "background-color:#FF6E6E;";
                    
                    if(res.usuario == null){
                        
                        res.usuario = "Disponible";
                        estilo = "background-color:#A5D29C;";
                    }

                    $scope.data[index2][index] = {"nombre": res.usuario, "estilo": estilo, referencia:"#reservasModal", pagado:res.Pagado, precioCancha: res.precioCancha}; 
                    index2++;
                });
            });
        });  
    });
};
    
this.obtenerDiaActual = function(){
    
    var hoy = new Date();
    var dd = hoy.getDate();
    var mm = hoy.getMonth()+1; //hoy es 0!
    var yyyy = hoy.getFullYear();

    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    hoy = mm+'/'+dd+'/'+yyyy;
    
    console.log(hoy);
}
    
self.traerReservas();
self.obtenerDiaActual();
    
});