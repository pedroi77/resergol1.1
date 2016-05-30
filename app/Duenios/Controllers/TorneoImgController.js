var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoImgController", function($scope,$state,$stateParams, TorneoImgService, $compile, Upload, TorneoImgDBService){
    self = this;
    this.idTorneo = $stateParams.idTorneo;
    this.idDuenio = $stateParams.idDuenio;
    
    //this.imagen =  "/../resergol1.1/images/canchas/cancha1.jpg";
   
    
    $scope.uploadFile = function()
	{
		
		var file = $scope.file;
        
		TorneoImgService.uploadFile(file).then(function(res)
		{
			console.log(res.data);
            var vURL = res.data;
            //guardar el resultado e insertar la imagen
            dataimg={
                        idTorneo: self.idTorneo,
                        url: vURL,
                    }   
    
            TorneoImgDBService.save(dataimg, function(reponse){
                console.log(reponse.data[0]);
              },function(errorResponse){
                 console.log('Error');
             });
		})
        
	}
    
     $scope.onChange = function (files) {
          if(files[0] == undefined) return;
          $scope.fileExt = files[0].name.split(".").pop()
        }
        
        $scope.isImage = function(ext) {
          if(ext) {
            return ext == "jpg" || ext == "jpeg"|| ext == "gif" || ext=="png"
          }
        }
    
});
                       
                       
                       
resergolApp.directive('uploaderModel', ["$parse", function ($parse) {
	return {
		restrict: 'A',
		link: function (scope, iElement, iAttrs) 
		{
			iElement.on("change", function(e)
			{
				$parse(iAttrs.uploaderModel).assign(scope, iElement[0].files[0]);
			});
		}
	};
}])
    
    
    
