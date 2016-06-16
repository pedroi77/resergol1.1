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
    
    
    this.getHorasDisponiblesByFecha = function(fecha){
			ReservasService.query({idCancha:$scope.idCancha, idComplejo:$scope.idComplejo, fecha:fecha}).$promise.then(function(data){
                    $scope.HorasDisponibles = data;
                    
                this.selectedHoraDId = "1";
        
        
        
                var dia = dt.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
                var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
                var horaHastaDia = -1; //Hora que cierra para el día seleccionado.

                if(dia == 0)
                    dia = 7;
                angular.forEach(self.diasComplejo, function(aux) {
                    if(parseInt(aux.iddia) == dia)
                    {
                        //TODO NUEVO - Hora desde
                        self.horasD = [];
                        //Hora desde y hasta que abre el complejo para el dia seleccionado.
                        var hDd = parseInt(aux.HoraDesde.substring(0,2));
                        var hDh = parseInt(aux.HoraHasta.substring(0,2));

                        if(hDh == 0) //Si cierra a las 12, lo tomo como 24 para el for.
                            hDh = 24;


                        for(i=hDd;i<hDh;i++)
                        {
                          var sId = i.toString();    
                          var sDesc = sId + ':00 hs.'; 
                          if(sId == '24')
                          {
                              sID = '00';
                              sDesc = '00:00 hs.'
                          }
                        
                          self.horasD.push({id: sId, desc: sDesc});  

                        }


                        //TODO NUEVO - Hora hasta
                        self.horasH = [];
                        //Hora desde y hasta que abre el complejo para el dia seleccionado.
                        var hHd = parseInt(aux.HoraDesde.substring(0,2));
                        var hHh = parseInt(aux.HoraHasta.substring(0,2));

                        if(hHh == 0) //Si cierra a las 12, lo tomo como 25 para el for.
                            hHh = 24;

                        for(i=hHd+1;i<=hHh;i++)
                        {
                          var sId = i.toString();
                          var sDesc = sId + ':00 hs.'; 
                          if(sId == '24')
                          {
                              sId = '24';
                              sDesc = '24:00 hs.'
                          }
                          if(sId == '25')
                          {
                              sId = '01';
                              sDesc = '01:00 hs.'
                          }    

                          self.horasH.push({id: sId, desc: sDesc});  

                        }


                        self.selectedHoraDId = self.horasD[0].id;
                        self.selectedHoraHId = self.horasH[0].id;

                    }
                });
                
                
                
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
        $scope.fechaElegida = dt;
        function pad(n) {return n < 10 ? "0"+n : n;}
        
        var fechaSelect = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
        
        self.getHorasDisponiblesByFecha(dt);
        
        
        /*this.selectedHoraDId = "1";
        
        
        
        var dia = dt.getDay(); //LUNES, MARTES, MIERCOLES, ETC. (para saber a que hora abre).
        var horaDesdeDia = -1; //Hora que abre para el día seleccionado.
        var horaHastaDia = -1; //Hora que cierra para el día seleccionado.

        if(dia == 0)
            dia = 7;
        angular.forEach(self.diasComplejo, function(aux) {
        if(parseInt(aux.iddia) == dia)
        {
            //TODO NUEVO - Hora desde
            self.horasD = [];
            //Hora desde y hasta que abre el complejo para el dia seleccionado.
            var hDd = parseInt(aux.HoraDesde.substring(0,2));
            var hDh = parseInt(aux.HoraHasta.substring(0,2));
            
            if(hDh == 0) //Si cierra a las 12, lo tomo como 24 para el for.
                hDh = 24;
            
            
            for(i=hDd;i<hDh;i++)
            {
              var sId = i.toString();    
              var sDesc = sId + ':00 hs.'; 
              if(sId == '24')
              {
                  sID = '00';
                  sDesc = '00:00 hs.'
              }
                
              self.horasD.push({id: sId, desc: sDesc});  
                
            }
            
            
            //TODO NUEVO - Hora hasta
            self.horasH = [];
            //Hora desde y hasta que abre el complejo para el dia seleccionado.
            var hHd = parseInt(aux.HoraDesde.substring(0,2));
            var hHh = parseInt(aux.HoraHasta.substring(0,2));
            
            if(hHh == 0) //Si cierra a las 12, lo tomo como 25 para el for.
                hHh = 24;
            
            for(i=hHd+1;i<=hHh;i++)
            {
              var sId = i.toString();
              var sDesc = sId + ':00 hs.'; 
              if(sId == '24')
              {
                  sId = '24';
                  sDesc = '24:00 hs.'
              }
              if(sId == '25')
              {
                  sId = '01';
                  sDesc = '01:00 hs.'
              }    
                
              self.horasH.push({id: sId, desc: sDesc});  
                
            }
            
            
            self.selectedHoraDId = self.horasD[0].id;
            self.selectedHoraHId = self.horasH[0].id;

        }
        });*/
        
        
        
        
        self.calcularPrecioReservar();
        
    };
    
    
    
    this.changeSelectedHoraD = function(selectedHoraDId)
    {
        var horaCierre = self.horasH[self.horasH.length - 1].id;
        //console.log('cierra a las... ' + horaCierre);
        
        //El combo de hora hasta, se va a cargar desde una hora mas que la hora elegida para jugar,
        //hasta que cierra el complejo.
        var horaHD =  parseInt(self.selectedHoraDId);
        self.horasH = [];
        for(i=horaHD+1; i<=horaCierre; i++)
        {
            
            var sId = i.toString();
            var sDesc = sId + ':00 hs.'; 
              if(sId == '24')
              {
                  sId = '24';
                  sDesc = '24:00 hs.'
              }
              if(sId == '25')
              {
                  sId = '01';
                  sDesc = '01:00 hs.'
              }  
            
            self.horasH.push({id: sId, desc: sDesc}); 
        }
        
        self.selectedHoraHId = (horaHD + 1).toString();

        //**********//**********//**********//**********//**********//**********//**********//**********
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
            //console.log('paso1->' + self.paso1Completo);
            
        }
        else
        {
            
            self.paso1Completo = false;
            
        }
            
        
    };
    


    
[]});
