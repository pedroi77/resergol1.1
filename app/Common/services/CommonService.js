var app = angular.module("resergolApp");

app.service("CommonService", function($http){

	
	
	/*this.getTiposDoc = function(){
	    var promise = $http.get('https://resergol-pedro77.c9.io/api/modelos/common.php?action=listTiposDoc');
		/*var promise = $http.get('api/common.php?action=listTiposDoc');
		return promise.then(function(response){
			return response.data.data.TiposDoc;
		})
	};*/
	
	var TIPOSDOCS_URI = "https://resergol-pedro77.c9.io/api/tiposDocs";
	
    //var CATEGORIAS_URI = "http://localhost/slim/api/categorias";
	
	this.getTiposDoc = function(){
		return $http.get(TIPOSDOCS_URI)
			.then(function(response){
				return response.data.data;
			});
	};
    
	
});