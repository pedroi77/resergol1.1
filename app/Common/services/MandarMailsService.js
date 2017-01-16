var app = angular.module("resergolApp");

app.service("MandarMailsService", function($http, $resource){

    var MAILS_URI="http://localhost:8080/resergol1.1/api/mandarMails";
    
    return $resource(MAILS_URI, {}, {
        query: {method: 'GET',
                transformResponse: function(data) {
                        //alert(angular.fromJson(data).data[0].resultado);
                        return angular.fromJson(data).data;
                    },
                isArray: true
                }
    });
    
	
}); 