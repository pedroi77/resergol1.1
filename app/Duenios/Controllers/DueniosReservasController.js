var resergolApp = angular.module("resergolApp");

resergolApp.controller("DueniosReservasController", function($scope, DueniosReservasServices, AdministrarCanchasService, DuenioDiasService, $state, $uibModal,  $uibModalStack){
    
/*************************************SECCION DE VARIABLES*****************************************************/
var self = this;
  
//this.reservas = [];
this.canchas = [];
this.IdComplejo = sessionStorage.idComplejo;
this.IdDuenio = sessionStorage.id;
this.Fecha = '';
    
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

this.diasComplejo = null;

this.reservaSeleccionada = {
    
    NombreCancha: ''
    ,CantJugadores: 0
    ,Superficie: ''
    ,Usuario: ''
    ,Precio: '0'
    ,Pagado: '0'
    ,Resta: '0'
    ,EstadoReserva: 0
};
    
$scope.data= [
//["Hora", "Maracana", "Lencho"],
//["11:00", "Disponible", "Matias"]

["Hora"]
];
    
this.fechaSeleccionada = new Date();
    
/*************************************SECCION DE METODOS*****************************************************/
    
this.traerReservas = function(){
    
    //Traigo todas las canchas del complejo del dueño que se logueo
    AdministrarCanchasService.query({idComplejo: self.IdComplejo, aux:0}).$promise.then(function(dataCancha){ //, aux: 0
        
        //cargo la lista de las canchas del complejo
        ///self.reservas.canchas = dataCancha; 
        //self.canchas = data;
        //console.log(dataCancha);
        var index = 0;
        
        //Recorro la lista de canchas por complejo 
        angular.forEach(dataCancha, function(unaCancha) { //self.reservas.canchas
        
            //console.log(unaCancha.nombre);
            $scope.data[0].push({"nombre": unaCancha.nombre, "estilo": "background-color:#B5CBDE;", referencia:"" , pagado:0, precioCancha: 0, "nombreCancha": '', "cantJugadores": '', "superficie": '', "resta": 0, "estadoReserva": 0});
        
            //Traigo las reservas de cada cancha
            DueniosReservasServices.query({idComplejo: self.IdComplejo, fecha: self.Fecha, idCancha: unaCancha.IdCancha}).$promise.then(function(dataRes){
               
                if(index == 0){
                    var i = 1;
                    //recorro la primer lista de "reservas" para llenar la lista de horas
                    angular.forEach(dataRes, function(h) {
                        $scope.data[i] = [{"nombre": h.hora, "estilo": "background-color:#B5CBDE;", referencia:"", pagado:0, precioCancha: 0, "nombreCancha": '', "cantJugadores": '', "superficie": '', "resta": 0, "estadoReserva": 0}];
                        i++;
                    });
                }
                
                //Lleno cada cancha con su lista de reservas
                var auxindexCancha ;
                var auxJ
                
                for(auxindexCancha =0;auxindexCancha < dataCancha.length;auxindexCancha++){
                    if(dataCancha[auxindexCancha].nombre == dataRes[0].nombre){
                        auxJ = auxindexCancha+1;   
                        dataCancha[auxindexCancha].datos = dataRes;
                    }
                }
                
                
                index++;
                
                
                var index2 = 1;
                
                //Recorro la lista de reservas
                //console.log(auxJ);
                angular.forEach(dataRes, function(res) {
                    
                    var estilo = "background-color:#FF6E6E;";
                    
                    if(res.usuario == null){
                        res.usuario = "Disponible";
                        estilo = "background-color:#A5D29C;";
                    }
                    //console.log(index);
                    $scope.data[index2][auxJ] = {"nombre": res.usuario, "estilo": estilo, "referencia":"#reservasModal", "pagado":res.Pagado, "precioCancha": res.precioCancha, "nombreCancha": res.nombre, "cantJugadores": res.CantJugadores, "superficie": res.superficie, "resta": res.resta, "estadoReserva": res.estadoReserva}; 
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
    
    //var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"); 
    //var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"); 
    //var fechaComplejo =new Date(); 
    //console.log(diasSemana[fechaComplejo.getDay()] + " " + fechaComplejo.getDate() + " de " + meses[fechaComplejo.getMonth()] + " de " + fechaComplejo.getFullYear());

    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    self.Fecha = yyyy+'-'+mm+'-'+dd;
}
    
 this.init = function(){
     
     DuenioDiasService.query({idDuenio:$scope.idDuenio}).$promise.then(function(data) {
        self.diasComplejo = data;
    }); 
     
     self.traerReservas();
     self.obtenerDiaActual();
 }
 
this.clic = function(indice, fila){
    
    //console.log(indice);
    //console.log(fila);
    //console.log(fila[indice]);

    self.reservaSeleccionada.NombreCancha = fila[indice].nombreCancha;
    self.reservaSeleccionada.CantJugadores = fila[indice].cantJugadores;
    self.reservaSeleccionada.Superficie = fila[indice].superficie;
    
    if(fila[indice].nombre == 'Disponible')
        self.reservaSeleccionada.Usuario = '';
    else
        self.reservaSeleccionada.Usuario = fila[indice].nombre;
    
    self.reservaSeleccionada.Precio = fila[indice].precioCancha;
    
    if(fila[indice].pagado == null)
        self.reservaSeleccionada.Pagado = '0';
    else
        self.reservaSeleccionada.Pagado = "$" + fila[indice].pagado;
    
    if(fila[indice].resta == null)
        self.reservaSeleccionada.Resta = '';
    else
        self.reservaSeleccionada.Resta = "$" + fila[indice].resta;
    
    self.reservaSeleccionada.EstadoReserva = fila[indice].estadoReserva;
    
    console.log(fila[indice].nombreCancha);
    console.log(self.reservaSeleccionada);
};
    
this.cambiaFecha = function(dt)
{   
    function pad(n) {return n < 10 ? "0"+n : n;}
    $scope.fechaElegida = dt;

    var hoy = new Date();
    hoy = pad(hoy.getFullYear()+"-"+pad(hoy.getMonth()+1)+"-"+hoy.getDate());

    $scope.data= [
            ["Hora"]
        ];
    
    self.Fecha = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());

    self.traerReservas();
    
    //console.log('hoy-> ' + hoy);
    //console.log('eleccion-> ' + fechaSelect);

};
    
function disabled(data) {
    var date = data.date,
    mode = data.mode;
    //Acá deshabilito los días que el complejo no abre.
    /*
    0 = domingo.
    1 = lunes.
    2 = martes.
    3 = miercoles.
    4 = jueves.
    5 = viernes.
    6 = sabado.
    */
    var diasQueAbre = []; 
    angular.forEach(self.diasComplejo, function(aux) {
        switch(aux.iddia) {
            case '1':
            diasQueAbre.push(1);
            break;
            case '2':
            diasQueAbre.push(2);
            break;
            case '3':
            diasQueAbre.push(3);
            break;
            case '4':
            diasQueAbre.push(4);
            break;
            case '5':
            diasQueAbre.push(5);
            break;
            case '6':
            diasQueAbre.push(6);
            break;
            case '7':
            diasQueAbre.push(0);
            break;
        }
    });

    return mode === 'day' && diasQueAbre.indexOf(date.getDay()) === -1;
}

/*************************************SECCION DE LLAMADOS*****************************************************/
self.init();
    
/******************************SECCION FECHAS********************************************************/ 
    $scope.today = function() {
        $scope.dt = new Date();
      };
      $scope.today();

      $scope.clear = function() {
        $scope.dt = null;
      };
    
         
      $scope.inlineOptions = {
        customClass: getDayClass,
        minDate: new Date(),
        showWeeks: true
      };

      $scope.dateOptions = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2020, 5, 22),
        minDate: new Date(),
        startingDay: 1
      };

      // Disable weekend selection
      function disabled(data) {
        var date = data.date,
          mode = data.mode;
        //return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
          //return mode === 'day' && (date < new Date(2016,04,21));
      }
    
      $scope.dateOptionsFechaFiltro = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.toggleMin = function() {
        $scope.dateOptionsFechaFiltro.minDate = new Date();
      };

      $scope.toggleMin();

      $scope.open1 = function() {
        $scope.popup1.opened = true;
      };

      $scope.open2 = function() {
        $scope.popup2.opened = true;
      };

      $scope.setDate = function(year, month, day) {
        $scope.dt = new Date(year, month, day);
      };

      $scope.formats = ['dd/MM/yyyy', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
      $scope.format = $scope.formats[0];
      $scope.altInputFormats = ['M!/d!/yyyy'];

      $scope.popup1 = {
        opened: false
      };

      $scope.popup2 = {
        opened: false
      };

      var tomorrow = new Date();
      tomorrow.setDate(tomorrow.getDate() + 1);
      var afterTomorrow = new Date();
      afterTomorrow.setDate(tomorrow.getDate() + 1);
      $scope.events = [
        {
          date: tomorrow,
          status: 'full'
        },
        {
          date: afterTomorrow,
          status: 'partially'
        }
      ];

      function getDayClass(data) {
        var date = data.date,
          mode = data.mode;
        if (mode === 'day') {
          var dayToCheck = new Date(date).setHours(0,0,0,0);

          for (var i = 0; i < $scope.events.length; i++) {
            var currentDay = new Date($scope.events[i].date).setHours(0,0,0,0);

            if (dayToCheck === currentDay) {
              return $scope.events[i].status;
            }
          }
        }

        return '';
      }

});