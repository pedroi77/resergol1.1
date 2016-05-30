var resergolApp = angular.module("resergolApp");

resergolApp.controller("AdministrarComplejoController", function($scope, $state, DueniosComplejosService, DiasServices, DocumentosService, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DueniosService){

var self = this;
this.tiposDoc = [];
this.provincias = [];
this.localidades = [];
this.dias = [];
//this.superficies = []; 
this.Duenio = { 

        idDuenio: sessionStorage.id,
        tipo: 'D',
        usuario: sessionStorage.usuario,
        email: '',
        contrasenia: sessionStorage.pass,
        contrasenia2: sessionStorage.pass,
        nombre: '',
        apellido: '',
        idTipoDoc:0,
        nroDoc:'',
        existeDni:false,
        existe:false,
        existeMail: false,
        contraseniasIguales: true
  };

this.horasDesde = [
          { id: 8, desc: '08:00 hs.'},
          { id: 9, desc: '09:00 hs.'},
          { id: 10, desc: '10:00 hs.' },
          { id: 11, desc: '11:00 hs.' },
          { id: 12, desc: '12:00 hs.' },
          { id: 13, desc: '13:00 hs.' },
          { id: 14, desc: '14:00 hs.' },
          { id: 15, desc: '15:00 hs.' },
          { id: 16, desc: '16:00 hs.' },
          { id: 17, desc: '17:00 hs.' },
          { id: 18, desc: '18:00 hs.' },
          { id: 19, desc: '19:00 hs.' },
          { id: 20, desc: '20:00 hs.' },
          { id: 21, desc: '21:00 hs.' },
          { id: 22, desc: '22:00 hs.' },
          { id: 23, desc: '23:00 hs.' }
      ];
    
this.horasHasta = [
          
          { id: 9, desc: '09:00 hs.'},
          { id: 10, desc: '10:00 hs.' },
          { id: 11, desc: '11:00 hs.' },
          { id: 12, desc: '12:00 hs.' },
          { id: 13, desc: '13:00 hs.' },
          { id: 14, desc: '14:00 hs.' },
          { id: 15, desc: '15:00 hs.' },
          { id: 16, desc: '16:00 hs.' },
          { id: 17, desc: '17:00 hs.' },
          { id: 18, desc: '18:00 hs.' },
          { id: 19, desc: '19:00 hs.' },
          { id: 20, desc: '20:00 hs.' },
          { id: 21, desc: '21:00 hs.' },
          { id: 22, desc: '22:00 hs.' },
          { id: 23, desc: '23:00 hs.' },
          { id: 24, desc: '00:00 hs.' }
      ];
    
$scope.selectedHoraIdDesde = 8;
$scope.selectedHoraIdHasta = $scope.selectedHoraIdDesde + 1;
    
$scope.diasComplejo = [{
    
    'diaDesde': '' ,
    'diaHasta': '',
    'horaDesde': '',
    'horaHasta': '',
}];
    
this.horasComplejo ={
    
    horaDesde: 0,
    horaHasta: 0
    
};
    
this.telefonosComplejo = {
    
    nroCelular: 0,
    nroTelefono: 0
    
};
    
this.Complejo = {
    
    idComplejo: sessionStorage.idComplejo,
    nombre: '',
    descripcion: '',
    estacionamiento: 0,
    buffet: 0,
    duchas: 0,
    parrilla: 0,
    wifi: 0,
    horaCobroLuz:0,
    porcentajeLuz:0,
    porcentajeSenia:0,
    horasCancelacion:0,
    tiempoReserva:0,
    email: '',
    idEstado: -1,
    idDuenio: -1 
};
    
this.complejoDireccion = {
    
    calle: '',
    altura: 0,
    idProv:0,
    idLoc:0,
    X: 0,
    Y: 0
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
    
this.dias = {
    dia: [],
    selectedOption: {idDia: '-1', Nombre: '-Dia-'} 
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

DiasServices.query().$promise.then(function(data){
    self.dias.dia = data;
    
    self.dias.dia.splice(0, 0, {idDia: '-1', Nombre: '-Dia-'});
});
    
this.traerDatosComplejos = function(){
    
    DueniosComplejosService.query({idDuenio: self.Duenio.idDuenio}).$promise.then(function(data){
            self.Duenio.apellido = data[0].Apellido;
            self.Duenio.nombre = data[0].Nombre;
            self.Complejo.nombre = data[0].nombreComplejo;
            self.Duenio.nroDoc = data[0].NroDoc;
            self.Duenio.email = data[0].Email;
            self.Duenio.idTipoDoc = data[0].IdTipoDoc;
            self.Duenio.usuario = data[0].Usuario;
            self.Duenio.contrasenia = data[0].Contrasenia;
            self.Duenio.contrasenia2 = data[0].Contrasenia;
            self.telefonosComplejo.nroTelefono = data[0].NroTelef;
            self.complejoDireccion.calle = data[0].Calle;
            self.complejoDireccion.altura = data[0].Altura;
            self.complejoDireccion.idLoc = data[0].IdLocalidad;
            self.complejoDireccion.idProv = data[0].IdProvincia;
        });
};
    
self.traerDatosComplejos();
   
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
                self.Duenio.direccion = duenio[0].direccion;
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
    
    
    $scope.addRow = function(){		
        
        var t = document.getElementById("diaDesde");
        var selectedText = t.options[t.selectedIndex].text;
        $scope.diaDesde = selectedText;
        
        t = document.getElementById("diaHasta");
        selectedText = t.options[t.selectedIndex].text;
        $scope.diaHasta = selectedText;
        
        t = document.getElementById("horaDesde");
        selectedText = t.options[t.selectedIndex].text;
        $scope.horaDesde = selectedText;
        
        t = document.getElementById("horaHasta");
        selectedText = t.options[t.selectedIndex].text;
        $scope.horaHasta = selectedText;
        
        $scope.diasComplejo.push({ 'diaDesde':$scope.diaDesde, 'diaHasta': $scope.diaHasta, 'horaDesde':$scope.horaDesde, 'horaHasta':$scope.horaHasta });
        $scope.diaDesde='';
        $scope.diaHasta='';
        $scope.horaDesde='';
        $scope.horaHasta='';
    };
    
    this.mostrarDatosFila = function()
    {
        var t = document.getElementById("diaDesde");
        var selectedText = t.options[t.selectedIndex].text;
        $scope.diaDesde = selectedText;
        
        t = document.getElementById("diaHasta");
        selectedText = t.options[t.selectedIndex].text;
        $scope.diaHasta = selectedText;
        
        t = document.getElementById("horaDesde");
        selectedText = t.options[t.selectedIndex].text;
        $scope.horaDesde = selectedText;
        
        t = document.getElementById("horaHasta");
        selectedText = t.options[t.selectedIndex].text;
        $scope.horaHasta = selectedText;
        
        alert("Dia desde: " + $scope.diaDesde
             + '\n' + "Dia hasta: " + $scope.diaHasta
             + '\n'+ "Hora desde: " + $scope.horaDesde
             + '\n'+ "Hora Hasta: " + $scope.horaHasta
            
            ); 
    };
    
    //aca tendria que hacer un UPDATE a la tabla de complejos segun el ID del complejo y del usuario
    this.updateComplejo = function()
    {
        var complejoData = new ClientesService();
     
        complejoData.data = {
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
    }
    
    this.cambiaHasta = function(){
        
        self.horasHasta = [];
        for(var i = $scope.selectedHoraIdDesde + 1; i < 25; i++)
        {
            self.horasHasta.push({id: i, desc:  i + ':00 hs.'});
        }
        $scope.selectedHoraIdHasta = $scope.selectedHoraIdDesde + 1;
        console.log('llegue al cambia hasta');
    }
    
    this.validarDatosHorarios = function(){
        
        var t = document.getElementById("diaDesde");
        var selectedText = t.options[t.selectedIndex].text;
        var hayError = 0;
        var mensaje = '';
        
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Dia desde! \n';
            hayError = 1;
        }
        
        t = document.getElementById("diaHasta");
        selectedText = t.options[t.selectedIndex].text;
        
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Dia hasta! \n';
            hayError = 1;
        }
        
        t = document.getElementById("horaDesde");
        selectedText = t.options[t.selectedIndex].text;
        
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Hora desde! \n';
            hayError = 1;
        }
        
        t = document.getElementById("horaHasta");
        selectedText = t.options[t.selectedIndex].text;
        
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Hora hasta!';
            hayError = 1;
        }
        
        if(hayError == 0)
        {
            $scope.addRow();
        }
        else
        {
             alert(mensaje);   
        }
    }
    
    this.validarPorcentajes = function(){
        
        var t = document.getElementById("diaDesde");
        
        
        if(t.length > 3)
        {
            t = 100;
        }
        
    }
    
});