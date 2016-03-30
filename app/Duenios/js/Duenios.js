var resergolApp = angular.module("resergolApp.Duenios", [
	"ui.router"
]);

resergolApp.config(function($stateProvider, $urlRouterProvider){
//resergolApp.config(function($stateProvider){

	$stateProvider
		.state("Duenios.reserva",{
			url : "/duenios/Reservas",
			templateUrl : "app/Duenios/Templates/DuenioReservas.html",
			controllerAs : "due"
		})
		.state("Duenios.complejo",{
			url : "duenios/Complejo",
			templateUrl : "app/Duenios/Templates/DuenioComplejo.html",
			controllerAs : "due"
		})
		.state("Duenios.torneo",{
			url : "duenios/Torneos",
			templateUrl : "app/Duenios/Templates/DuenioTorneos.html",
			controllerAs : "due"
		})
		.state("Duenios.cancha",{
			url : "duenios/Canchas",
			templateUrl : "app/Duenios/Templates/DuenioCanchas.html",
			controllerAs : "due"
		})
		.state("Duenios.listaNegra",{
			url : "duenios/ListaNegra",
			templateUrl : "app/Duenios/Templates/DuenioListaNegra.html",
			controllerAs : "due"
		});
		$urlRouterProvider.otherwise("/duenios");
    
});