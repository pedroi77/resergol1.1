var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoNuevoController", function($scope, $state, TipoTorneosService, DueniosSuperficiesService, DueniosJugadoresService,DuenioDiasService, CanchasService){

    var self = this;
    this.tiposTorneos =[];
    this.superficies =[];
    
    this.tiposTorneos = {
        tipos: [],
        selectedOption: {IdTipoTorneo: '1', Nombre: ''} 
    };    
    
    this.superficies = {
        tipos: [],
        selectedOption: {IdSuperficie: '1', Descripcion: ''} 
    };    
    
    this.cantJugadores = {
        tipos: [],
        selectedOption: {CantJugadores: '1'} 
    };   
    
    this.diasDesde = {
        tipos: [],
        selectedOption: {iddia: '1',nombre:'', HoraDesde:'', HoraHasta:'', juega:0} 
    };    
    
    this.canchas = {
        tipos: []
    };  
    
   
   
    this.init = function(){
        //LEER sacar el 1 HARCODE
        TipoTorneosService.query({idTorneo:-1}).$promise.then(function(data) {
            self.tiposTorneos.tipos = data;
            self.tiposTorneos.selectedOption = self.tiposTorneos.tipos[0];
        }); 
    
        DueniosSuperficiesService.query({idDuenio:1}).$promise.then(function(data) {
            self.superficies.tipos = data;
            self.superficies.selectedOption = self.superficies.tipos[0];
        }); 
        
        DueniosJugadoresService.query({idDuenio:1}).$promise.then(function(data) {
            self.cantJugadores.tipos = data;
            self.cantJugadores.selectedOption = self.cantJugadores.tipos[0];
        }); 
        
        
        DuenioDiasService.query({idDuenio:1}).$promise.then(function(data) {
            self.diasDesde.tipos = data;
            var i;
            for(i=0; i<self.diasDesde.tipos.length; i++){
                self.diasDesde.tipos[i]['HoraDesde'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['HoraDesde'].substring(0,2)), 00, 0);
                self.diasDesde.tipos[i]['HoraHasta'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['HoraHasta'].substring(0,2)), 00, 0);
                self.diasDesde.tipos[i]['juega'] = '1';
                self.diasDesde.tipos[i]['siNo'] = 'SI';
                self.diasDesde.tipos[i]['desdeMin'] =  self.diasDesde.tipos[i]['HoraDesde'].getHours().toString() + ':0' +
                                                       self.diasDesde.tipos[i]['HoraDesde'].getMinutes().toString();
                
                self.diasDesde.tipos[i]['hastaMax'] =  self.diasDesde.tipos[i]['HoraHasta'].getHours().toString() + ':0' +
                                                       self.diasDesde.tipos[i]['HoraHasta'].getMinutes().toString();
            };
        }); 
        
        CanchasService.query({idDuenio:1}).$promise.then(function(data) {
            self.canchas.tipos = data;
            var i;
            for(i=0; i<self.canchas.tipos.length; i++){
                if(self.canchas.tipos[i]['techada'] == 1) 
                    self.canchas.tipos[i]['techo'] = 'SI';
                else    
                    self.canchas.tipos[i]['techo'] = 'NO';
                
                 if(self.canchas.tipos[i]['luz'] == 1) 
                    self.canchas.tipos[i]['conLuz'] = 'SI';
                else 
                    self.canchas.tipos[i]['conLuz'] = 'NO';
                
                self.canchas.tipos[i]['juegaCancha'] = '1';
                self.canchas.tipos[i]['siNo'] = 'SI';
            };
        }); 
       
    
        $scope.toggleMin();
        
    };
    
    this.juegaSiNo = function(indice, valor){
        self.diasDesde.tipos[indice]["juega"]=valor;
        if(valor==1){
            self.diasDesde.tipos[indice]["siNo"]='SI';
        }
        else{
            self.diasDesde.tipos[indice]["siNo"]='NO';
        };
    };
    
    this.juegaCanchaSiNo = function(indice, valor){
        self.canchas.tipos[indice]["juegaCancha"]=valor;
        if(valor==1){
            self.canchas.tipos[indice]["siNo"]='SI';
        }
        else{
            self.canchas.tipos[indice]["siNo"]='NO';
        };
    };
    
  
    
    this.fecha= function(){
        console.log(self.FecInscDesde);
        console.log($scope.dateOptionsInscHasta.minDate);
        
        console.log($scope.dateOptionsInscHasta.minDate);
    };
    
    this.setearDesdeInsc= function(){
        self.FecInscHasta = self.FecInscDesde;
        $scope.dateOptionsInscHasta.minDate= self.FecInscDesde;
    };
    
    /*****************************PARA FECHAS*********************************/
     $scope.today = function() {
        $scope.dt = new Date();
      };
    
      $scope.today();

      $scope.clear = function() {
        $scope.dt = null;
      };

     
      this.FecInscDesde = new Date();
      this.FecInscHasta = new Date();
      this.TorneoDesde = new Date();
      this.TorneoHasta = new Date();
    
      this.setearDesdeInsc= function(){
        self.FecInscHasta = self.FecInscDesde;
        $scope.dateOptionsInscHasta.minDate= self.FecInscDesde;
        self.setearTorneoDesde();  
      };
    
     this.setearTorneoDesde= function(){
        self.TorneoDesde = self.FecInscHasta;
        self.TorneoHasta = self.FecInscHasta;
        $scope.dateOptionsTorneoDesde.minDate= self.TorneoDesde;
        $scope.dateOptionsTorneoHasta.minDate= self.TorneoHasta;
      };
 
     this.setearTorneoHasta = function(){
        self.TorneoHasta = self.TorneoDesde;
        $scope.dateOptionsTorneoHasta.minDate= self.TorneoHasta;
     };
    
      $scope.dateOptionsInscDesde = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.dateOptionsInscHasta = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
      $scope.dateOptionsTorneoDesde = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.dateOptionsTorneoHasta = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };


        //Deshabilita x eje el dom 0 o el sab 6
      function disabled(data) {
        var date = data.date,
          mode = data.mode;
        return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
      }

      $scope.toggleMin = function() {
        $scope.dateOptionsInscDesde.minDate = new Date();
      };

      

      $scope.OpenFecInscDesde = function() {
        $scope.FecInscripcionDesde.opened = true;
      };

      $scope.OpenFecInscHasta = function() {
        $scope.FecInscripcionHasta.opened = true;
      };
        
      $scope.OpenFecDesde = function() {
        $scope.FecDesde.opened = true;
      };

      $scope.OpenFecHasta = function() {
        $scope.FecHasta.opened = true;
      };
    
     
      $scope.setDate = function(year, month, day) {
        $scope.dt = new Date(year, month, day);
      };

      $scope.formats = ['dd/MM/yyyy', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
      $scope.format = $scope.formats[0];
      $scope.altInputFormats = ['M!/d!/yyyy'];

      $scope.FecInscripcionDesde = {
        opened: false
      };

      $scope.FecInscripcionHasta = {
        opened: false
      };
    
     $scope.FecDesde = {
        opened: false
      };

      $scope.FecHasta = {
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


    self.init();
    
});