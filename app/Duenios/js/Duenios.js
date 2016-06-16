    var resergolApp = angular.module("resergolApp.Duenios", [
	"ui.router"
]);

resergolApp.config(function($stateProvider, $urlRouterProvider){
//resergolApp.config(function($stateProvider){

	$stateProvider
		/*
		.state("Duenios.torneo",{
			url : "/Torneos",
			templateUrl : "app/Duenios/Templates/DuenioTorneos.html",
			controllerAs : "due"
		})*/
        .state("Duenios.torneoNuevo",{
			url : "/Torneos/Nuevo",
			templateUrl : "app/Duenios/Templates/DuenioTorneoNuevo.html",
			controllerAs : "due"
		})
        .state("Duenios.torneoBuscar",{
			url : "/Torneos/Buscar",
			templateUrl : "app/Duenios/Templates/DuenioTorneosBuscar.html",
			controllerAs : "due"
		})
        .state("Duenios.torneoEquipos",{
			url : "/Torneos/Equipos/:idTorneo",
		    params: {
                    idTorneo:{value:'defaultValue'},
                    nombre:{value:'defaultValue'},
                    cantEquipos:{value:'defaultValue'},
                    inscriptos:{value:'defaultValue'}
                },	
            templateUrl : "app/Duenios/Templates/DuenioTorneoEquipos.html",
			controllerAs : "due"
		})
        .state("Duenios.verTorneoLiga",{
			url : "/Torneo/Liga/:idTorneo",
			templateUrl : "app/Common/Templates/VerTorneoLiga.html",
            params: {idTorneo:{value:'defaultValue'}},
            controller : "",	
            controllerAs : "due"
		})
        .state("Duenios.verTorneoCopa",{
			url : "/Torneo/Copa",
			templateUrl : "app/Common/Templates/VerTorneoCopa.html",
            controller : "",	
            controllerAs : "due"
		}) 
        .state("Duenios.verTorneoLiga.inscripcionTorneoLiga",{
			url : "/Inscripcion",
			templateUrl : "app/Common/Templates/InscripcionTorneo.html",
            controller : "",	
            controllerAs : "due"
		})
        .state("Common.verTorneoCopa.inscripcionTorneoCopa",{
			url : "/Inscripcion",
			templateUrl : "app/Common/Templates/InscripcionTorneo.html",
            controller : "",	
            controllerAs : "cli"
		})
        .state("Duenios.complejo",{
			url : "/Complejo",
			templateUrl : "app/Duenios/Templates/DuenioComplejo.html",
			controllerAs : "due"
		})
		.state("Duenios.cancha",{
			url : "/Canchas",
			templateUrl : "app/Duenios/Templates/DuenioCanchas.html",
			controllerAs : "due"
		})
		.state("Duenios.listaNegra",{
			url : "/ListaNegra",
			templateUrl : "app/Duenios/Templates/DuenioListaNegra.html",
			controllerAs : "due"
		})
        .state("Duenios.torneoImagenes",{
			url : "/Torneos/Imagenes/:idTorneo/:idDuenio",
		    params: {
                    idTorneo:{value:'defaultValue'},
                    idDuenio:{value:'defaultValue'}
                },	
            templateUrl : "app/Duenios/Templates/DuenioTorneoImg.html",
			controllerAs : "due"
		})
        .state("Duenios.complejoImagenes",{
			url : "/Complejo/Imagenes",
			templateUrl : "app/Duenios/Templates/DuenioComplejoImg.html",
			controllerAs : "due"
		})
        .state("Duenios.canchaImagenes",{
			url : "/Cancha/Imagenes",
			templateUrl : "app/Duenios/Templates/DuenioCanchaImg.html",
			controllerAs : "due"
		})
    
    
        .state("Duenios.reserva",{
			url : "/Reservas",
			templateUrl : "app/Duenios/Templates/DuenioReservas.html",
			controllerAs : "due"
		});
    
        $urlRouterProvider.otherwise("/duenios/Reservas");
    
		
    
});