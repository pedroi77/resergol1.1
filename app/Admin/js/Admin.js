var resergolApp = angular.module("resergolApp.Admin", [
	"ui.router"
]);

resergolApp.config(function($stateProvider, $urlRouterProvider){
//resergolApp.config(function($stateProvider){

	$stateProvider
		.state("Admin.administracion",{
			url : "/admin/Administracion",
			templateUrl : "app/Admin/Templates/AdminListaComplejo.html",
			controllerAs : "admin"
		});
		$urlRouterProvider.otherwise("/admin");
    
}); 