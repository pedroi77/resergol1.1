var resergolApp = angular.module("resergolApp");

resergolApp.controller("BuscarCanchasController", function($scope, $state, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService){

var self = this;
this.tiposDoc = [];
this.provincias = [];   
this.localidades = [];
this.superficies = [];
this.seBusco = false;
    
this.cantJugadores = [
          { id: -1, desc: '-Todos-'},
          { id: 5, desc: '5 vs 5' },
          { id: 6, desc: '6 vs 6' },
          { id: 7, desc: '7 vs 7' },
          { id: 8, desc: '8 vs 8' },
          { id: 9, desc: '9 vs 9' },
          { id: 10, desc: '10 vs 10' },
          { id: 11, desc: '11 vs 11' }
      ];
    
$scope.selectedCantJugadoresId = -1;    
$scope.canchas = []; 
    
$scope.canchasPaginadas = [];     
$scope.totalItems = 0;
$scope.itemsPerPage = 8;
//$scope.currentPage = 1;
    
$scope.pagination = {
    currentPage:  1
};
    
$scope.filtros = {
    IdProvincia : -1,
    IdLocalidad : -1,
    CantJugadores : '',
    TipoSuperficie : -1,
    Fecha : '',
    Hora : '',
    PrecioMaximo : -1,
    Techada : null,
    Luz : null,
    Estacionamiento : null,
    Duchas : null,
    Buffet : null,
    Parrilla : null,
    Wifi : null
};    
    

    
 /*this.cancha = { 
                    idCancha: -1,
                    idComplejo: -1,
                    nombreCancha: '',
                    nombreComplejo: '',
                    provincia: -1,
                    localidad: -1,
                    cantJugadores: '',
                    Techada: '',
                    Luz: '',
                    Precio: ''
                  }; */



self.provincias = {
        prov: [],
        //selectedOption:{IdProvincia: '-1', Nombre: '-Provincia-'} 
        selectedOption : {IdProvincia: '1', Nombre: 'Buenos Aires'} 
    }; 
     
self.localidades = {
    loc: [],
    selectedOption:{IdLocalidad: '-1', Nombre: '-Localidad-'} 
};
    
self.superficies = {
    sup: [],
    selectedOption:{IdSuperficie: '-1', Descripcion: '-Todas-'} 
};
    
self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
    
ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        self.provincias.prov.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Provincia-'});
        self.getLocalidades();
    }); 

   
this.getLocalidades = function(){
        var idProv = self.provincias.selectedOption.IdProvincia;
        if(idProv != -1 && idProv != undefined){
            LocalidadesService.query({id:idProv}).$promise.then(function(data) {
                self.localidades.loc = data;
                var idSel =  self.localidades.loc[0].IdLocalidad;
                var nomSel = self.localidades.loc[0].Nombre;
                self.localidades.selectedOption = {IdLocalidad: idSel, Nombre:nomSel}; 
            });
        }
        else{
            self.localidades.loc = [];
            self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
            self.localidades.selectedOption = {IdLocalidad: '-1', Nombre:'-Localidad-'}; 
        };
        
    };    
    
    
TiposSuperficiesService.query().$promise.then(function(data) {
        self.superficies.sup = data;
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        self.superficies.sup.splice(0, 0, {IdSuperficie: '-1', Descripcion: '-Todas-'});
    });
    


    this.limpiarFiltros = function(){
      
        self.provincias.selectedOption.IdProvincia = 1;
        self.getLocalidades();
        //LIMPIAR HORA!.    
        $scope.today();    
        self.superficies.selectedOption.IdSuperficie = -1;    
        $scope.selectedCantJugadoresId = -1;     
        document.getElementById("precioMaximo").value = null;    
        document.getElementById("techada").checked = false;
        document.getElementById("conLuz").checked = false;
        document.getElementById("conEstac").checked = false;
        document.getElementById("conDuchas").checked = false;
        document.getElementById("conBuffet").checked = false;
        document.getElementById("conParrilla").checked = false;
        document.getElementById("conWifi").checked = false;
        
    };
/***************************CANCHAS************************************************************/
    this.getCanchas = function(){
        
            self.getFiltros();
            self.seBusco = true;    
        
			CanchasService.query({pIdProv:$scope.filtros.IdProvincia, pIdLoc:$scope.filtros.IdLocalidad, pCantJug:$scope.filtros.CantJugadores, pIdSuperficie:$scope.filtros.TipoSuperficie, pPrecioMax:$scope.filtros.PrecioMaximo, pTechada:$scope.filtros.Techada, pConLuz:$scope.filtros.Luz, pConEstac:$scope.filtros.Estacionamiento, pConDuchas:$scope.filtros.Duchas, pConBuffet:$scope.filtros.Buffet, pConParrilla:$scope.filtros.Parrilla, pConWifi:$scope.filtros.Wifi}).$promise.then(function(data){
				
                    $scope.canchas = data;
                    $scope.totalItems = $scope.canchas.length;
                    $scope.pagination.currentPage = 1;

                    $scope.numPages = function () {
                        return Math.ceil($scope.canchas.length / $scope.itemsPerPage);
                    };
    
                    $scope.$watch('currentPage + numPerPage', function() {
                        var begin = (($scope.pagination.currentPage - 1) * $scope.itemsPerPage)
                            , end = begin + $scope.itemsPerPage;

                        $scope.canchasPaginadas = $scope.canchas.slice(begin, end);
                        console.log($scope.canchasPaginadas);

                    });
                
                
            });	
        
        
	};
    
  
this.getFiltros = function(){
   
    $scope.filtros.IdProvincia = self.provincias.selectedOption.IdProvincia;
    $scope.filtros.IdLocalidad = self.localidades.selectedOption.IdLocalidad;
    $scope.filtros.CantJugadores = $scope.selectedCantJugadoresId;
    $scope.filtros.TipoSuperficie = self.superficies.selectedOption.IdSuperficie;
    
    $scope.filtros.PrecioMaximo = document.getElementById("precioMaximo").value == "" ? -1 : document.getElementById("precioMaximo").value ;
    
    $scope.filtros.Techada = document.getElementById("techada").checked ? 1 : 0;
    $scope.filtros.Luz = document.getElementById("conLuz").checked ? 1 : 0;
    $scope.filtros.Estacionamiento = document.getElementById("conEstac").checked ? 1 : 0;
    $scope.filtros.Duchas = document.getElementById("conDuchas").checked ? 1 : 0;
    $scope.filtros.Buffet = document.getElementById("conBuffet").checked ? 1 : 0;
    $scope.filtros.Parrilla = document.getElementById("conParrilla").checked ? 1 : 0;
    $scope.filtros.Wifi = document.getElementById("conWifi").checked ? 1 : 0;
    
    
    /*alert('prov ->' + $scope.filtros.IdProvincia + '\n' +
          'loc ->' + $scope.filtros.IdLocalidad + '\n' +
          'jug ->' + $scope.filtros.CantJugadores + '\n' +
          'sup ->' + $scope.filtros.TipoSuperficie + '\n' +
          'p max ->' + $scope.filtros.PrecioMaximo + '\n' + 
          'techada ->' + $scope.filtros.Techada + '\n' + 
          'luz ->' + $scope.filtros.Luz + '\n' +
          'est ->' + $scope.filtros.Estacionamiento + '\n' +
          'duchas ->' + $scope.filtros.Duchas + '\n' +
          'buffet ->' + $scope.filtros.Buffet + '\n' +
          'parrilla ->' + $scope.filtros.Parrilla + '\n' +
          'wifi ->' + $scope.filtros.Wifi
         );*/
    
    
};    
    
  
$scope.pageChanged = function(currentPage)
{
    
    $scope.$watch('currentPage + numPerPage', function() {
            var begin = ((currentPage - 1) * $scope.itemsPerPage)
                , end = begin + $scope.itemsPerPage;
            
          $scope.canchasPaginadas = $scope.canchas.slice(begin, end);
          console.log($scope.canchasPaginadas);
                
    });
}
/*********************************************************************************************/

    
    
    
    
    
    
    
    
    /*INICIO FECHAS*/
    /*PARA FECHAS*/

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
    /*FIN FECHAS*/
    
    
   /* this.init = function(){
        //LEER sacar el 2 HARCODE
        TipoTorneosService.query({idTorneo:-1}).$promise.then(function(data) {
            self.tiposTorneos.tipos = data;
            self.tiposTorneos.selectedOption = self.tiposTorneos.tipos[0];
        }); 
    
        DueniosSuperficiesService.query({idDuenio:2}).$promise.then(function(data) {
            self.superficies.tipos = data;
            self.superficies.selectedOption = self.superficies.tipos[0];
        }); 
        
        DueniosJugadoresService.query({idDuenio:2}).$promise.then(function(data) {
            self.cantJugadores.tipos = data;
            self.cantJugadores.selectedOption = self.cantJugadores.tipos[0];
        }); 
        
    };
    
    self.init();*/
[]});