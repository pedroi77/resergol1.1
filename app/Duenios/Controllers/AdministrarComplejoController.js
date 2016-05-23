var resergolApp = angular.module("resergolApp");

resergolApp.controller("AdministrarComplejoController", function($scope, $state, DocumentosService, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DueniosService){

var self = this;
this.tiposDoc = [];
this.provincias = [];
this.localidades = [];
//this.superficies = []; 
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
    
self.provincias = {
        prov: [],
        //selectedOption:{IdProvincia: '-1', Nombre: '-Provincia-'} 
        selectedOption:{IdProvincia: '1', Nombre: '-Buenos Aires-'} 
    }; 
     
self.localidades = {
    loc: [],
    selectedOption:{IdLocalidad: '-1', Nombre: '-Localidad-'} 
};
    
self.superficies = {
    sup: [],
    selectedOption:{IdSuperficie: '-1', Descripcion: '-Superficie-'} 
};
    
this.tiposDoc = {
    tipos: [],
    selectedOption: {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'} //This sets the default value of the select in the ui
}; 
    
self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
    
ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        self.provincias.prov.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Provincia-'});
    }); 

DueniosService.query().$promise.then(function(data){
    self.Duenio = data;
});

   
this.getLocalidades = function(){
        var idProv = self.provincias.selectedProv.IdProvincia;
        
        if(idProv != -1 && idProv != undefined){
            LocalidadesService.query({id:idProv}).$promise.then(function(data) {
                self.localidades.loc = data;
                var idSel =  self.localidades.loc[0].IdLocalidad;
                var nomSel = self.localidades.loc[0].Nombre;
                self.localidades.selectedOption = {IdLocalidad: idSel, Nombre:nomSel}; 
                self.provincias.selectedOption = {IdProvincia: '1', Nombre: 'Buenos Aires'};
            });
        }
        else{
            self.localidades.loc = [];
            //self.localidades.loc.push({IdLocalidad: '-1', Nombre: 'Localidad'});  
            //self.localidades.selectedOption = {IdLocalidad: '-1', Nombre: 'Localidad'}; 
            self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
            self.localidades.selectedOption = {IdLocalidad: '-1', Nombre:'-Localidad-'}; 
            self.provincias.selectedOption = {IdProvincia: '1', Nombre: 'Buenos Aires'};
        };
        
    };    

DocumentosService.query().$promise.then(function(data) {
    self.tiposDoc.tipos = data;
    //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
    self.tiposDoc.tipos.splice(0, 0, {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'});
});
    
TiposSuperficiesService.query().$promise.then(function(data) {
        self.superficies.sup = data;
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        self.superficies.sup.splice(0, 0, {IdSuperficie: '-1', Descripcion: '-Superficie-'});
    });

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
    
    this.getDuenio = function(){
        DueniosService.query({user:sessionStorage.usuario, pass:sessionStorage.pass}).$promise.then(function(data){
            duenio = {};
            duenio = data;       

            if(duenio[0] != '-1'){
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.contrasenia = duenio[0].Contrasenia;
                self.Duenio.direccion = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                self.Duenio.apellido = duenio[0].Apellido;
                
                
                //self.Usuario.passInvalida = false;
                //self.Usuario.login = true;
                //store.set('token',  duenio[1]);
            }
            else{
                self.Usuario.login = false;
                self.Usuario.passInvalida = true;
            }
        });
    };
    
});