/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerCanchaController", function($scope, $state, $stateParams, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DuenioDiasService, ReservasService){
	
    var self = this;
    
    $scope.cancha = [];
    $scope.idCancha = $stateParams.idCan;
    $scope.idComplejo = $stateParams.idComp;
    $scope.idDuenio = -1;
    this.diasComplejo = [];
    $scope.dt = null;
    
    this.horaDesde = 0;
    this.horasDesde = [];
    this.horaHasta = 24;
    
    this.horaDesde2 = 0;
    this.horasDesde2 = [];
    this.horaHasta2 = 24;
    
    $scope.paso1Completo = false;
    $scope.precioAPagar = 0;
    
    $scope.fechaPartido = null;
    $scope.hDesdePartido = null;
    $scope.hHastaPartido = null;
    
    this.Reserva ={
                        idCliente:sessionStorage.id,
                        idComplejo: $scope.idComplejo,
                        idCancha: $scope.idCancha,
                        fechaPartido: null,
                        horaD: '18:00:00',
                        horaH: '19:00:00',
                        importeAPagar: 800,
                        pagado: 800,
                        porcentajePago: 100,
                        estadoReserva: 2 //1-Señado 2-PagoCompleto
                      };
    
    
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
    

    this.paso1Click = function(){
        $('ul.setup-panel li:eq(1)').removeClass('disabled');
        $('ul.setup-panel li a[href="#step-2"]').trigger('click');
        $(this).remove();
        
        function pad(n) {return n < 10 ? "0"+n : n;}
            $scope.fechaPartido = pad($scope.fechaElegida.getDate())+"/"+pad($scope.fechaElegida.getMonth()+1)+"/"+$scope.fechaElegida.getFullYear();
        
        
    };
    
    
    
    
    this.reservar = function(){
    
        var ReservaNueva = new ReservasService();
        
        self.Reserva.fechaPartido = $scope.fechaPartido;
        self.Reserva.horaD = $scope.hDesdePartido;
        self.Reserva.horaH = $scope.hHastaPartido;
        
        console.log(self.Reserva.fechaPartido);
        console.log(self.Reserva.horaD);
        console.log(self.Reserva.horaH);
        ReservaNueva.data=self.Reserva;
        
        ReservasService.save(ReservaNueva.data, function(reponse){
                idReserva = reponse.data[0];
                console.log('idReserva -->' + idReserva);
              },function(errorResponse){
                console.log('ERROR...'); 
             });
    };
    
    
    
    this.pagarYReservar = function(){
        
        if(confirm('¿Seguro desea realizar el pago?'))
        {
            $('ul.setup-panel li:eq(2)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-3"]').trigger('click');
            //$(this).remove();
            $(this).prop('disabled', true);
            
            //Preparo los parametros para reservar la cancha.
            function pad(n) {return n < 10 ? "0"+n : n;}
            //$scope.fechaPartido = pad($scope.fechaElegida.getDate())+"/"+pad($scope.fechaElegida.getMonth()+1)+"/"+$scope.fechaElegida.getFullYear();
            //var fechaPartido = $scope.fechaElegida.toLocaleDateString();
            $scope.hDesdePartido = self.horaDesde.getHours() + ":00:00";
            $scope.hHastaPartido = self.horaDesde2.getHours() + ":00:00";        
            //console.log(fechaPartido);
            
            //******************************************************************************************************************//
            
            //Probando a reservar con valores hardcodeados
            self.reservar();
             
        }
    };
    
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
        maxDate: new Date().setDate(new Date().getDate+60),
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
        self.horasDesde = []; //Al cambiar de día, limpio el array de horas.
        self.horasHasta = []; //Al cambiar de día, limpio el array de horas.
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
            self.horaDesde = new Date(1970, 0, 1, parseInt(aux.HoraDesde.substring(0,2)), 00, 0);
            self.horaD = aux.HoraDesde;
            
            self.horaHasta = new Date(1970, 0, 1, parseInt(aux.HoraHasta.substring(0,2)), 00, 0);
            //Tomo los dos primeros valores de HoraHasta, y le resto uno, ya que si el complejo cierra a las 23,
            //la ultima hora a la que puedo alquilar es a las 22!.
            var ultimaHora = parseInt(aux.HoraHasta.substring(0,2));
            ultimaHora = ultimaHora - 1;
            
            self.horaH = ultimaHora + ':00';
            
            //$scope.horaDesde2 = $scope.horaDesde;
            var horaDesdeSelect = parseInt(self.horaDesde.getHours() + 1);
            horaDesdeSelect = horaDesdeSelect + ':00';
            var horad2 = new Date(1970, 0, 1, parseInt(horaDesdeSelect));
            self.horaDesde2 = horad2;
            
            //self.horaHasta2 = self.horaHasta;
            
            //---------------------------------------------------------------------------------------------------
            var ultimaHora2 = parseInt(aux.HoraHasta.substring(0,2));
            self.horaH2 = ultimaHora2 + ':00';
            
            var primerHora2 = parseInt(aux.HoraDesde.substring(0,2));
            var primerHora22 = parseInt(self.horaDesde.getHours()) + 1;
            self.horaD2 = primerHora22 + ':00';
            

        }
        });
        
        self.calcularPrecioReservar();
        
    };
    
    
    
    this.changeSelectedHoraD = function(horaDesde)
    {
        //var primerHora2 = parseInt(horaDesde.getHours() + 1);
        //$scope.horaD2 = primerHora2 + ':00';
        
        //CORREGIR EL CAMBIO DE AM A PM....
        //console.log('<<<<<<<<<' + parseInt(horaDesde.getHours()));
        if(parseInt(horaDesde.getHours() == 12))
            {
            self.horaDesde = new Date(1970, 0, 1, parseInt(horaDesde.getHours()));
                console.log('es 12');
                }
        else
            {
                //self.horaDesde = new Date(1970, 0, 1, 13);
            }
            
        //Actualizo el model de la segunda hora (hora hasta).
        var horaDesdeSelected = 0
        if(horaDesde.getHours() == 12)
            horaDesdeSelected = 1;
        else
            horaDesdeSelected = parseInt(horaDesde.getHours() + 1);
        
        horaDesdeSelected = horaDesdeSelected + ':00';
        //var hora1 = new Date(1970, 0, 1, parseInt(document.getElementById("horaDesdee").value));
        var hora1 = new Date(1970, 0, 1, parseInt(horaDesdeSelected));
        console.log(hora1);

        self.horaDesde2 = hora1;
        
        var primerHora22 = 0;
        if(parseInt(self.horaDesde.getHours() == 12))
            primerHora22 = 1;
        else
          primerHora22 = parseInt(self.horaDesde.getHours()) + 1;
        
        self.horaD2 = primerHora22 + ':00';
        
        
        /*Valido si puedo calcular el precio de la cancha y activar el primer botón de pago*/
        ////////////////////////////////////////////////////////////////////////////////////////////////
        //console.log('horadesde2 ->' + $scope.horaDesde2);
        //console.log('horadesde ->' + horaDesde);
        //var horasAlquilar = $scope.horaDesde2 - $scope.horaDesde;
        //console.log(horasAlquilar);
        //$scope.precioAPagar = $scope.cancha[0].Precio;
        
        //*******************************************************************************///////////////
        
        
        self.calcularPrecioReservar();
        
    };
    
    this.changeSelectedHoraH = function(horaDesde2)
    {
        /*Valido si puedo calcular el precio de la cancha y activar el primer botón de pago*/
      
        //*******************************************************************************///////////////
        
        self.calcularPrecioReservar();
    };
    
    
    this.validarFechaYHora = function()
    {   
        var fecha = document.getElementById("fecha").value;
        if(fecha == "" || fecha == null || fecha == undefined)
            return false;
        
        var hdes = self.horaDesde;
        if(hdes == "" || hdes == null || hdes == undefined)
            return false;
        
        var hhas = self.horaDesde2; 
        if(hhas == "" || hhas == null || hhas == undefined)
            return false;
        
        
        
        return true;
        
        
    };
    
    $scope.clickRadioButton = function()
    {
        self.calcularPrecioReservar();
    };
    
    
    this.calcularPrecioReservar = function()
    {
        //Calculo el precio a pagar siempre y cuando se haya elegido una fecha y hora desde y hasta.
        if(this.validarFechaYHora())
        {
            //Traigo las hora desde y hasta.
            var hd = parseInt(self.horaDesde.getHours());
            var hh = parseInt(self.horaDesde2.getHours());
            console.log('desde->' + hd);
            console.log('hasta->' + hh);
            
            //Falta fijarme si alguna de las horas se va a cobrar con luz...!!!!!!!!!
            
            //Calculo cuantas horas se van a alquilar...
            var horasAlq = hh - hd;
            console.log('horas alq--> ' + horasAlq);
            var precio = parseFloat($scope.cancha[0].Precio);
            var horaLuz = -1;
            if($scope.cancha[0].HoraCobroLuz != undefined && $scope.cancha[0].HoraCobroLuz != null)
                horaLuz = $scope.cancha[0].HoraCobroLuz.substring(0,2);
            console.log('luz desde-->' + horaLuz);
            var porcentajeLuz = 0;
            if($scope.cancha[0].PorcentajeLuz != null && $scope.cancha[0].PorcentajeLuz != undefined);
                porcentajeLuz = parseFloat($scope.cancha[0].PorcentajeLuz);
                    
            console.log('porcent luz-->' + porcentajeLuz);
            
            var horasConLuz = 0;
            if($scope.cancha[0].Luz == 1 && horaLuz != -1)
            {
                for (i=0; i<horasAlq; i++)
                {
                    var num =  parseInt(hd + i);
                    console.log(num);
                    if(num >= horaLuz)
                        horasConLuz++;
                }   
            }
            
            var precioAMostrar = 0;
            if(horasConLuz == 0)
                precioAMostrar = precio * horasAlq;
            else if(horasConLuz == horasAlq){
                precioAMostrar = (precio * horasAlq) + ((precio * horasAlq) * porcentajeLuz / 100);
                console.log('precio*horasalq->' + precio * horasAlq);
                console.log('*' + porcentajeLuz);
            }
            else //Si una parte se cobra con luz y otra no...
                {
                    console.log('porcentajeluz--> ' + porcentajeLuz);
                    var precioCLuz = (precio * horasConLuz) + ((precio * horasConLuz) * porcentajeLuz / 100);
                    var precioSLuz = (horasAlq - horasConLuz) * precio;
                    
                    precioAMostrar = precioCLuz + precioSLuz;
                }
            
            //console.log('precioamostrar-> ' + precioAMostrar);
            
            
            if (document.getElementById('rbPagaCanchaCompleta').checked)
            {
                $scope.precioAPagar = precioAMostrar;    
            }
            else if(document.getElementById('rbPagaSeña').checked)
            {
                var PorcentSenia = 0;
                console.log('porcentttttt ' + $scope.cancha[0].PorcentSenia);
                if($scope.cancha[0].PorcentSenia != undefined && $scope.cancha[0].PorcentSenia != null)
                    PorcentSenia = parseFloat($scope.cancha[0].PorcentSenia);
                
                if(PorcentSenia > 0)
                    $scope.precioAPagar = parseFloat(precioAMostrar * PorcentSenia) / 100 ;
                else
                    $scope.precioAPagar = 0;
            }
            
            //console.log('calculo el precio...->' + );
        
        }
        else
        {
            //NO CALCULO NADA............
            console.log('no calculo nada...');
            
        }
            
        
    };
    


    
[]});
