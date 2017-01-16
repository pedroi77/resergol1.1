var resergolApp = angular.module("resergolApp");

resergolApp.controller("DevolucionesController", function($scope, $state, $uibModal,  $uibModalStack, DevolucionesServices){
    


    var self = this;
    this.idComplejo = sessionStorage.idComplejo;
    this.desde = '19000101';
    this.hasta = '20200101';
    this.tipo =0;
    this.reserva=true;
    this.torneo=true;
    
    this.devoluciones = [];
    


    

    this.getDevoluciones = function(){
        
        DevolucionesServices.query({idComplejo: self.idComplejo, desde: self.desde, hasta: self.hasta, tipo:self.tipo }).$promise.then(function(data){ //, aux:0

            self.devoluciones = data;
            
        });
    };  
    
    this.buscar = function(){
        if(self.reserva == true && self.torneo == true){
            self.tipo = 0;
        };
        
        if(self.reserva == true && self.torneo == false){
            self.tipo = 1;
        };
        
        if(self.reserva == false && self.torneo == true){
            self.tipo = 2;
        };
        
        if(self.reserva == false && self.torneo == false){
            self.tipo = 3;
        };
        
       
        
        self.desde = addZero(this.FecInscDesde.getFullYear()) + addZero(this.FecInscDesde.getMonth()+1) + addZero(this.FecInscDesde.getDate())    ;
        self.hasta =   addZero(this.FecInscHasta.getFullYear()) +  addZero(this.FecInscHasta.getMonth()+1) + addZero(this.FecInscHasta.getDate()) ;
        
        console.log( self.desde);
        console.log( self.hasta);
        
        self.getDevoluciones();
    };

     $scope.today = function() {
        $scope.dt = new Date();
      };
    
      $scope.today();

      $scope.clear = function() {
        $scope.dt = null;
      };

    function addZero(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    };
    
    this.FecInscDesde = new Date(2016,5,1);
    this.FecInscHasta = new Date();
    
   
    
    $scope.dateOptionsInscDesde = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2020, 1, 1),
        minDate: new Date(2016,5,1),
        startingDay: 1
      };
    
      $scope.dateOptionsInscHasta = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2020, 1, 1),
        minDate: new Date(2016,5,1),
        startingDay: 1
      };
    
     function disabled(data) {
        var date = data.date,
          mode = data.mode;
        //return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
        return mode === 'day' && (false);
      }
    

      $scope.toggleMin = function() {
        $scope.dateOptionsInscDesde.minDate = new Date();
      };

       $scope.FecInscripcionDesde = {
        opened: false
      };

      $scope.FecInscripcionHasta = {
        opened: false
      };

      $scope.OpenFecInscDesde = function() {
        $scope.FecInscripcionDesde.opened = true;
      };

      $scope.OpenFecInscHasta = function() {
        $scope.FecInscripcionHasta.opened = true;
      };
    
     this.validaFecInscDesde= function(){
        if (self.FecInscDesde == undefined){
            self.FecInscDesde = "";
        }
    };
    
    this.validaFecInscHasta= function(){
        if (self.FecInscHasta == undefined){
            self.FecInscHasta = "";
        }
    };
        
     
    
    this.init = function(){
        self.getDevoluciones();
    };

    self.init();
    
});