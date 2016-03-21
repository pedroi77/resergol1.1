var app = angular.module("resergolApp");

app.service("CommonService", function($http, $resource){

	
	
	
	var TIPOSDOCS_URI = "http://localhost/resergol1.1/api/tiposDocs";
	
    //var CATEGORIAS_URI = "http://localhost/slim/api/categorias";
	
    var res = $resource(TIPOSDOCS_URI,{}, {
                                                query: { method: "GET", 
                                                          transformResponse: function(data) {
                                                            return angular.fromJson(data).data;
                                                          },
                                                        isArray: true }
                                               }
                                            );
    
    this.getTiposDoc = function(){    
        return res.query();
    };
    
    
	/*this.getTiposDoc = function(){
		return $http.get(TIPOSDOCS_URI)
			.then(function(response){
				return response.data.data;
			});
	};*/
    
	
});