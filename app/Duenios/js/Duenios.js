var resergolApp = angular.module("resergolApp.Duenios", [
	"ui.router"
]);

resergolApp.config(function($stateProvider, $urlRouterProvider){

	$stateProvider
		.state("reserva",{
			url : "/Reservas",
			templateUrl : "DuenioReservas.html",
			controllerAs : "due"
		})
		.state("complejo",{
			url : "/Complejo",
			templateUrl : "DuenioComplejo.html",
			controllerAs : "due"
		})
		.state("torneo",{
			url : "/Torneos",
			templateUrl : "DuenioTorneos.html",
			controllerAs : "due"
		})
		.state("cancha",{
			url : "/Canchas",
			templateUrl : "DuenioCanchas.html",
			controllerAs : "due"
		})
		.state("listaNegra",{
			url : "/ListaNegra",
			templateUrl : "DuenioListaNegra.html",
			controllerAs : "due"
		});
		$urlRouterProvider.otherwise("/duenios");
});