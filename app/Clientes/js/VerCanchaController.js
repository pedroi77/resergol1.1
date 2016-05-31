/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerCanchaController", function($scope, $state, $stateParams, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DuenioDiasService){
	
    var self = this;
    $scope.cancha = [];
    $scope.idCancha = $stateParams.idCan;
    $scope.idComplejo = $stateParams.idComp;
    $scope.idDuenio = -1;
    this.diasComplejo = [];
    $scope.dt = null;
    
    $scope.horaDesde = 0;
    $scope.horasDesde = [];
    $scope.horaHasta = 24;
    
    $scope.horaDesde2 = 0;
    $scope.horasDesde2 = [];
    $scope.horaHasta2 = 24;
    
    $scope.paso1Completo = false;
    $scope.precioAPagar = 0;
    
    this.getCancha = function(){
        
			CanchasService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo}).$promise.then(function(data){
                    $scope.cancha = data;
                    $scope.idDuenio = data[0].IdDuenio; 
                
                DuenioDiasService.query({idDuenio:$scope.idDuenio}).$promise.then(function(data) {
                    self.diasComplejo = data;
                }); 
   
            });	
	};
    
    
   self.getCancha();
    
    
    this.mostrarReservar = function(){
             $state.go('Clientes.verCancha.Reservar');  
    };

    
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });
    });
    

    
    
    
    
     /*INICIO FECHAS*/
    /*PARA FECHAS*/

     $scope.today = function() {         
        $scope.dt = new Date();
      };
      //$scope.today();

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
        //maxDate: new Date(2020, 5, 22), 
        minDate: new Date(),
        //Hago que no se pueda reservar a mas de 2 meses a futuro.
        maxDate: new Date().setDate(new Date().getDate()+60),
        startingDay: 1
      };

      // Disable weekend selection
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
    /*FIN FECHAS*/
	
    
        //////////////////////////////////////////////////////////
    
    this.cambiaFecha = function(dt)
    {
        $scope.horasDesde = []; //Al cambiar de día, limpio el array de horas.
        $scope.horasHasta = []; //Al cambiar de día, limpio el array de horas.
        $scope.selectedHoraDId = 1;
        
        $scope.fechaElegida = dt;
        
        var dia = dt.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
        var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
        var horaHastaDia = -1; //Hora que cierra para el día seleccionado.

        if(dia == 0)
        dia = 7;
        angular.forEach(self.diasComplejo, function(aux) {
        if(parseInt(aux.iddia) == dia)
        {
            //INICIO-HORADESDE---------------------------------------------------------------------------------
            $scope.horaDesde = new Date(1970, 0, 1, parseInt(aux.HoraDesde.substring(0,2)), 00, 0);
            $scope.horaD = aux.HoraDesde;
            
            $scope.horaHasta = new Date(1970, 0, 1, parseInt(aux.HoraHasta.substring(0,2)), 00, 0);
            //Tomo los dos primeros valores de HoraHasta, y le resto uno, ya que si el complejo cierra a las 23,
            //la ultima hora a la que puedo alquilar es a las 22!.
            var ultimaHora = parseInt(aux.HoraHasta.substring(0,2));
            ultimaHora = ultimaHora - 1;
            
            $scope.horaH = ultimaHora + ':00';
            
            $scope.horaDesde2 = $scope.horaDesde;
            $scope.horaHasta2 = $scope.horaHasta;
            
            //---------------------------------------------------------------------------------------------------
            var ultimaHora2 = parseInt(aux.HoraHasta.substring(0,2));
            $scope.horaH2 = ultimaHora2 + ':00';
            
            var primerHora2 = parseInt(aux.HoraDesde.substring(0,2));
            $scope.horaD2 = primerHora2 + ':00';

        }
        });

        
    };
    
    
    
    this.changeSelectedHoraD = function(horaDesde)
    {
        var primerHora2 = parseInt(horaDesde.getHours() + 1);
        $scope.horaD2 = primerHora2 + ':00';
        
        
        /*Valido si puedo calcular el precio de la cancha y activar el primer botón de pago*/
        ////////////////////////////////////////////////////////////////////////////////////////////////
        console.log('horadesde2 ->' + $scope.horaDesde2);
        console.log('horadesde ->' + horaDesde);
        var horasAlquilar = $scope.horaDesde2 - $scope.horaDesde;
        console.log(horasAlquilar);
        $scope.precioAPagar = $scope.cancha[0].Precio;
        
        //*******************************************************************************///////////////
        
    };
    
    this.changeSelectedHoraH = function(horaDesde2)
    {
        /*Valido si puedo calcular el precio de la cancha y activar el primer botón de pago*/
        ////////////////////////////////////////////////////////////////////////////////////////////////
        
        /*console.log(horaDesde2 + '-' + document.getElementById("horaDesde").value);
        var horasReservar = horaDesde2 - document.getElementById("horaDesde").value;
        $scope.precioAPagar = $scope.cancha[0].Precio * horasReservar;*/
        
        //*******************************************************************************///////////////
        
    };
    
    
    
    /////////////////////////////////////////////////////////////
    
    
    
[]});
