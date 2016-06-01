var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoImgController", function($scope, $state , $stateParams, TorneoImgService, $compile, Upload, TorneoImgDBService,TorneoimgAltaService){
    self = this;
    
    this.idTorneo = $stateParams.idTorneo;
    this.idDuenio = $stateParams.idDuenio;
    this.msjPantalla = "Imagenes del torneo ";
    this.imagenes = {
        tipos: [],
        selectedOption: {idtorneo: '1', nombre: '', url:'', imagen:''} 
    };    
    
    
    TorneoImgDBService.query({idTorneo: self.idTorneo}).$promise.then(function(data) {
        var i;
        for(i=0; i< data.length; i++){
            self.imagenes.tipos.push(data[i]);
            //console.log(self.imagenes.tipos[i]);
            console.log(self.imagenes.tipos[i].idtorneo);
        };
        
        self.imagenes.selectedOption = self.imagenes.tipos[0];
        $scope.imgSelect =  self.imagenes.selectedOption.imagen;
        self.msjPantalla=self.msjPantalla+self.imagenes.selectedOption.nombre;
    });
    
    
        //console.log(self.imagenes.selectedOption.imagen);
    
    
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
                $state.reload("Duenios.torneoImagenes",{idTorneo:self.idTorneo, idDuenio:self.idDuenio});
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
        TorneoImgDBService.delete({idTorneo: self.imagenes.selectedOption.idtorneo, url:self.imagenes.selectedOption.url}, function(reponse){
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
    
    
    
