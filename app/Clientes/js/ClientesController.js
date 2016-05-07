var app = angular.module("resergolApp");

app.controller("ClientesController", function(ClientesService, UsuarioService, DocumentosService, $state, $scope, $resource){ 
    
    
    var self = this;
    this.brand = "¿Qué buscás?";
    this.tiposDoc =[];
    //this.someScopeVariable ='Contraseña Test',
    this.tiposDoc = {
        tipos: [],
        selectedOption: {TipoDoc: '-3', Descripcion: '-Tipo doc.-'} //This sets the default value of the select in the ui
    };
    

    DocumentosService.query().$promise.then(function(data) {
        self.tiposDoc.tipos = data;
        //self.tiposDoc.tipos.push({TipoDoc: '-3', Descripcion: '-Tipo doc.-'});
        self.tiposDoc.tipos.splice(0, 0, {TipoDoc: '-3', Descripcion: '-Tipo doc.-'});
    });
	
    

    this.cliente = { 
                    id: -3,
                    tipo: '',
                    existeDni:false,
                    existe:false,
                    existeMail:false,
                    usuario: '', 
                    eMail: '',
                    contrasenia: '', 
                    contrasenia2: '' ,
                    nombre: '',
                    apellido: '',
                    tipoDoc:1,
                    nroDoc:''
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
    
    
    
    this.existeUsuario = function(){
        if(self.cliente.usuario!=undefined){
            
            UsuarioService.query({user:self.cliente.usuario}).$promise.then(function(data){
                self.cliente.id =  data[0].id;                                                         
                self.cliente.tipo  = data[0].tipo;    
                
                if(self.cliente.id > -1 && self.cliente.tipo == 'C'){
                    self.cliente.existe = true;
                    console.log(self.cliente.existe + " - "  + self.cliente.tipo + " - " + self.cliente.usuario);
                    
                }
                else{
                    self.cliente.existe = false;
                    console.log(self.cliente.existe + " - "  + self.cliente.tipo + " - " + self.cliente.usuario);
                }
            });
            
            
        }

    };
    
    
    this.existeMail = function(){
        if(self.cliente.eMail!=undefined){
            UsuarioService.query({email:self.cliente.eMail}).$promise.then(function(data){
                //self.cliente.id =  data[0].id;   
                alert(data[0].resultado);
                var bExisteMail = data[0].resultado;                                                             
                if(bExisteMail == 1){
                    self.cliente.existeMail = true;
                    console.log(self.cliente.existeMail);
                    
                }
                else{
                    self.cliente.existeMail = false;
                    console.log(self.cliente.existeMail);
                }
            });
            
            
        }

    };
    
    this.validarDatosCliente = function()
    {
        var mensaje = 'Se han encontrado los siguientes errores: \n\n';
        var codeMessage = 0;
        
        if(self.cliente.usuario.length == 0)
        {
            mensaje += "No se ha especificado el usuario! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.usuario.length > 25)
        {
            mensaje += "El usuario no puede tener mas de 25 caracteres! \n";
            codeMessage = 1;
        }
            
        
        if(self.cliente.eMail.length == 0)
        {
            mensaje += "No se ha especificado el mail! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.contrasenia.length == 0)
        {
            mensaje += "No se ha especificado la contraseña! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.contrasenia.length > 12)
        {
            mensaje += "La contraseña no puede tener mas de 12 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.contrasenia2.length == 0)
        {
            mensaje += "No se introdujo nuevamente la contraseña! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.contrasenia2.length > 12)
        {
            mensaje += "La contraseña no puede tener mas de 12 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.nombre.length == 0)
        {
            mensaje += "No se ha especificado el nombre! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.nombre.length > 60)
        {
            mensaje += "El nombre no puede tener mas de 60 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.apellido.length == 0)
        {
            mensaje += "No se ha especificado el apellido! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.apellido.length > 60)
        {
            mensaje += "El apellido no puede tener mas de 60 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.tiposDoc.selectedOption.IdTipoDoc <= 0)
        {
            mensaje += "No se ha especificado el Tipo de Documento! \n";
            codeMessage = 1;
        }
        
        
        if(self.cliente.nroDoc.length == 0)
        {
            mensaje += "No se ha especificado su número de documento! \n";
            codeMessage = 1;
        }
        
        if(self.cliente.nroDoc.length == 0)
        {
            mensaje += "El número de documento no puede tener mas de 10 caracteres! \n";
            codeMessage = 1;
        }
        
        
        if(self.cliente.contrasenia.length > 0 && self.cliente.contrasenia2.length > 0)
        {
            
            if(self.cliente.contrasenia != self.cliente.contrasenia2)
            {
                mensaje += "Las contraseñas no coinciden! \n";
                codeMessage = 1;
            }
        }
        
        if(codeMessage == 1)
            alert(mensaje);
        else
            {
              this.createCliente();
            }
    };
   
    
    
    
    this.createCliente = function()
    {
        /*self.cliente.tipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
        var connection = $resource("http://localhost/resergol1.1/api/clientes/", {}, {save: {method: 'POST'}})
        var params = {'usuario': self.cliente.usuario, 'contrasenia': self.cliente.contrasenia, 'nombre': self.cliente.nombre,
                  'apellido': self.cliente.apellido, 'idTipoDoc': self.cliente.tipoDoc, 'nroDoc': self.cliente.nroDoc,
                    'email': self.cliente.eMail};
        
        var results = connection.save(params);*/
        
        var clienteNuevo = new ClientesService();
          
 
        clienteNuevo.data = {
                        "usuario": self.cliente.usuario,
                        "contrasenia": self.cliente.contrasenia,
                        "nombre": self.cliente.nombre,
                        "apellido": self.cliente.apellido,
                        "idTipoDoc": self.cliente.tipoDoc,
                        "nroDoc": self.cliente.nroDoc,
                        "email": self.cliente.eMail,
                        "valor": -5
  	       };   
        
        ClientesService.save(clienteNuevo.data, function(reponse){
            alert("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
          },function(errorResponse){
              console.log(errorResponse.data.message);  
         });
        
        $('#registracionModal').modal('hide');
    }
    
   
});