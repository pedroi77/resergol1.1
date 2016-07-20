var resergolApp = angular.module("resergolApp");

resergolApp.controller("DueniosReservasController", function($scope, DevolucionesService, ReservasCancelacionService, ReservasService, DueniosReservasServices, DuenioReservasCompletarPagoService, AdministrarCanchasService, DuenioDiasService, $state, $uibModal,  $uibModalStack){
    
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
    ,Pagado: 0
    ,Resta: 1000
    ,EstadoReserva: 0
    ,IdReserva: 0
    ,puedeCancelar: false
    ,HorasCancelacion: ''
    ,IdCliente: 0
    ,TotalPagar: 0
    ,IdCancha:0
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
            $scope.data[0].push({"nombre": unaCancha.nombre, "estilo": "background-color:#B5CBDE;", referencia:"" , pagado:0, precioCancha: 0, "nombreCancha": '', "cantJugadores": '', "superficie": '', "resta": 0, "estadoReserva": 0, "idReserva": 0, "hora": '', "horasCancelacion": 0, "idCliente": 0, "TotalPagar": 0, "idCancha": 0});
        
            //Traigo las reservas de cada cancha
            DueniosReservasServices.query({idComplejo: self.IdComplejo, fecha: self.Fecha, idCancha: unaCancha.IdCancha}).$promise.then(function(dataRes){
               
                if(index == 0){
                    var i = 1;
                    //recorro la primer lista de "reservas" para llenar la lista de horas
                    angular.forEach(dataRes, function(h) {
                        $scope.data[i] = [{"nombre": h.hora, "estilo": "background-color:#B5CBDE;", referencia:"", pagado:0, precioCancha: 0, "nombreCancha": '', "cantJugadores": '', "superficie": '', "resta": 0, "estadoReserva": 0, "idReserva": 0, "hora": '', "horasCancelacion": 0, "idCliente": 0,"TotalPagar": 0,"idCancha":0}];
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
                    $scope.data[index2][auxJ] = {"nombre": res.usuario, "estilo": estilo, "referencia":"#reservasModal", "pagado":res.Pagado, "precioCancha": res.precioCancha, "nombreCancha": res.nombre, "cantJugadores": res.CantJugadores, "superficie": res.superficie, "resta": res.resta, "estadoReserva": res.estadoReserva, "idReserva": res.IdReserva, "hora": res.hora, "horasCancelacion": res.CancelacionHasta, "idCliente": res.idCliente,"TotalPagar": 0,"idCancha": res.IdCancha}; 
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
     
    $scope.data= [
        ["Hora"]
    ];
     
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
    
    /***************************TEMA HORA****************************************/
    var hora;
    var Digital=new Date();
    var hours=Digital.getHours();
    var minutes=Digital.getMinutes();
    var seconds=Digital.getSeconds();
    var dn="AM";
    
    if (hours>12){
        dn="PM";
    }
    
    if (hours==0)
        hours=12;
    
    if (minutes<=9)
        minutes="0"+minutes;
    
    if (seconds<=9)
        seconds="0"+seconds;

    hora = hours + ":" + minutes + ":" + seconds;
    
    /*******************************************************************/
    
    if(fila[indice].hora < hora)
        self.reservaSeleccionada.puedeCancelar = true;
    else
        self.reservaSeleccionada.puedeCancelar = false;
    
    console.log(self.reservaSeleccionada.puedeCancelar);

    self.reservaSeleccionada.Usuario = '';
    self.reservaSeleccionada.NombreCancha = fila[indice].nombreCancha;
    self.reservaSeleccionada.CantJugadores = fila[indice].cantJugadores;
    self.reservaSeleccionada.Superficie = fila[indice].superficie;
    
    if(fila[indice].nombre == 'Disponible')
        self.reservaSeleccionada.Usuario = '';
    else
        self.reservaSeleccionada.Usuario = fila[indice].nombre;
    
    self.reservaSeleccionada.Precio = fila[indice].precioCancha;
    
    if(fila[indice].pagado == null)
        self.reservaSeleccionada.Pagado = 0;
    else
        self.reservaSeleccionada.Pagado = parseInt(fila[indice].pagado);
    
    if(fila[indice].resta == null)
        self.reservaSeleccionada.Resta = 1000;
    else
        self.reservaSeleccionada.Resta = parseInt(fila[indice].resta);
    
    self.reservaSeleccionada.EstadoReserva = fila[indice].estadoReserva;
    self.reservaSeleccionada.IdReserva = fila[indice].idReserva;
    self.reservaSeleccionada.HorasCancelacion = fila[indice].horasCancelacion; 
    self.reservaSeleccionada.IdCliente = fila[indice].idCliente;
    self.reservaSeleccionada.IdCancha = fila[indice].idCancha;
    
};
    
this.cambiaFecha = function(dt)
{   
    function pad(n) {return n < 10 ? "0"+n : n;}
    $scope.fechaElegida = dt;

    var hoy = new Date();
    hoy = pad(hoy.getFullYear()+"-"+pad(hoy.getMonth()+1)+"-"+hoy.getDate());
    
    self.Fecha = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());

    self.traerReservas();
    
    //console.log('hoy-> ' + hoy);
    //console.log('eleccion-> ' + fechaSelect);

};
    
this.CalcularResta = function(){
    
    self.reservaSeleccionada.Resta = self.reservaSeleccionada.Resta - self.reservaSeleccionada.Pagado;
    
    var pago = document.getElementById('pagado').value;
    
    console.log(pago);
    
    console.log(self.reservaSeleccionada.Resta + " - " + self.reservaSeleccionada.Pagado);
};
    
this.compararFechas = function (DateA, DateB) {     // this function is good for dates > 01/01/1970

    var a = new Date(DateA);
    var b = new Date(DateB);

    var msDateA = Date.UTC(a.getFullYear(), a.getMonth()+1, a.getDate());
    var msDateB = Date.UTC(b.getFullYear(), b.getMonth()+1, b.getDate());
    console.log(msDateA);
    console.log(msDateB);

    if (parseFloat(msDateA) < parseFloat(msDateB))
      return -1;  // lt
    else if (parseFloat(msDateA) == parseFloat(msDateB))
      return 0;  // eq
    else if (parseFloat(msDateA) > parseFloat(msDateB))
      return 1;  // gt
    else
      return null;  // error
};
    
this.borrarReserva = function()
{
    /*Verifico si puede cancelar la reserva.
     Para esto, tanto la fecha de hoy, como la del partido, debe ser
     Menor a la FechaCancelacion que traigo desde el SP,
     Si el cliente había pagado algo, se le devuelve el importe...
    */

    //Hay tiempo para realizar la cancelacion hasta esta fecha/hora
    function pad(n) {return n < 10 ? "0"+n : n;}
    var fCancelacion = self.reservaSeleccionada.HorasCancelacion.substring(0,16);
    var vAhora = new Date();
    var ahora = vAhora.getFullYear()+"-"+pad(vAhora.getMonth()+1)+"-"+pad(vAhora.getDate())+" "+ vAhora.getHours()+":"+vAhora.getMinutes();

    var result = self.compararFechas(fCancelacion, ahora);
    //var fPartido = res.FPartido.substring(0,16);
    //var result2 = self.compararFechas(fPartido, ahora);

    var devuelvo = true;
    if(result == -1) //SI YA NO SE PUEDE CANCELAR CON DEVOLUCION
        devuelvo = false;

    var sPag = parseFloat(self.reservaSeleccionada.Pagado);
    var msj = "";
    
    if(!devuelvo)
        msj = "No se realizará el reembolso ya que se superaron las horas de antelación de aviso";
    else if(sPag > 0) 
        msj = "Se reembolsarán la suma de $ " + sPag + ".";

    bootbox.confirm("¿Seguro desea cancelar la reserva? <br>" + msj, function(result) {
        if(result)
        {
            if(sPag > 0 && devuelvo)
            {
              //INSERTO LA DEVOLUCION
                var devNueva = new DevolucionesService();
                devNueva.data = {
                    "idCliente": self.reservaSeleccionada.IdCliente,
                    "idDuenio": self.IdDuenio,
                    "monto": parseFloat(self.reservaSeleccionada.Pagado)
                };  

                DevolucionesService.save(devNueva.data, function(reponse){
                        idRetorno = reponse.data[0];
                        console.log('se guardo devolucion -->' + idRetorno);

                        ReservasCancelacionService.delete({idReserva: self.reservaSeleccionada.IdReserva}, function(reponse){
                            idRetorno = reponse.data[0];
                            console.log('SE BORRO...... RETORNO -->' + idRetorno);
                            
                            self.init();
                            bootbox.alert("¡Cancelación de reserva, y reembolso exitoso!", function() {});
                            },function(errorResponse){
                                console.log('ERROR BORRAR RES...' + errorResponse); 
                            });

                      },function(errorResponse){
                        console.log('ERROR devolucion...' + errorResponse); 
                     }); 
            }
            else
            {
                ReservasCancelacionService.delete({idReserva: self.reservaSeleccionada.IdReserva}, function(reponse){
                    idRetorno = reponse.data[0];
                    console.log('SE BORRO...... RETORNO -->' + idRetorno);
                    
                    
                    self.init();
                    bootbox.alert("¡Cancelación de reserva exitosa!", function() {});
                },function(errorResponse){
                    console.log('ERROR BORRAR RES...' + errorResponse); 
                });
            }
        }
    }); 
};
    
this.reservar = function(aceptaReservaFija){

    var ReservaNueva = new ReservasService();
/*
    self.Reserva.fechaPartido = $scope.fechaPartido;
    self.Reserva.horaD = $scope.hDesdePartido;
    self.Reserva.horaH = $scope.hHastaPartido;
    var precioTotal =  $scope.precioAPagar + $scope.restante;
    self.Reserva.importeAPagar = precioTotal;
    self.Reserva.pagado = $scope.precioAPagar;
    self.Reserva.porcentajePago = $scope.porcentajePago;
    var estadoRes = (document.getElementById('rbPagaCanchaCompleta').checked) ? 2 : 1;
    self.Reserva.estadoReserva = estadoRes;*/

    ReservaNueva.data= {
        
        'idCliente': 0
        ,'idComplejo' : self.IdComplejo
        ,'idCancha': self.reservaSeleccionada.IdCancha
        ,'fechaPartido' : this.Fecha
        ,'horaD' : '18:00:00'
        ,'horaH' : '20:00:00'
        ,'importeAPagar' : 1000
        ,'pagado' : 1000
        ,'porcentajePago' : 100
        ,'estadoReserva' : 2
    }
    
    console.log(ReservaNueva.data);

    ReservasService.save(ReservaNueva.data, function(reponse){
            idReserva = reponse.data[0];
            console.log('idReserva -->' + idReserva);
/*
    //Si realizó reserva fija, hago todas las reservas despues de haber reservado la primera normalmente.
    if(aceptaReservaFija == 1)
    {
        var ReservaFijaNueva = new ReservasFijasService();
        ReservaFijaNueva.data = $scope.listasReservasFijas;
        console.log(ReservaFijaNueva.data[0]);
        ReservasFijasService.save(ReservaFijaNueva.data, function(reponse){    
            //idReservaFija = reponse.data[0];
            //console.log('idReserva -->' + idReservaFija);                      
        },function(errorResponse){
            console.log('ERROR res fija...'); 
        });
    }    */

        self.borrarReservaTemp();

      },function(errorResponse){
        console.log('ERROR...'); 
     });




};
    
/**************************************FUNCIONES DE CALENDARIO*********************************************************************************/
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
};
    
this.completarPago = function(){
    
    console.log(self.reservaSeleccionada.IdReserva);
    
    data = self.reservaSeleccionada;
    
    DuenioReservasCompletarPagoService.save(data, function(reponse){
            
        bootbox.alert("Se completo el pago de esta reserva con éxito!", function() {
                
            $scope.data= [
            ["Hora"]
            ];

            self.init();

            $('#reservasModal').modal('hide');

        });
        
         },function(errorResponse){
             console.log('Error');
    });
    

};

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