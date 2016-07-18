var app = angular.module("resergolApp");

app.controller("ClientesController", function(ClientesService, UsuarioService, DocumentosService, EmailService, TipoYDocumentosService, $state, $scope, $resource){ 
    
    
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
                    tipo: 'C',
                    existeDni:false,
                    existe:false,
                    existeEmail:false,
                    contraseniasIguales: true,
                    usuario: '', 
                    eMail: '',
                    contrasenia: '', 
                    contrasenia2: '' ,
                    nombre: '',
                    apellido: '',
                    tipoDoc:-1,
                    nroDoc:'',
                    clienteValido: true
                  };
   /*
    this.limpiarModal = function(form){
        self.cliente.id =-3;
        self.cliente.tipo ='C';
        self.cliente.existeDni =false;
        self.cliente.existe =false;
        self.cliente.existeEmail =false;
        self.cliente.contraseniasIguales =true;
        self.cliente.usuario ="";
        self.cliente.eMail ="";
        self.cliente.contrasenia ="";
        self.cliente.contrasenia2 ="";
        self.cliente.nombre ="";
        self.cliente.apellido ="";
        self.cliente.tipoDoc =-1;
        self.cliente.nroDoc ="";
        self.cliente.clienteValido =true;
        
        
        
        form.$setPristine();
    };
    */
    
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
    
    
    
    this.clienteValido = function(){
      
        //console.log('tipo doc-->' + self.cliente.tipoDoc);
        if(!self.cliente.existe && !self.cliente.existeDni && !self.cliente.existeEmail
          && self.cliente.contraseniasIguales && self.cliente.tipoDoc > 0)
        {
            //console.log('cliente valido');
            return true;
        }
        else
            {
                //console.log('cliente INVALIDOOOOOO');
                return false;
            }
            

    };
    
    this.sinEspacios = function(cadena){
        var aux = cadena.split(" ");
        var salida = "";
        angular.forEach(aux, function(palabra){
           salida = salida + palabra.trim()
        })
        
        return salida.toString();
    };
    
    
    this.existeUsuario = function(){
        if(self.cliente.usuario!=undefined){
            
            self.cliente.usuario = self.sinEspacios(self.cliente.usuario.trim());
            
            //console.log(self.cliente.usuario);
            
            UsuarioService.query({user:self.cliente.usuario}).$promise.then(function(data){
                self.cliente.id =  data[0].id;                                                         
                self.cliente.tipo  = data[0].tipo;    
                
                if(self.cliente.id > -1){
                    self.cliente.existe = true;
                    //console.log(self.cliente.existe + " - "  + self.cliente.tipo + " - " + self.cliente.usuario);
                    
                }
                else{
                    self.cliente.existe = false;
                    //console.log(self.cliente.existe + " - "  + self.cliente.tipo + " - " + self.cliente.usuario);
                }
            });
            
            
        }

    };
    
    
    this.existeEmail = function(){
        
        if(self.cliente.eMail!=undefined){
            EmailService.query({email:self.cliente.eMail}).$promise.then(function(data){
                //self.cliente.id =  data[0].id;   
                //alert(data[0].resultado);
                var bExisteEmail = data[0].resultado;                                                             
                if(bExisteEmail == 1){
                    self.cliente.existeEmail = true;
                    console.log(self.cliente.existeEmail);
                    console.log(self.cliente.existeEmail);
                    
                }
                else{
                    self.cliente.existeEmail = false;
                    console.log(self.cliente.existeEmail);
                }
            });
            
        }

    };
    
    
    
    this.existeDni = function(){
        
        //console.log(self.cliente.nroDoc);
        self.cliente.tipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
        
        if(self.cliente.nroDoc!=undefined && self.cliente.nroDoc!=""){
            console.log(self.cliente.tipoDoc + self.cliente.nroDoc + self.cliente.tipo);
            TipoYDocumentosService.query({tipoDoc:self.cliente.tipoDoc, nroDoc:self.cliente.nroDoc, tipoUsu:self.cliente.tipo}).$promise.then(function(data){

                var valor = data[0].duenio;
                
                console.log('valor: ' + valor);
                
                if(valor == 1){
                    self.cliente.existeDni = true;
                    console.log(self.cliente.existeDni);
                }
                else{
                    self.cliente.existeDni = false;
                    console.log(self.cliente.existeDni);
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
    
    
    this.compararContrasenias = function(){
        
        //console.log("1:" + self.Duenio.contrasenia + "2:" + self.Duenio.contrasenia2);
        
        if(self.cliente.contrasenia != undefined && self.cliente.contrasenia2 != undefined)
            if(self.cliente.contrasenia.length > 0 && self.cliente.contrasenia2.length > 0)
            {
                //console.log("1:" + self.Duenio.contrasenia + "2:" + self.Duenio.contrasenia2);
                if(self.cliente.contrasenia == self.cliente.contrasenia2)
                {
                    self.cliente.contraseniasIguales = true;
                }
                else
                {
                    self.cliente.contraseniasIguales = false;
                }   
            }
    };
   
    
    this.limpiarForm = function(form)
    {
        form.$setPristine();
        //form.$setPristine();
        //form = $('#registracionModal');
                    self.cliente.id = -3;
                    self.cliente.tipo= 'C';
                    self.cliente.existeDni=false;
                    self.cliente.existe=false;
                    self.cliente.existeEmail=false;
                    self.cliente.contraseniasIguales= true;
                    self.cliente.usuario= ''; 
                    self.cliente.eMail= '';
                    self.cliente.contrasenia= ''; 
                    self.cliente.contrasenia2= '';
                    self.cliente.nombre= '';
                    self.cliente.apellido= '';
                    self.cliente.tipoDoc=-1;
                    self.cliente.nroDoc='';
                    self.cliente.clienteValido= true;
                    this.tiposDoc.selectedOption = 0;
        
    }
    
    
    this.createCliente = function()
    {
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
        
        
        //Limpio el objeto.
        /*self.cliente = { 
                    id: -3,
                    tipo: 'C',
                    existeDni:false,
                    existe:false,
                    existeEmail:false,
                    usuario: '', 
                    eMail: '',
                    contrasenia: '', 
                    contrasenia2: '' ,
                    nombre: '',
                    apellido: '',
                    tipoDoc:-1,
                    nroDoc:''
                  };*/
        
        //self.limpiarForm(document.getElementsByName('frmDatosUsuario'));
        $('#registracionModal').modal('hide');
    }
    
   
});