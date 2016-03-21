var app = angular.module("resergolApp");

app.controller("CommonController", function(CommonService){
	
	var self = this;
    this.tiposDoc =[];
    
     this.tiposDoc = {
        tipos: [],
        selectedOption: {idTipoDoc: '-3', Descripcion: 'Tipo doc.'} //This sets the default value of the select in the ui
    };    
    
    self.tiposDoc.tipos = CommonService.getTiposDoc();
    self.tiposDoc.tipos.push({idTipoDoc: '-3', Descripcion: 'Tipo doc.'});
    
    /*CommonService.getTiposDoc()
        .then(function(data){
            self.tiposDoc.tipos=data;
            self.tiposDoc.tipos.push({idTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        })
      */  
   
    
   /* this.getCategorias= function(){    
        self.categorias =CategoriaService.getCategorias();
    };*/
    
   
  
 
});