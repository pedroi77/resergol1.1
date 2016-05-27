var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoImgController", function($scope, TorneoImgService){
    $scope.uploadFile = function()
	{
		var name = $scope.name;
		var file = $scope.file;
		
		TorneoImgService.uploadFile(file, name).then(function(res)
		{
			console.log(res);
		})
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
    
    
    
