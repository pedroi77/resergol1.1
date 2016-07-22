var app = angular.module("resergolApp");

app.controller("DueniosController", function(UsuarioService, DueniosService, DocumentosService, ProvinciasService, LocalidadesService, EmailService, TipoYDocumentosService, $scope, $resource){
    
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
            existe:false,
            existeMail: false,
            contraseniasIguales: true
      };
   
    this.mensajeBienvenida = 'En Resergol te damos la posibilidad de llegar a todos los jugadores del fútbol amateur de manera gratuita. Sólo tenés que completar los siguientes datos y te mandaremos un  e-mail como aviso para que puedas registrar tu complejo!';
    
    
    
    this.mayusculas = function(){
        self.Duenio.usuario = self.Duenio.usuario.toUpperCase();
    };
    
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
        self.tiposDoc.tipos.splice(0, 0, {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'});
    });  
    
    ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        self.provincias.prov.push({IdProvincia: '-1', Nombre: 'Provincia'}); //Valor por defecto
        //self.provincias.prov.splice(0, 0, {IdProvincia: '-1', Nombre: '-Provincia-'});
    });
 
    //self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'}); 
    self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
    
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
    
    this.sinEspacios = function(cadena){
        var aux = cadena.split(" ");
        var salida = "";
        angular.forEach(aux, function(palabra){
           salida = salida + palabra.trim()
        })
        
        return salida.toString();
    };
    
    this.existeUsuario = function(){
        
        
        if(self.Duenio.usuario!=undefined){
            
            self.Duenio.usuario = self.sinEspacios(self.Duenio.usuario.trim());
            
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
            TipoYDocumentosService.query({tipoDoc:self.Duenio.idTipoDoc, nroDoc:self.Duenio.nroDoc, tipoUsu:self.Duenio.tipo}).$promise.then(function(data){

                var valor = data[0].duenio;
                
                console.log('valor: ' + valor);
                
                if(valor == 1){
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
    
        this.existeEmail = function(){
        
        if(self.Duenio.email!=undefined){
            EmailService.query({email:self.Duenio.email}).$promise.then(function(data){
                  
                alert(data[0].resultado);
                var bExisteEmail = data[0].resultado;                                                             
                if(bExisteEmail == 1){
                    self.Duenio.existeMail = true;
                    console.log(self.Duenio.existeMail);
                    
                }
                else{
                    self.Duenio.existeMail = false;
                    console.log(self.Duenio.existeMail);
                }
            });
            
        }

    };
               
    this.createDuenio = function(){
       
        //self.mostrarDatos();
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
            //console.("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
             $('#registracionDuenioModal').modal('hide');
             $('#mensajeBienvenida').modal('show');
          },function(errorResponse){
              console.log(errorResponse.data.message);  
         });
        
        //self.blanquearDatos();
        //document.getElementById("registracionDuenioModal").();
     };
    
    this.limpiarForm = function(form){
        
            form.$setPristine();
            self.Duenio.id= -3,
            self.Duenio.tipo= 'D',
            self.Duenio.usuario= '', 
            self.Duenio.email= '',
            self.Duenio.contrasenia= '', 
            self.Duenio.contrasenia2= '' ,
            self.Duenio.nombre= '',
            self.Duenio.apellido= '',
            self.Duenio.idTipoDoc=0,
            self.Duenio.nroDoc='',
            self.Duenio.nombreComplejo= '',
            self.Duenio.NroTelef='',
            self.Duenio.idProv=0,
            self.Duenio.idLoc=0,
            self.Duenio.direccion='',
            self.Duenio.nroCalle='',
            self.Duenio.existeDni=false,
            self.Duenio.existe=false,
            self.Duenio.existeMail= false
        
    };
    
    this.validarContrasenias = function(){
        
        console.log("1:" + self.Duenio.contrasenia + "2:" + self.Duenio.contrasenia2);
        
        if(self.Duenio.contrasenia.length > 0 && self.Duenio.contrasenia2.length > 0)
        {
            console.log("1:" + self.Duenio.contrasenia + "2:" + self.Duenio.contrasenia2);
            if(self.Duenio.contrasenia == self.Duenio.contrasenia2)
            {
                self.Duenio.contraseniasIguales = true;
            }
            else
            {
                self.Duenio.contraseniasIguales = false;
            }   
        }
    };
    
    this.duenioValido = function(){
      
        //console.log('tipo doc-->' + self.cliente.tipoDoc);
        if(!self.Duenio.existe && !self.Duenio.existeDni && !self.Duenio.existeMail
          && self.Duenio.contraseniasIguales && self.Duenio.tipoDoc > 0 && self.Duenio.idProv > 0 && self.Duenio.idLoc > 0)
        {
            return true;
        }
        else
        {
                return false;
        }
    };
    
    this.enviarMail = function(){
        
        var emailFrom = "reserGol@localhost.com";
        var emailTo = "matiasfumacoo@gmail.com";
        var mensaje = "Se ha registrado un nuevo dueño!. \nUsuario" + "usuario: " + self.Duenio.usuario
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
             + '\n'+ "nroCalle: " + self.Duenio.nroCalle;
    };
   
});



