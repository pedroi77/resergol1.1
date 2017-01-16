var resergolApp = angular.module("resergolApp.Admin", [
	"ui.router"
]);

resergolApp.config(function($stateProvider, $urlRouterProvider){
//resergolApp.config(function($stateProvider){

	$stateProvider
		.state("Admin.administracion",{
			url : "/admin/Administracion",
			templateUrl : "app/Admin/Templates/AdminListaComplejos.html",
			controllerAs : "admin",
            rol: 'A'
		})
        .state("Admin.bloqueados",{
			url : "/admin/Bloqueados",
			templateUrl : "app/Admin/Templates/AdminUsuariosBoqueados.html",
			controllerAs : "admin",
            rol: 'A'
		});
		$urlRouterProvider.otherwise("/admin");
    
}); 