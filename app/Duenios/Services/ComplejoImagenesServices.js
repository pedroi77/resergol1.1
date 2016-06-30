var app = angular.module("resergolApp");

app.service("ComplejoImagenesServices", function($http, $q, $resource){
    
    var COMPLEJO_IMAGENES_URI = "http://localhost:8080/resergol1.1/api/Imagenes/dueniosImagenes.php";
    
    this.uploadFile = function(file, name)
    {
        var deferred = $q.defer();
        var formData = new FormData();

        formData.append("file", file);

        return $http.post(COMPLEJO_IMAGENES_URI, formData, {
            headers: {
                "Content-type": undefined
            },
            transformRequest: angular.identity
        })
        .success(function(res)
        {
            deferred.resolve(res);
        })
        .error(function(msg, code)
        {
            deferred.reject(msg);
        })
        return deferred.promise;
    }	
   
});