var resergolApp = angular.module("resergolApp");

resergolApp.controller("ComplejoImagenesController", function($scope, $state , $stateParams, ComplejoImagenesServices, $compile, Upload, ComplejoImagenesDBService,ComplejoImagenesAltaServices){
    self = this;
    
    this.idComplejo = sessionStorage.idComplejo;
    this.idDuenio = sessionStorage.id;
    this.msjPantalla ="" ;
    this.archivoInvalido = true;
    this.bMensaje = false;
    this.imagenes = {
        tipos: [],
        selectedOption: {idComplejo: '1', nombre: '', url:'', imagen:''} 
    };    
    
    this.init = function(){
        this.imagenes.tipos=[]; 
        ComplejoImagenesDBService.query({idComplejo: self.idComplejo}).$promise.then(function(data) {
            var i;
            for(i=0; i< data.length; i++){
                self.imagenes.tipos.push(data[i]);
            };

            if(self.imagenes.length > 0){
                self.imagenes.selectedOption = self.imagenes.tipos[0];
                $scope.imgSelect =  self.imagenes.selectedOption.imagen;
                self.msjPantalla = "Imagenes del torneo " + self.imagenes.selectedOption.nombre;
            }
        });
    };
    
    self.init();
    
    $scope.uploadFile = function()
	{
		var file = $scope.file;
        console.log(file);
        
		ComplejoImagenesServices.uploadFile(file).then(function(res)
		{
            console.log("Abajo del TorneoImgService.uploadFile(file)");
            var vURL = res.data;
            //guardar el resultado e insertar la imagen
            dataimg={
                        idComplejo: self.idComplejo,
                        url: vURL,
                        aux :'alta',
                    }   
    
            console.log(dataimg);
            ComplejoImagenesAltaServices.save(dataimg, function(reponse){
                console.log("Abajo del ComplejoImagenesAltaServices");
                self.init();
             },function(errorResponse){
                 console.log('Error');
             });
		})
	}
    
     $scope.onChange = function (files) {
         
        if(files[0] == undefined) return;
            $scope.fileExt = files[0].name.split(".").pop()
            return $scope.isImage($scope.fileExt );
        }
        
        
        $scope.isImage = function(ext) {
             //var res = ext == ("jpg" || ext == "jpeg"|| ext == "gif" || ext=="png");
            var res =  ("jpg" || ext == "jpeg"|| ext == "gif" || ext=="png");
            self.archivoInvalido = !res;
            self.bMensaje= !res ;
            
            return res;          
        };
    
        
    this.borrar = function(){
        if(confirm("¿Esta seguro que desea borrar la imagen seleccionada?")){
            ComplejoImagenesDBService.delete({idComplejo: self.idComplejo, url:self.imagenes.selectedOption.url}, function(reponse){
                    console.log(reponse.data);
                    self.init();
                  },function(errorResponse){
             
                 });
        }
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
    
    
    
