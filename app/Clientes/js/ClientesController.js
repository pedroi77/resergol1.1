var app = angular.module("resergolApp");

app.controller("ClientesController", function(ClientesService, DocumentosService, $state){
    
    var self = this;
    this.tiposDoc =[];
    //this.someScopeVariable ='Contraseña Test',
    this.tiposDoc = {
        tipos: [],
        selectedOption: {idTipoDoc: '-3', Descripcion: 'Tipo doc.'} //This sets the default value of the select in the ui
    };    
    
    /*
    DocumentosService.query().$promise.then(function(data) {
        self.tiposDoc.tipos = data;
        self.tiposDoc.tipos.push({idTipoDoc: '-3', Descripcion: 'Tipo doc.'});
    });
    */
	
    this.cliente = { 
                    usuario: '', 
                    eMail: '',
                    contrasenia: '', 
                    contrasenia2: '' ,
                    nombre: '',
                    apellido: '',
                    tipoDoc:1,
                    nroDoc:''
                  };
   
   this.createCliente = function()
   {
       self.cliente.tipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
       
       ClientesService.createCliente(self.cliente.usuario, self.cliente.contrasenia, self.cliente.nombre,                               self.cliente.apellido,self.cliente.tipoDoc,self.cliente.nroDoc,self.cliente.eMail).then(function(response){
            if(response.data.error){
                alert(response.data.message);
                return;
            }
            alert("El registro se realizo correctamente! " + response.data.data.cliente);
            //self.getCategorias();
            //self.cat_desc = '';
        });
    
   };
  
    this.irTorneoCopa = function(){
             $state.go('Clientes.verTorneoCopa');
    };
    
    this.irTorneoLiga = function(){
             $state.go('Clientes.verTorneoLiga');
    };
    
    this.inscripcionTorneoLiga = function(){  //Toque esto
        $state.go('Clientes.verTorneoLiga.inscripcionTorneoLiga');
    };
    
    this.inscripcionTorneoCopa = function(){
        $state.go('Clientes.verTorneoCopa.inscripcionTorneoCopa');
    }; 
    
    this.irCancha = function(){
             $state.go('Clientes.verCancha');
    };
    
    this.irComplejo = function(){
             $state.go('Clientes.verComplejo');
    };
   
});