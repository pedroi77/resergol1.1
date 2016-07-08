var resergolApp = angular.module("resergolApp");

resergolApp.controller("BuscarComplejosController", function($scope, $state, ProvinciasService, LocalidadesService, ComplejosService, TiposSuperficiesService ){

var self = this;
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
    
this.horas = [
          { id: -1, desc: '-Todas-'},
          { id: 8, desc: '08:00 hs.'},
          { id: 9, desc: '09:00 hs.'},
          { id: 10, desc: '10:00 hs.' },
          { id: 11, desc: '11:00 hs.' },
          { id: 12, desc: '12:00 hs.' },
          { id: 13, desc: '13:00 hs.' },
          { id: 14, desc: '14:00 hs.' },
          { id: 15, desc: '15:00 hs.' },
          { id: 16, desc: '16:00 hs.' },
          { id: 17, desc: '17:00 hs.' },
          { id: 18, desc: '18:00 hs.' },
          { id: 19, desc: '19:00 hs.' },
          { id: 20, desc: '20:00 hs.' },
          { id: 21, desc: '21:00 hs.' },
          { id: 22, desc: '22:00 hs.' },
          { id: 23, desc: '23:00 hs.' }
      ];    
   
$scope.diaSemana = -1;
$scope.selectedCantJugadoresId = -1;
$scope.selectedHoraId = -1;
$scope.complejos = []; 
$scope.complejosTOP = [];
$scope.puntajeComplejo = 0;
    
$scope.complejosPaginados = [];     
$scope.totalItems = 0;
$scope.itemsPerPage = 8;
//$scope.currentPage = 1;
    
$scope.pagination = {
    currentPage:  1
};
    
$scope.filtros = {
    NombreComplejo : "",
    IdProvincia : -1,
    IdLocalidad : -1,
    CantJugadores : '',
    TipoSuperficie : -1,
    Fecha : '1900-01-01',
    Hora : -1,
    PrecioMaximo : -1,
    Techada : null,
    Luz : null,
    Estacionamiento : null,
    Duchas : null,
    Buffet : null,
    Parrilla : null,
    Wifi : null 
};    
    
self.provincias = {
        prov: [],
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
        self.superficies.sup.splice(0, 0, {IdSuperficie: '-1', Descripcion: '-Todas-'});
    });
    
    
    this.limpiarFiltros = function(){
        document.getElementById("nombreComplejo").value = '';
        self.provincias.selectedOption.IdProvincia = 1;
        self.getLocalidades();
        $scope.dt = null;
        $scope.diaSemana = -1;
        self.superficies.selectedOption.IdSuperficie = -1;    
        $scope.selectedCantJugadoresId = -1; 
        $scope.selectedHoraId = -1;     
        document.getElementById("precioMaximo").value = null;    
        document.getElementById("techada").checked = false;
        document.getElementById("conLuz").checked = false;
        document.getElementById("conEstac").checked = false;
        document.getElementById("conDuchas").checked = false;
        document.getElementById("conBuffet").checked = false;
        document.getElementById("conParrilla").checked = false;
        document.getElementById("conWifi").checked = false;
        
    };
/***************************COMPLEJOS************************************************************/
    this.getComplejos = function(){
            self.getFiltros();
              
ComplejosService.query({pNombreComplejo: $scope.filtros.NombreComplejo, pIdProv:$scope.filtros.IdProvincia, pIdLoc:$scope.filtros.IdLocalidad, pCantJug:$scope.filtros.CantJugadores, pIdSuperficie:$scope.filtros.TipoSuperficie, pPrecioMax:$scope.filtros.PrecioMaximo, pTechada:$scope.filtros.Techada, pConLuz:$scope.filtros.Luz,pConEstac:$scope.filtros.Estacionamiento, pConDuchas:$scope.filtros.Duchas, pConBuffet:$scope.filtros.Buffet, pConParrilla:$scope.filtros.Parrilla, pConWifi:$scope.filtros.Wifi, pFecha:$scope.filtros.Fecha, pHora:$scope.filtros.Hora, pDiaSemana:$scope.filtros.DiaSemana }).$promise.then(function(data){
				
                    $scope.complejos = data;
                    self.seBusco = true;  
                     angular.forEach(data, function(aux) {
                      
                        if(aux.Puntaje == 0){
                            aux.PuntajeDesc = 'Sin votos.';
                            aux.PuntajeClass = "btn-xs btn-default";
                            }
                        else
                        if(aux.Puntaje > 0 && aux.Puntaje <= 1){
                            aux.PuntajeDesc = 'Muy mala';
                            aux.PuntajeClass = "btn-xs btn-danger";
                            }
                         else
                            if(aux.Puntaje > 1 && aux.Puntaje <= 2){ 
                                aux.PuntajeDesc = 'No me gustan';
                                aux.PuntajeClass = "btn-xs btn-warning";
                            }
                            else
                                if(aux.Puntaje > 2 && aux.Puntaje <= 3){
                                    aux.PuntajeDesc = 'Mas o menos';
                                    aux.PuntajeClass = "btn-xs btn-info";
                                }
                                else
                                    if(aux.Puntaje > 3 && aux.Puntaje <= 4){
                                        aux.PuntajeDesc = 'Muy buena';
                                        aux.PuntajeClass = "btn-xs btn-primary";
                                    }
                                    else
                                        if(aux.Puntaje > 4 && aux.Puntaje <= 5){
                                            aux.PuntajeDesc = 'Una fantasía';
                                            aux.PuntajeClass = "btn-xs block btn-success";
                                        }
                            
                        if(aux.Imagen != null)
                        {
                            aux.Imagen = "data:image/jpg;base64," + aux.Imagen;
                        }

                    }); 
                
                    
                    $scope.totalItems = $scope.complejos.length;
                    $scope.pagination.currentPage = 1;

                    $scope.numPages = function () {
                        return Math.ceil($scope.complejos.length / $scope.itemsPerPage);
                    };
    
                    $scope.$watch('currentPage + numPerPage', function() {
                        var begin = (($scope.pagination.currentPage - 1) * $scope.itemsPerPage)
                            , end = begin + $scope.itemsPerPage;

                        $scope.complejosPaginados = $scope.complejos.slice(begin, end);

                    });
                
                
            });	
        
        
	};
    
  
this.getFiltros = function(){
   
    $scope.filtros.NombreComplejo = document.getElementById("nombreComplejo").value;
    if($scope.filtros.NombreComplejo == "" || $scope.filtros.NombreComplejo == null || $scope.filtros.NombreComplejo == undefined)
        $scope.filtros.NombreComplejo = -1;
    
    $scope.filtros.IdProvincia = self.provincias.selectedOption.IdProvincia;
    $scope.filtros.IdLocalidad = self.localidades.selectedOption.IdLocalidad;
    $scope.filtros.CantJugadores = $scope.selectedCantJugadoresId;
    $scope.filtros.TipoSuperficie = self.superficies.selectedOption.IdSuperficie;
    
    if($scope.dt == null)
    {
        $scope.filtros.Fecha = '19000101';
        $scope.filtros.DiaSemana = -1;
    }
    else
        {
            var anio = $scope.dt.getFullYear().toString();
            var mes = ($scope.dt.getMonth() + 1).toString();
            var dia = $scope.dt.getDate().toString();
            
            if(mes.length == 1)
                mes = '0'+ mes;
            if(dia.length == 1)
                dia = '0'+ dia;
            
            $scope.filtros.Fecha = anio + mes + dia;
            //1-Lunes 2-Martes etc...
            if($scope.dt.getUTCDay() == 0)
                $scope.filtros.DiaSemana = 7; //Domingo lo toma como 0, pero para nosotros va a ser 7.
            else
                $scope.filtros.DiaSemana = $scope.dt.getUTCDay();
            console.log('diaSemana ->' + $scope.filtros.DiaSemana);
        }
        
    console.log('fecha -> ' + $scope.filtros.Fecha);
    
    if($scope.selectedHoraId == -1)
    { 
        $scope.filtros.Hora = -1
        $scope.filtros.HoraCompleta = -1; //HoraCompleta solo lo uso para ver si muestro el precio con luz o no.
    }
    else
        {   
            if($scope.selectedHoraId < 10){
                $scope.filtros.Hora = '0' + $scope.selectedHoraId;// + ':00:00';
                $scope.filtros.HoraCompleta = '0' + $scope.selectedHoraId + ':00:00';
            }
            else
            {
                $scope.filtros.Hora = $scope.selectedHoraId;// + ':00:00';    
                $scope.filtros.HoraCompleta = $scope.selectedHoraId + ':00:00';    
            }
        }
    
    console.log('hora -> ' + $scope.filtros.Hora);

    $scope.filtros.PrecioMaximo = document.getElementById("precioMaximo").value == "" ? -1 : document.getElementById("precioMaximo").value ;
    
    $scope.filtros.Techada = document.getElementById("techada").checked ? 1 : 0;
    $scope.filtros.Luz = document.getElementById("conLuz").checked ? 1 : 0;
    
    
    $scope.filtros.Estacionamiento = document.getElementById("conEstac").checked ? 1 : 0;
    $scope.filtros.Duchas = document.getElementById("conDuchas").checked ? 1 : 0;
    $scope.filtros.Buffet = document.getElementById("conBuffet").checked ? 1 : 0;
    $scope.filtros.Parrilla = document.getElementById("conParrilla").checked ? 1 : 0;
    $scope.filtros.Wifi = document.getElementById("conWifi").checked ? 1 : 0;

};    

    

this.getComplejosTOP = function(){
              
			ComplejosService.query().$promise.then(function(data){
                    console.log('DATA TAMANIO-> ' + data.length);
                    $scope.complejosTOP = data;
                     var activo = 0;
                     var contador = 0;
                     angular.forEach(data, function(aux) {
                        aux.contador = contador;
                        contador++;
                        if(activo == 0)
                        {
                                aux.Clase = "item carousel-item active";
                                activo = 1;
                        }
                         else
                             {
                                aux.Clase = "item carousel-item"; 
                             }
                             
                        if(aux.Puntaje == 0){
                            aux.PuntajeDesc = 'Sin votos.';
                            aux.PuntajeClass = "btn-xs btn-default";
                            }
                        else
                        if(aux.Puntaje > 0 && aux.Puntaje <= 1){
                            aux.PuntajeDesc = 'Muy mala';
                            aux.PuntajeClass = "btn-xs btn-danger";
                            }
                         else
                            if(aux.Puntaje > 1 && aux.Puntaje <= 2){ 
                                aux.PuntajeDesc = 'No me gustan';
                                aux.PuntajeClass = "btn-xs btn-warning";
                            }
                            else
                                if(aux.Puntaje > 2 && aux.Puntaje <= 3){
                                    aux.PuntajeDesc = 'Mas o menos';
                                    aux.PuntajeClass = "btn-xs btn-info";
                                }
                                else
                                    if(aux.Puntaje > 3 && aux.Puntaje <= 4){
                                        aux.PuntajeDesc = 'Muy buena';
                                        aux.PuntajeClass = "btn-xs btn-primary";
                                    }
                                    else
                                        if(aux.Puntaje > 4 && aux.Puntaje <= 5){
                                            aux.PuntajeDesc = 'Una fantasía';
                                            aux.PuntajeClass = "btn-xs block btn-success";
                                        }
                            
                        /*if(aux.Imagen != null)
                        {
                            aux.Imagen = "data:image/jpg;base64," + aux.Imagen;
                        }*/           
            });	
                
        });
	};    
    
    
self.getComplejosTOP();
  
$scope.pageChanged = function(currentPage)
{
    $scope.$watch('currentPage + numPerPage', function() {
            var begin = ((currentPage - 1) * $scope.itemsPerPage)
                , end = begin + $scope.itemsPerPage;
            
          $scope.complejosPaginados = $scope.complejos.slice(begin, end);
          console.log($scope.complejosPaginados);
    });
}
/*********************************************************************************************/


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