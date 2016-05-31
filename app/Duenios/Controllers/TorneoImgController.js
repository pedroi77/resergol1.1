var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoImgController", function($scope,$state,$stateParams, TorneoImgService, $compile, Upload, TorneoImgDBService,TorneoimgAltaService){
    self = this;
    this.idTorneo = $stateParams.idTorneo;
    this.idDuenio = $stateParams.idDuenio;
    //this.imagenes =[];
    //this.imagen =  "/../resergol1.1/images/canchas/cancha1.jpg";
    this.imagenes = {
        tipos: [],
        selectedOption: {IdTorneo: '1', nombre: '', url:'', imagem:''} 
    };    
    
    TorneoImgDBService.query({idTorneo: self.idTorneo}).$promise.then(function(data) {
        var i;
        for(i=0; i< data.length; i++){
            console.log(data[i]);
             self.imagenes.tipos.push(data[i]);
        };
        
        self.imagenes.selectedOption = self.imagenes.tipos[0];
    });
    
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
                        aux :'alta',
                    }   
    
            TorneoimgAltaService.save(dataimg, function(reponse){
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
    
        
    this.borrar = function(){

        //SACAR HARCODE
        TorneoImgDBService.delete({idTorneo: 11, url:"chilena_2016531_51353.jpg" }, function(reponse){
                console.log(reponse.data);
              },function(errorResponse){
                 console.log('Error');
             });
    };    
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
    
    
    
