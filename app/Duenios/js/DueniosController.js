var app = angular.module("resergolApp");

app.controller("DueniosController", function(DueniosService, DocumentosService, ProvinciasService, LocalidadesService){
    
    var self = this;
    this.tiposDoc =[];
    this.provincias = [];
    this.localidades = [];
   
    this.mensajeBienvenida = 'En Resergol te damos la posibilidad de llegar a todos los jugadores del fútbol amateur de manera gratuita. Sólo tenés que completar los siguientes datos y te mandaremos un  e-mail como aviso para que puedas registrar tu complejo!';
    
    this.tiposDoc = {
        tipos: [],
        selectedOption: {idTipoDoc: '-3', Descripcion: 'Tipo doc.'} //This sets the default value of the select in the ui
    };    
    
    this.provincias = {
        prov: [],
        selectedProv:{IdProvincia: '-1', Nombre: 'Provincia'} 
    }; 
    
     self.localidades = {
        loc: [],
        selectedOption:{IdLocalidad: '-1', Nombre: 'Localidad'} 
    }; 
  
    
    DocumentosService.query().$promise.then(function(data) {
        self.tiposDoc.tipos = data;
        self.tiposDoc.tipos.push({idTipoDoc: '-3', Descripcion: 'Tipo doc.'});
    });
    
    ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        self.provincias.prov.push({IdProvincia: '-1', Nombre: 'Provincia'}); //Valor por defecto
    });
 
    self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'}); 
    
    
    this.getLocalidades = function(){
        var idProv = self.provincias.selectedProv.IdProvincia;
        
        if(idProv != null){
            if(idProv != -1){
                LocalidadesService.query({id:idProv}).$promise.then(function(data) {
                    self.localidades.loc = data;
                });
            };
        }
        else{
            self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'}); 
        };
    };
	
    
    this.duenio = { 
                    usuario: '', 
                    eMail: '',
                    contrasenia: '', 
                    contrasenia2: '' ,
                    nombre: '',
                    apellido: '',
                    tipoDoc:1,
                    nroDoc:''
                  };
   
   this.createDuenio = function()
   {
      /* self.cliente.tipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;*/
       console.log(self.tiposDoc.selectedOption.IdTipoDoc);
       console.log(self.provincias.selectedProv.IdProvincia);
       console.log(self.localidades.selectedOption.IdLocalidad);
       
       /*
       ClientesService.createCliente(self.cliente.usuario, self.cliente.contrasenia, self.cliente.nombre,
                                    self.cliente.apellido,self.cliente.tipoDoc,self.cliente.nroDoc,self.cliente.eMail).then(function(response){
            if(response.data.error){
                alert(response.data.message);
                return;
            }
            alert("El registro se realizo correctamente! " + response.data.data.cliente);
            //self.getCategorias();
            //self.cat_desc = '';
        });
    */
   };
  
   
});