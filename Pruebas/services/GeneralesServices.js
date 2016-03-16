var app = angular.module("app");

app.service("GeneralesServices", function($http){

  /*var USUARIO_URI = "http://localhost/pa2-ejercicios/ejercicio-angular/data/data.json";*/
   var DIAS = "Pruebas/data/Dias.json";
  
  this.getDias = function(){
    return $http.get(DIAS)
      .then(function(response){
        return response.data;
      });
  };
  
  this.getDiasBase = function(){
		var promise = $http.get('resergol/SelectPrueba.php?action=list');
		return promise.then(function(response){
			return response.data.data.Dias;
		})
	};
  
});

