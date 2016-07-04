var app = angular.module("resergolApp");

app.service("CanchaImagenesServices", function($http, $q, $resource){
    
    var CANCHA_IMAGENES_URI = "http://localhost:8080/resergol1.1/api/Imagenes/canchasImagenes.php";
    
    this.uploadFile = function(file, name)
    {
        var deferred = $q.defer();
        var formData = new FormData();

        formData.append("file", file);

        return $http.post(CANCHA_IMAGENES_URI, formData, {
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