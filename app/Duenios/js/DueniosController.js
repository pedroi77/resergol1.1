var duenios = angular.module("resergolApp.Duenios");

duenios.controller("dueniosController", function($state,  $window){
	
	var self = this;
	//this.categorias = [];
    this.editOn = false;
	/*this.cat_desc = '';
	this.formLabel = "Nueva Categoría";
	this.categoriaSeleccionada = null;*/
	
	this.Reservas = function(){
		//self.activeItem(-1, null);
		//self.cat_desc = '';
		//self.formLabel = "Nueva Categoria";
		//self.editOn = false;
		console.log("Reservaas");
	//	$state.go("Duenios.reserva");
	};
	
	
	/*this.getCategorias = function(){
        return CategoriaService.getCategorias().then(function(data){
            self.categorias = data;
        });
    };
    
    this.createCategoria = function(){
        CategoriaService.createCategoria(self.cat_desc).then(function(response){
            if(response.data.error){
                alert("Ocurrio un error");
                return;
            }
            alert("Categoria creada con el id: " + response.data.data.categoria_id);
            self.getCategorias();
            self.cat_desc = '';
        })
    };
    
    this.activeItem = function($index, item){
        self.selectedIndex = $index;
        self.categoriaSeleccionada = item;
    };

    this.updateCategoria = function(){
        CategoriaService.updateCategoria(self.cat_desc, self.categoriaSeleccionada.categoria_id).then(function(response){
            if(response.data.error){
                alert("Ocurrio un error");
                return;
            }
            alert("Categoria actualizada");
            self.getCategorias();
			self.activeItem(-1, null);
            self.cat_desc = '';
            self.editOn = false;
			$state.go("categorias");
        })
    };
    
    this.putCategoria = function(){
        self.cat_desc = self.categoriaSeleccionada.categoria_desc;
		self.formLabel = "Editar Categoria";
        self.editOn = true;
		$state.go("categorias.editar",  { id : self.categoriaSeleccionada.categoria_id});
    };*/
    
	
	/*
	this.eliminarCategoria = function(){
		if($window.confirm("Eliminar categoria")){
			CategoriaService.deleteCategoria(self.categoriaSeleccionada.categoria_id).then(function(response){
				if(response.data.error){
					alert("Ocurrio un error");
					return;
				}
				alert("Categoria eliminada");
				self.getCategorias();
				self.activeItem(-1, null);
				self.cat_desc = '';
				self.editOn = false;
				$state.go("categorias");
			});
		}
	};
	
    this.cleanCat = function(){
        self.cat_desc = '';
        self.editOn = false;
    };
    
	this.init = function(){
		this.getCategorias().then(function(){
			if($state.is("categorias.editar")){
				var indice = null;
				var selected = 
					self.categorias.filter(function(item, index){
						var equal = item.categoria_id == $state.params.id;
						if(equal) indice = index;
						return equal;
					})[0];
				self.activeItem(indice, selected);
				self.cat_desc = self.categoriaSeleccionada.categoria_desc;
				self.formLabel = "Editar Categoria";
				self.editOn = true;
			}else if($state.is("categorias.nueva")){
				self.activeItem(-1, null);
				self.cat_desc = '';
				self.editOn = false
			}
		});
	};
	
	this.init();
	*/
});