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
			controllerAs : "due",
            rol:'D'
		})
      .state("Duenios.torneoModificar",{
			url : "/Torneos/Modificar",
            params: {
                    idTorneo:{value:'defaultValue'}
                    },	
			templateUrl : "app/Duenios/Templates/DuenioTorneoModificar.html",
			controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.verComplejo",{
                url : "/VerComplejo/:idComp",
                params: {
                    idComp:{value:'defaultValue'}
                },
                templateUrl : "app/Clientes/Templates/VerComplejo.html",
                controllerAs : "cli",
            rol:'D'
            })
        .state("Duenios.test",{
			url : "/Torneos/test",
			templateUrl : "app/Duenios/Templates/reservaPrueba.html",
			controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.torneoBuscar",{
			url : "/Torneos/Buscar",
			templateUrl : "app/Duenios/Templates/DuenioTorneosBuscar.html",
			controllerAs : "due",
            rol:'D'
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
			controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.verTorneoLiga",{
			url : "/Torneo/Liga/:idTorneo",
			templateUrl : "app/Common/Templates/VerTorneoLiga.html",
            params: {idTorneo:{value:'defaultValue'}},
            controller : "",	
            controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.verTorneoCopa",{
			url : "/Torneo/Copa",
			templateUrl : "app/Common/Templates/VerTorneoCopa.html",
            params: {idTorneo:{value:'defaultValue'}},
            controller : "",	
            controllerAs : "due",
            rol:'D'
		}) 
        .state("Duenios.verTorneoLiga.inscripcionTorneoLiga",{
			url : "/Inscripcion",
			templateUrl : "app/Common/Templates/InscripcionTorneo.html",
            controller : "",	
            controllerAs : "due",
            rol:'D'
		})
        .state("Common.verTorneoCopa.inscripcionTorneoCopa",{
			url : "/Inscripcion",
			templateUrl : "app/Common/Templates/InscripcionTorneo.html",
            controller : "",	
            controllerAs : "cli",
            rol:'D'
		})
        .state("Duenios.complejo",{
			url : "/Complejo",
			templateUrl : "app/Duenios/Templates/DuenioComplejo.html",
			controllerAs : "due",
            rol:'D'
		})
		.state("Duenios.cancha",{
			url : "/Canchas",
			templateUrl : "app/Duenios/Templates/DuenioCanchas.html",
			controllerAs : "due",
            rol:'D'
		})
		.state("Duenios.listaNegra",{
			url : "/ListaNegra",
			templateUrl : "app/Duenios/Templates/DuenioListaNegra.html",
			controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.torneoImagenes",{
			url : "/Torneos/Imagenes/:idTorneo/:idDuenio",
		    params: {
                    idTorneo:{value:'defaultValue'},
                    idDuenio:{value:'defaultValue'},
                    nombre:{value:' '}
                },	
            templateUrl : "app/Duenios/Templates/DuenioTorneoImg.html",
			controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.complejoImagenes",{
			url : "/Complejo/Imagenes",
			templateUrl : "app/Duenios/Templates/DuenioComplejoImg.html",
			controllerAs : "due",
            rol:'D'
		})
        .state("Duenios.canchaImagenes",{
			url : "/Cancha/Imagenes/:idComplejo/:idCancha",
            params: {
                    idComplejo:{value:'defaultValue'},
                    idCancha:{value:'defaultValue'}
                 
                },	
			templateUrl : "app/Duenios/Templates/DuenioCanchaImg.html",
			controllerAs : "due",
            rol:'D'
		})
    
        .state("Duenios.devoluciones",{
			url : "/Devoluciones",
            params: {
                    idComplejo:{value:'defaultValue'}
                },	
			templateUrl : "app/Duenios/Templates/DueniosDevoluciones.html",
			controllerAs : "due",
            rol : "D"
		})
        .state("Duenios.reserva",{
			url : "/Reservas",
			templateUrl : "app/Duenios/Templates/DuenioReservas.html",
			controllerAs : "due",
            rol:'D'
		});
    
        $urlRouterProvider.otherwise("/duenios/Reservas");
    
		
    
});