var resergolApp = angular.module("resergolApp");

resergolApp.controller("BuscarTorneosController", function($scope, $state, ProvinciasService, LocalidadesService, ComplejosService, TorneosClientesService, TipoTorneosService, TiposSuperficiesService, DueniosCantEquiposService){

var self = this;
this.tiposDoc = [];
this.provincias = [];   
this.localidades = [];
this.superficies = [];
this.tiposTorneos = [];
this.cantEquipos = [];
this.seBusco = false;
    
this.myInterval = 5000;
this.noWrapSlides = false;
this.active = 0;
    
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
    

$scope.diaSemana = -1;
$scope.selectedCantJugadoresId = -1;
$scope.selectedCantEquiposId = -1;
$scope.selectedHoraId = -1;
$scope.torneos = []; 
    
$scope.torneosPaginados = [];     
$scope.totalItems = 0;
$scope.itemsPerPage = 8;
//$scope.currentPage = 1;
    
$scope.pagination = {
    currentPage:  1
};
    
$scope.filtros = {
    NombreTorneo : "",
    IdProvincia : -1,
    IdLocalidad : -1,
    CantJugadores : '',
    TipoSuperficie : -1,
    iposTorneos : -1,
    CantEquipos : -1,
    Inscripcion : null,
    Activos : null,
    Finalizados : null,
    IdaYVuelta : null,
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
    
self.tiposTorneos = {
    tiposTorneos: [],
    selectedOption:{IdTipoTorneo: '-1', Nombre: '-Todos-'} 
};  
    
    
self.cantEquipos = {
    cantEquipos: [],
    selectedOption:{IdCantEquipo: '-1', cantidad: '-Todos-'} 
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
    
    
TipoTorneosService.query({idTorneo:-1}).$promise.then(function(data) {
        self.tiposTorneos.tiposTorneos = data;
        self.tiposTorneos.tiposTorneos.splice(0, 0, {IdTipoTorneo: '-1', Nombre: '-Todos-'});
    
        DueniosCantEquiposService.query({TipoTorneo:self.tiposTorneos.selectedOption.IdTipoTorneo}).$promise.then(function(data) {
            self.cantEquipos.cantEquipos = data;
            self.cantEquipos.cantEquipos.splice(0, 0, {IdCantEquipo: '-1', cantidad: '-Todos-'});
        });    
    }); 
    
    
//SE EJECUTARIA CADA VEZ QUE SE CAMBIA EL COMBO DE TIPO TORNEO...    
this.getCantEquipos = function(){
    console.log('entre a eq');
    DueniosCantEquiposService.query({TipoTorneo:self.tiposTorneos.selectedOption.IdTipoTorneo}).$promise.then(function(data) {
            console.log(data);
            self.cantEquipos.cantEquipos = data;
            self.cantEquipos.cantEquipos.splice(0, 0, {IdCantEquipo: '-1', cantidad: '-Todos-'});
        });     
    };      
    
    
TiposSuperficiesService.query().$promise.then(function(data) {
        self.superficies.sup = data;
        self.superficies.sup.splice(0, 0, {IdSuperficie: '-1', Descripcion: '-Todas-'});
    });
    


    this.limpiarFiltros = function(){
        document.getElementById("nombreTorneo").value = '';
        self.provincias.selectedOption.IdProvincia = 1;
        self.getLocalidades();
        self.superficies.selectedOption.IdSuperficie = -1;    
        self.tiposTorneos.selectedOption.IdTipoTorneo = -1;
        self.cantEquipos.selectedOption.cantidad = '-Todos-';
        $scope.selectedCantJugadoresId = -1; 
        document.getElementById("inscripcion").checked = true;
        document.getElementById("activos").checked = true;
        document.getElementById("finalizados").checked = false;
        document.getElementById("idayvuelta").checked = false; 
    };
/***************************TORNEOS************************************************************/
    this.getTorneos = function(){
            self.getFiltros();
              
            var cantEq = $scope.filtros.CantEquipos;
            if(cantEq == '-Todos-')
                cantEq = -1;
        
			TorneosClientesService.query({pNombre:$scope.filtros.NombreTorneo, pTipo:$scope.filtros.TiposTorneos, pCantEquipos:cantEq,pIdProv:$scope.filtros.IdProvincia, pIdLoc:$scope.filtros.IdLocalidad, pCantJug:$scope.filtros.CantJugadores, pIdSuperficie:$scope.filtros.TipoSuperficie, pInscripcion:$scope.filtros.Inscripcion, pActivos:$scope.filtros.Activos, pFinalizados:$scope.filtros.Finalizados, pIdaYVuelta:$scope.filtros.IdaYVuelta }).$promise.then(function(data){
				
                    $scope.torneos = data;
                    console.log('TORNEOS ECONTRADOS-->' + $scope.torneos.length);
                    self.seBusco = true; 
                
                    angular.forEach(data, function(aux) {
                    
                    }); 
                
                    $scope.totalItems = $scope.torneos.length;
                    $scope.pagination.currentPage = 1;

                    $scope.numPages = function () {
                        return Math.ceil($scope.torneos.length / $scope.itemsPerPage);
                    };
    
                    $scope.$watch('currentPage + numPerPage', function() {
                        var begin = (($scope.pagination.currentPage - 1) * $scope.itemsPerPage)
                            , end = begin + $scope.itemsPerPage;

                        $scope.torneosPaginados = $scope.torneos.slice(begin, end);
                        console.log($scope.torneosPaginados);

                    });
                
                
            });	
        
        
	};
    
  
this.getFiltros = function(){
   
    $scope.filtros.NombreTorneo = document.getElementById("nombreTorneo").value;
    if($scope.filtros.NombreTorneo == "" || $scope.filtros.NombreTorneo == null || $scope.filtros.NombreTorneo == undefined)
        $scope.filtros.NombreTorneo = -1;
    
    $scope.filtros.IdProvincia = self.provincias.selectedOption.IdProvincia;
    $scope.filtros.IdLocalidad = self.localidades.selectedOption.IdLocalidad;
    $scope.filtros.CantJugadores = $scope.selectedCantJugadoresId;
    $scope.filtros.TipoSuperficie = self.superficies.selectedOption.IdSuperficie;
    $scope.filtros.TiposTorneos = self.tiposTorneos.selectedOption.IdTipoTorneo;
    $scope.filtros.CantEquipos = self.cantEquipos.selectedOption.cantidad;  
    console.log($scope.filtros.CantEquipos);

    $scope.filtros.Inscripcion = document.getElementById("inscripcion").checked ? 2 : 0;
    $scope.filtros.Activos = document.getElementById("activos").checked ? 1 : 0;
    $scope.filtros.Finalizados = document.getElementById("finalizados").checked ? 3 : 0;
    $scope.filtros.IdaYVuelta = document.getElementById("idayvuelta").checked ? 1 : -1;
 
};    


this.verTorneo = function(torneo)
{
    console.log(torneo.IdTipoTorneo);
console.log(torneo.IdTorneo);
    console.log(torneo);
    
    if(torneo.IdTipoTorneo == 1 || torneo.IdTipoTorneo == "1")
        $state.go("Clientes.verTorneoLiga",{idTorneo:torneo.IdTorneo});
    else if(torneo.IdTipoTorneo == 2 || torneo.IdTipoTorneo == "2")
            $state.go("Clientes.verTorneoCopa",{idTorneo:torneo.IdTorneo});
    
    $('html,body').animate({scrollTop:0},'fast');return false;
}

$scope.pageChanged = function(currentPage)
{
    
    $scope.$watch('currentPage + numPerPage', function() {
            var begin = ((currentPage - 1) * $scope.itemsPerPage)
                , end = begin + $scope.itemsPerPage;
            
          $scope.torneosPaginados = $scope.torneos.slice(begin, end);
          console.log($scope.torneosPaginados);
                
    });
}

});






