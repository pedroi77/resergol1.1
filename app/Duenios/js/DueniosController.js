var app = angular.module("resergolApp");

app.controller("DueniosController", function(UsuarioService, DueniosService, DocumentosService, ProvinciasService, LocalidadesService, $scope, $resource){
    
    var self = this;
    this.tiposDoc =[];
    this.provincias = [];
    this.localidades = [];
    $scope.formData = {};
    
    this.Duenio = { 
            
            id: -3,
            tipo: 'D',
            usuario: '', 
            email: '',
            contrasenia: '', 
            contrasenia2: '' ,
            nombre: '',
            apellido: '',
            idTipoDoc:0,
            nroDoc:'',
            nombreComplejo: '',
            NroTelef:'',
            idProv:0,
            idLoc:0,
            direccion:'',
            nroCalle:'',
            existeDni:false,
            existe:false
      };
   
    this.mensajeBienvenida = 'En Resergol te damos la posibilidad de llegar a todos los jugadores del fútbol amateur de manera gratuita. Sólo tenés que completar los siguientes datos y te mandaremos un  e-mail como aviso para que puedas registrar tu complejo!';
    
    /* scope que controla las restricciones del formulario del registro de dueño */
    $scope.submitForm = function (formData) {
    alert('Form submitted with' + JSON.stringify(formData));
    };
    
    this.tiposDoc = {
        tipos: [],
        selectedOption: {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'} //This sets the default value of the select in the ui
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
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        self.tiposDoc.tipos.splice(0, 0, {TipoDoc: '-3', Descripcion: '-Tipo doc.-'});
    });
    
    ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        self.provincias.prov.push({IdProvincia: '-1', Nombre: 'Provincia'}); //Valor por defecto
    });
 
    self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'}); 
    
    
    this.getLocalidades = function(){
        var idProv = self.provincias.selectedProv.IdProvincia;
        
        if(idProv != -1){
            LocalidadesService.query({id:idProv}).$promise.then(function(data) {
                self.localidades.loc = data;
                var idSel =  self.localidades.loc[0].IdLocalidad;
                var nomSel = self.localidades.loc[0].Nombre;
                self.localidades.selectedOption = {IdLocalidad: idSel, Nombre:nomSel}; 
            });
        }
        else{
            self.localidades.loc = [];
            self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'});  
            self.localidades.selectedOption = {IdLocalidad: '-1', Nombre: 'Localidad'}; 
        };
        
    };
    
    /* ejemplo para post
    {
	"usuario": "TANQUE",
	"contrasenia": "7444",
	"nombre": "diego",
	"apellido": "forlan",
	"idTipoDoc": 1,
	"nroDoc": 23399135,
	"email": "test@gmail.com",
	"nombreComplejo": "amigos",
	"NroTelef": "42852221",
	"idProv": 1,
	"idLoc": 2,
	"direccion": "lavalle",
	"nroCalle": 1544,
	"valor": -5
}
  
    */
   
    
   this.mostrarDatos = function()
   {
       alert("usuario: " + self.Duenio.usuario
             + '\n' + "email: " + self.Duenio.email
             + '\n'+ "contrasenia: " + self.Duenio.contrasenia
             + '\n'+ "contrasenia2: " + self.Duenio.contrasenia2
             + '\n'+ "nombre: " + self.Duenio.nombre
             + '\n'+ "apellido: " + self.Duenio.apellido
             + '\n'+ "tipoDoc: " + self.tiposDoc.selectedOption.IdTipoDoc
             + '\n'+ "nroDoc: " + self.Duenio.nroDoc
             + '\n'+ "nombreComplejo: " + self.Duenio.nombreComplejo
             + '\n'+ "NroTelef: " + self.Duenio.NroTelef
             + '\n'+ "prov: " + self.provincias.selectedProv.IdProvincia
             + '\n'+ "loc: " + self.localidades.selectedOption.IdLocalidad
             + '\n'+ "direccion: " + self.Duenio.direccion
             + '\n'+ "nroCalle: " + self.Duenio.nroCalle
            
            ); 
  
   };
    
    this.existeUsuario = function(){
        if(self.Duenio.usuario!=undefined){
            
            UsuarioService.query({user:self.Duenio.usuario}).$promise.then(function(data){
                self.Duenio.id =  data[0].id;                                                         
                self.Duenio.tipo  = data[0].tipo;    
                
                if(self.Duenio.id > -1){
                    self.Duenio.existe = true;
                    console.log(self.Duenio.existe + " - "  + self.Duenio.tipo + " - " + self.Duenio.usuario);
                    
                }
                else{
                    self.Duenio.existe = false;
                    console.log(self.Duenio.existe + " - "  + self.Duenio.tipo + " - " + self.Duenio.usuario);
                }
            });
            
            
        }

    };
    
    //Preguntar si esto se hace asi
    this.existeDni = function(){
        console.log(self.Duenio.nroDoc);
        self.Duenio.idTipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
        
        if(self.Duenio.nroDoc!=undefined){
            DocumentosService.query({tipoDoc:self.Duenio.idTipoDoc, nroDoc:self.Duenio.nroDoc, tipoUsu:self.Duenio.tipo}).$promise.then(function(data){

                var valor = data[0].valor;

                console.log('nroDoc: ' +self.Duenio.nroDoc + ' tipoDoc: ' + self.Duenio.idTipoDoc + ' tipo: ' +self.Duenio.tipo );
                
                console.log('valor: ' + valor);
                
                if(self.Duenio.id > -1){
                    self.Duenio.existeDni = true;
                    console.log(self.Duenio.existeDni);
                }
                else{
                    self.Duenio.existeDni = false;
                    console.log(self.Duenio.existeDni);
                }
            });
        }
        
    };
    
    this.validarDatosDuenio = function()
    {
        /*var mensaje = 'Se han encontrado los siguientes errores: \n\n';
        var codeMessage = 0;
        
        if(self.duenio.usuario.length == 0)
        {
            mensaje += "No se ha especificado el usuario! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.usuario.length > 25)
        {
            mensaje += "El usuario no puede tener mas de 25 caracteres! \n";
            codeMessage = 1;
        }
            
        
        if(self.duenio.email.length == 0)
        {
            mensaje += "No se ha especificado el mail! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.contrasenia.length == 0)
        {
            mensaje += "No se ha especificado la contraseña! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.contrasenia.length > 12)
        {
            mensaje += "La contraseña no puede tener mas de 12 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.contrasenia2.length == 0)
        {
            mensaje += "No se introdujo nuevamente la contraseña! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.contrasenia2.length > 12)
        {
            mensaje += "La contraseña no puede tener mas de 12 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.nombre.length == 0)
        {
            mensaje += "No se ha especificado el nombre! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.nombre.length > 60)
        {
            mensaje += "El nombre no puede tener mas de 60 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.apellido.length == 0)
        {
            mensaje += "No se ha especificado el apellido! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.apellido.length > 60)
        {
            mensaje += "El apellido no puede tener mas de 60 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.tiposDoc.selectedOption.IdTipoDoc <= 0)
        {
            mensaje += "No se ha especificado el Tipo de Documento! \n";
            codeMessage = 1;
        }
        
        
        if(self.duenio.nroDoc.length == 0)
        {
            mensaje += "No se ha especificado su número de documento! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.nroDoc.length == 0)
        {
            mensaje += "El número de documento no puede tener mas de 10 caracteres! \n";
            codeMessage = 1;
        }
        
        
        if(self.duenio.nombreComplejo.length == 0)
        {
            mensaje += "No se ha especificado el nombre de complejo! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.nombreComplejo.length > 60)
        {
            mensaje += "El nombre del complejo no puede tener mas de 60 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.NroTelef.length == 0)
        {
            mensaje += "No se ha especificado el nombre de complejo! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.NroTelef.length == 0)
        {
            mensaje += "El numero de telefono no puede tener mas de 15 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.provincias.selectedProv.IdProvincia <= 0)
        {
            mensaje += "No se ha especificado la provincia! \n";
            codeMessage = 1;
        }
        
        if(self.localidades.selectedOption.IdLocalidad <= 0)
        {
            mensaje += "No se ha especificado la localidad! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.direccion.length == 0)
        {
            mensaje += "No se ha especificado la dirección del complejo! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.direccion.length > 40)
        {
            mensaje += "La dirección no puede tener mas de 40 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.nroCalle.length == 0)
        {
            mensaje += "No se ha especificado la calle del complejo! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.nroCalle.length > 5)
        {
            mensaje += "El numero de calle no puede tener mas de 5 caracteres! \n";
            codeMessage = 1;
        }
        
        if(self.duenio.contrasenia.length > 0 && self.duenio.contrasenia2.length > 0)
        {
            
            if(self.duenio.contrasenia != self.duenio.contrasenia2)
            {
                mensaje += "Las contraseñas no coinciden! \n";
                codeMessage = 1;
            }
        }*/
        
        /*if(codeMessage == 1)
            alert(mensaje);
        else
        {
            
        }*/
        
        //aca guarda el dueño
        this.createDuenio();
    };
   
    /*De mati
   this.createDuenio = function()
   {
     
        self.duenio.IdTipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
        self.duenio.idProv = self.provincias.selectedProv.IdProvincia;
        self.duenio.idLoc = self.localidades.selectedOption.IdLocalidad;
        var connection = $resource("http://localhost/resergol1.1/api/duenios/", {}, {save: {method: 'POST'}})
        
        /*var params = {'usuario': self.duenio.usuario, 'contrasenia': self.duenio.contrasenia, 'nombre': self.duenio.nombre,
                  'apellido': self.duenio.apellido, 'idTipoDoc': self.duenio.IdTipoDoc, 'nroDoc': self.duenio.nroDoc,
                    'email': self.duenio.email, 'nombreComplejo': self.duenio.nombreComplejo, 'NroTelef': self.duenio.NroTelef, 'idProv': self.duenio.idProv, 'idLoc': self.duenio.idLoc, 'direccion': self.duenio.direccion, 'nroCalle': self.duenio.nroCalle};
                    /*
        
        var params = {"usuario": "TANQUE77",
                        "contrasenia": "7444",
                        "nombre": "diego",
                        "apellido": "forlan",
                        "idTipoDoc": 1,
                        "nroDoc": 34525121,
                        "email": "4114234@gmail.com",
                        "nombreComplejo": "amigos",
                        "NroTelef": "42852221",
                        "idProv": 1,
                        "idLoc": 2,
                        "direccion": "lavalle",
                        "nroCalle": 1544,
                        "valor": -5};
       
        
        entry = new DueniosService(); //You can instantiate resource class
       
        entry.data = params;
        console.log(entry.data);
        DueniosService.save(entry, function() {
        });
        
        //var results = connection.save(params);
       
        //var results = DueniosService.save(params);
       

   };
  */
               
    this.createDuenio = function(){
       
        self.mostrarDatos();
        var duenioNuevo = new DueniosService();
        self.Duenio.idProv = self.provincias.selectedProv.IdProvincia;
        self.Duenio.idTipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
        self.Duenio.idLoc = self.localidades.selectedOption.IdLocalidad;
        
        duenioNuevo.data = {
                        "usuario": self.Duenio.usuario,
                        "contrasenia": self.Duenio.contrasenia,
                        "nombre": self.Duenio.nombre,
                        "apellido": self.Duenio.apellido,
                        "idTipoDoc": self.Duenio.idTipoDoc,
                        "nroDoc": self.Duenio.nroDoc,
                        "email": self.Duenio.email,
                        "nombreComplejo": self.Duenio.nombreComplejo,
                        "NroTelef": self.Duenio.NroTelef,
                        "idProv": self.Duenio.idProv,
                        "idLoc": self.Duenio.idLoc,
                        "direccion": self.Duenio.direccion,
                        "nroCalle": self.Duenio.nroCalle,
                        "valor": -5
  	       };    
 
        //console.log(duenioNuevo.data);

         DueniosService.save(duenioNuevo.data, function(reponse){
            alert("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
          },function(errorResponse){
              console.log(errorResponse.data.message);  
         });
       
        $('#registracionDuenioModal').modal('hide');
     };
   
});

