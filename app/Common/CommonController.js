var app = angular.module("resergolApp");

app.controller("CommonController", function(CommonService){
	
	var self = this;
    this.tiposDoc =[];
    
     this.tiposDoc = {
        tipos: [],
        selectedOption: {idTipoDoc: '-3', Descripcion: 'Tipo doc.'} //This sets the default value of the select in the ui
    };    
    
    self.tiposDoc.tipos = CommonService.getTiposDoc();
    
    

});