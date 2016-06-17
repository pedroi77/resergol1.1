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
    
    this.paso1Completo = false;
    $scope.precioAPagar = 0;
    $scope.restante = 0;
    
    $scope.fechaPartido = null;
    $scope.hDesdePartido = null;
    $scope.hHastaPartido = null;
    
    this.horasD = [];
    this.horasH = [];
    
    this.selectedHoraDId;
    this.selectedHoraHId;
    
    $scope.HorasDisponibles = [];
    $scope.HorasReservasDia = [];
    
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
    
    
    this.getHorasDisponiblesByFecha = function(fecha/*, horaActual*/){
			ReservasService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo, fecha:fecha}).$promise.then(function(data){
                    $scope.HorasDisponibles = data;
                
                
                if($scope.HorasDisponibles.length == 0)
                {
                    alert('No existen horarios disponibles para la fecha seleccionada...')
                    self.horasD = [];
                    self.horasH = [];
                    $scope.dt = null;
                    self.paso1Completo = false;
                    $scope.precioAPagar = 0;
                    $scope.restante = 0;
                }
                else
                {
                
                    this.selectedHoraDId = "1";

                    self.horasD = [];
                    angular.forEach(data, function(aux)
                    {

                      //console.log(aux.hora);
                      var sID = parseInt(aux.hora.substring(0,2));  
                      //if(horaActual != -1)
                          
                      var sDesc = sID + ':00 hs';
                      self.horasD.push({id: sID, desc: sDesc});             

                    });

                    self.selectedHoraDId = self.horasD[0].id;  

                    /****************************************************************************************/

                    var dia = $scope.fechaElegida.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
                    var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
                    var horaHastaDia = -1; //Hora que cierra para el día seleccionado.

                    if(dia == 0)
                        dia = 7;

                    var HoraAbre = -1;
                    var HoraCierra = -1;

                    angular.forEach(self.diasComplejo, function(aux) {
                        if(parseInt(aux.iddia) == dia)
                        {
                            HoraAbre = parseInt(aux.HoraDesde.substring(0,2));
                            HoraCierra = parseInt(aux.HoraHasta.substring(0,2));
                            if(HoraCierra == 0)
                                HoraCierra = 24;

                            return;
                        }
                    });

                    self.getHorariosReservasByDia(fecha,  self.selectedHoraDId, HoraCierra);    

                }
                
	       });
        
        };
    
    
    this.getHorariosReservasByDia = function(fecha, horaSeleccionada, horaCierra)
    {
        ReservasService.query({idComplejoo:$scope.idComplejo, idCanchaa:$scope.idCancha, fechaHorarios:fecha, bReservas:1}).$promise.then(function(data){
            $scope.HorasReservasDia = data;
            //console.log('data' + $scope.HorasReservasDia[0].HoraInicio);
            
            
            self.horasH = [];
            
            if($scope.HorasReservasDia.length > 0) //Si hay reservas para el dia, sino, lo manejo como lo hago actualmente...
            {
                //for de 23 a 24
                for(i=horaSeleccionada+1; i<=horaCierra; i++)
                {
                    var bAgrego = true;
                    //HoraInicio y Fin de las reservas del dia ordenadas por HoraInicio.
                    angular.forEach($scope.HorasReservasDia, function(aux)
                    {   
                        var horaIni = parseInt(aux.HoraInicio.substring(0,2));
                        var horaFn = parseInt(aux.HoraFin.substring(0,2));
                        if(i > horaIni && i <= horaFn)
                        {
                            //console.log('no agrego');
                            bAgrego = false;
                            return;
                        }	

                    });

                    if(bAgrego)
                    {
                        var sDesc = i + ':00 hs.';
                        //console.log('agregooooo');
                        self.horasH.push({id: i, desc: sDesc});
                        
                        //console.log('se agregaron--> ' + self.horasH.length);
                        self.selectedHoraHId = self.horasH[0].id; 
                    }
                    else
                        return; //Ya tengo que salir del for principal acá...
                }
                
            }
            else
            {
                //for de 23 a 24
                for(i=horaSeleccionada+1; i<=horaCierra; i++)
                {
                    var sDesc = i + ':00 hs.';
                    self.horasH.push({id: i, desc: sDesc});
                    self.selectedHoraHId = self.horasH[0].id; 
                    
                }
            }
                
        
            self.calcularPrecioReservar();
                     
        });
        
        
    };
   
    
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
        showWeeks: true,
        showButtonPanel: false
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
        function pad(n) {return n < 10 ? "0"+n : n;}
        $scope.fechaElegida = dt;
        
        var hoy = new Date();
        hoy = pad(hoy.getFullYear()+"-"+pad(hoy.getMonth()+1)+"-"+hoy.getDate());
        
        var fechaSelect = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
        
        
        console.log('hoy-> ' + hoy);
        console.log('eleccion-> ' + fechaSelect);
        
        var horaActual = -1;
        if(hoy == fechaSelect) //Si quiero reservar HOY. y son las 5, no voy a poder reservar a las 3 o a las 4...
        {
            var HoyHora = new Date();
            horaActual = HoyHora.getHours();
            console.log('horaActual------> ' + horaActual);
        }
            
        /*--------------------------------------------------------------------------------*/
        
        
        
        self.getHorasDisponiblesByFecha(fechaSelect/*, horaActual*/);
        
    };
    
    
    
    this.changeSelectedHoraD = function(selectedHoraDId)
    {
        var dia = $scope.fechaElegida.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
        var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
        var horaHastaDia = -1; //Hora que cierra para el día seleccionado.
        
        if(dia == 0)
            dia = 7;
        
        var HoraAbre = -1;
        var HoraCierra = -1;
        angular.forEach(self.diasComplejo, function(aux) {
            if(parseInt(aux.iddia) == dia)
            {
                HoraAbre = parseInt(aux.HoraDesde.substring(0,2));
                HoraCierra = parseInt(aux.HoraHasta.substring(0,2));
                if(HoraCierra == 0)
                    HoraCierra = 24;
                
                return;
            }
        });
        
        //console.log(selectedHoraDId); 
        /*-----------------------------------------------------------------------------*/
        
        function pad(n) {return n < 10 ? "0"+n : n;}
        
        var fechaSelect = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
        
        if(self.horasD.length > 0)
            self.getHorariosReservasByDia(fechaSelect, selectedHoraDId, HoraCierra);
        
        self.calcularPrecioReservar();
        
    };
    
    
    
    
    this.changeSelectedHoraH = function(selectedHoraHId)
    {
        self.calcularPrecioReservar();
        
    };
    
    
    this.validarFechaYHora = function()
    {   
        var fecha = document.getElementById("fecha").value;
        if(fecha == "" || fecha == null || fecha == undefined)
            return false;
        
        /*var hdes = self.horaDesde;
        if(hdes == "" || hdes == null || hdes == undefined)
            return false;
        
        var hhas = self.horaDesde2; 
        if(hhas == "" || hhas == null || hhas == undefined)
            return false;*/
        
        if(self.selectedHoraDId == null || self.selectedHoraHId == null)
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
            ////////NUEVO////////////////////////////////////////////////////
            //Traigo las hora desde y hasta.
            var hd = parseInt(self.selectedHoraDId);
            var hh = parseInt(self.selectedHoraHId);
            
            if(self.selectedHoraDId == '00')
                hd = 0;
            else if(self.selectedHoraDId == '01')
                hd = 1;
            
            if(self.selectedHoraHId == '00')
                hh = 0;
            else if(self.selectedHoraHId == '01')
                hh = 1;
            
            //console.log('hd->' + hd);
            //console.log('hh->' + hh);
            
            if(hh == 0)
                hh = 24;
            else if(hh == 1)
                hh = 25;
            
           
            
            //Calculo cuantas horas se van a alquilar...
            var horasAlq = hh - hd;
           // console.log('horas alq--> ' + horasAlq);
            var precio = parseFloat($scope.cancha[0].Precio);
            var horaLuz = -1;
            if($scope.cancha[0].HoraCobroLuz != undefined && $scope.cancha[0].HoraCobroLuz != null)
                horaLuz = $scope.cancha[0].HoraCobroLuz.substring(0,2);
            //console.log('luz desde-->' + horaLuz);
            var porcentajeLuz = 0;
            if($scope.cancha[0].PorcentajeLuz != null && $scope.cancha[0].PorcentajeLuz != undefined);
                porcentajeLuz = parseFloat($scope.cancha[0].PorcentajeLuz);
                    
           // console.log('porcent luz-->' + porcentajeLuz);
            
            var horasConLuz = 0;
            if($scope.cancha[0].Luz == 1 && horaLuz != -1)
            {
                for (i=0; i<horasAlq; i++)
                {
                    var num =  parseInt(hd + i);
                    //console.log(num);
                    if(num >= horaLuz)
                        horasConLuz++;
                }   
            }
            
            var precioAMostrar = 0;
            if(horasConLuz == 0)
                precioAMostrar = precio * horasAlq;
            else if(horasConLuz == horasAlq){
                precioAMostrar = (precio * horasAlq) + ((precio * horasAlq) * porcentajeLuz / 100);
                //console.log('precio*horasalq->' + precio * horasAlq);
                //console.log('*' + porcentajeLuz);
            }
            else //Si una parte se cobra con luz y otra no...
                {
                    //console.log('porcentajeluz--> ' + porcentajeLuz);
                    var precioCLuz = (precio * horasConLuz) + ((precio * horasConLuz) * porcentajeLuz / 100);
                    var precioSLuz = (horasAlq - horasConLuz) * precio;
                    
                    precioAMostrar = precioCLuz + precioSLuz;
                }
            
            //console.log('precioamostrar-> ' + precioAMostrar);
            
            if (document.getElementById('rbPagaCanchaCompleta').checked)
            {
                $scope.precioAPagar = precioAMostrar;
                $scope.restante = 0;
            }
            else if(document.getElementById('rbPagaSeña').checked)
            {
                var PorcentSenia = 0;
                //console.log('porcentttttt ' + $scope.cancha[0].PorcentSenia);
                if($scope.cancha[0].PorcentSenia != undefined && $scope.cancha[0].PorcentSenia != null)
                    PorcentSenia = parseFloat($scope.cancha[0].PorcentSenia);
                
                if(PorcentSenia > 0)
                    {
                        $scope.precioAPagar = parseFloat(precioAMostrar * PorcentSenia) / 100 ;
                        $scope.restante = parseFloat(precioAMostrar - $scope.precioAPagar);
                    }
                else
                    {
                        $scope.precioAPagar = 0;
                        $scope.restante = parseFloat(precioAMostrar);
                    }
            }
            
            
            self.paso1Completo = true;
            console.log('PASO 1 COMPLETO->' + self.paso1Completo);
            
        }
        else
        {
            
            self.paso1Completo = false;
            console.log('PASO 1 COMPLETO->' + self.paso1Completo);
            
        }
            
        
    };
    


    
[]});
