var app = angular.module("resergolApp");

app.controller("DueniosController", function(DueniosService, DocumentosService, ProvinciasService, LocalidadesService){
    
    var self = this;
    this.tiposDoc =[];
    this.provincias = [];
    this.localidades = [];
   
    this.mensajeBienvenida = 'En Resergol te damos la posibilidad de llegar a todos los jugadores del fútbol amateur de manera gratuita. Sólo tenés que completar los siguientes datos y te mandaremos un  e-mail como aviso para que puedas registrar tu complejo!';
    
    this.tiposDoc = {
        tipos: [],
        selectedOption: {IdTipoDoc: '-3', Descripcion: 'Tipo doc.'} //This sets the default value of the select in the ui
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
        self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
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
	
   
    this.duenio = { 
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
                    nroCalle:''
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
       alert("usuario: " + self.duenio.usuario
             + '\n' + "eMail: " + self.duenio.email
             + '\n'+ "contrasenia: " + self.duenio.contrasenia
             + '\n'+ "contrasenia2: " + self.duenio.contrasenia2
             + '\n'+ "nombre: " + self.duenio.nombre
             + '\n'+ "apellido: " + self.duenio.apellido
             + '\n'+ "tipoDoc: " + self.tiposDoc.selectedOption.IdTipoDoc
             + '\n'+ "nroDoc: " + self.duenio.nroDoc
             + '\n'+ "nombreComplejo: " + self.duenio.nombreComplejo
             + '\n'+ "NroTelef: " + self.duenio.NroTelef
             + '\n'+ "prov: " + self.provincias.selectedProv.IdProvincia
             + '\n'+ "loc: " + self.localidades.selectedOption.IdLocalidad
             + '\n'+ "direccion: " + self.duenio.direccion
             + '\n'+ "nroCalle: " + self.duenio.nroCalle
            
            ); 
  
   };
   
    
   this.createDuenio = function()
   {
     
     
       
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