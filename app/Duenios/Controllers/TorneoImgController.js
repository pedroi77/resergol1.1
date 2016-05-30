var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoImgController", function($scope,$state,$stateParams, TorneoImgService, $compile, Upload){
    
    this.idTorneo = $stateParams.idTorneo;
    this.idDuenio = $stateParams.idDuenio;
    
    //this.imagen =  "/../resergol1.1/images/canchas/cancha1.jpg";
   
    
    $scope.uploadFile = function()
	{
		
		var file = $scope.file;
      
		TorneoImgService.uploadFile(file).then(function(res)
		{
			console.log(res);
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
    
    
    
