var resergolApp = angular.module("resergolApp");

resergolApp.controller("AdministrarComplejoController", function($scope, $state, DueniosComplejosService, DiasServices, DocumentosService, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DueniosService){

var self = this;
this.tiposDoc = [];
this.provincias = [];
this.localidades = [];
this.dias = [];
this.provinciaSeleccionada = {IdProvincia: '-1', Nombre: 'Otra'} ;
this.localidadSeleccionada = {IdLocalidad: '-1', Nombre: 'Otra'} ;
//this.superficies = []; 
this.Complejo = { 

        idDuenio: sessionStorage.id,        //duenio
        tipoDuenio: 'D',                    //duenio
        usuario: sessionStorage.usuario,    //duenio
        emailDuenio: '',                    //duenio
        contrasenia: sessionStorage.pass,   //duenio
        contrasenia2: sessionStorage.pass,  //duenio
        nombreDuenio: '',                   //duenio
        apellidoDuenio: '',                 //duenio
        idTipoDoc:0,                        //duenio
        nroDoc:'',                          //duenio
        existeDni:false,                    //duenio
        existe:false,                       //duenio
        existeMail: false,                  //duenio
        contraseniasIguales: true,          //duenio
        diasComplejo: [],                   //diasComplejo
        calle: '',                          //complejoDireccion
        altura: '',                         //complejoDireccion
        idProv:0,                           //complejoDireccion
        idLoc:0,                            //complejoDireccion
        X: 0,                               //complejoDireccion
        Y: 0,                               //complejoDireccion
        idComplejo: sessionStorage.idComplejo,  //Complejo
        nombreComplejo: '',                     //Complejo
        descripcionComplejo: '',                //Complejo
        estacionamiento: 0,                     //Complejo
        buffet: 0,                              //Complejo
        duchas: 0,                              //Complejo
        parrilla: 0,                            //Complejo
        wifi: 0,                                //Complejo
        horaCobroLuz:0,                         //Complejo
        porcentajeLuz:0,                        //Complejo
        porcentajeSenia:0,                      //Complejo
        horasCancelacion:0,                     //Complejo
        tiempoReserva:0,                        //Complejo
        emailComplejo: '',                      //Complejo
        idEstadoComplejo: -1,                   //Complejo
        nroCelular: '',                         //Complejo
        nroTelefono: '',                        //Complejo
        imagenes: []                            //ComplejoImagenes
        
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

DueniosService.query().$promise.then(function(data){
    self.Duenio = data;
});

DiasServices.query().$promise.then(function(data){
    self.dias.dia = data;
    
    self.dias.dia.splice(0, 0, {idDia: '-1', Nombre: '-Dia-'});
});
    
this.traerDatosComplejos = function(){
    
        DueniosComplejosService.query({idDuenio: self.Complejo.idDuenio}).$promise.then(function(data){
            self.Complejo.apellidoDuenio = data[0].Apellido;
            self.Complejo.nombreDuenio = data[0].Nombre;
            self.Complejo.nombreComplejo = data[0].nombreComplejo;
            self.Complejo.nroDoc = parseInt(data[0].NroDoc);
            self.Complejo.emailDuenio = data[0].Email;
            self.Complejo.idTipoDoc = data[0].IdTipoDoc;
            self.Complejo.usuario = data[0].Usuario;
            self.Complejo.contrasenia = data[0].Contrasenia;
            self.Complejo.contrasenia2 = data[0].Contrasenia;
            self.Complejo.nroTelefono = data[0].NroTelef;
            self.Complejo.calle = data[0].Calle;
            self.Complejo.altura = parseInt(data[0].Altura);
            self.Complejo.idLoc = data[0].IdLocalidad;
            self.Complejo.idProv = data[0].IdProvincia;
            //self.localidades.selectedOption = {IdLocalidad: self.Complejo.idLoc}; 
            //self.provincias.selectedOption = {IdProvincia: self.Complejo.idProv};
        });
};
    
self.traerDatosComplejos();    

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

////////////////////////////******************************/////////////////////////////
//se busca la provincias y las localidades de la misma
ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        
        angular.forEach(self.provincias.prov, function(aux) {
             if(aux.IdProvincia == self.Complejo.idProv)    
             {
                 console.log('te entro');
                 self.provinciaSeleccionada.IdProvincia = aux.IdProvincia;
                 self.provinciaSeleccionada.Nombre = aux.Nombre;
             }
          });
    
        self.getLocalidades();
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        //self.provincias.prov.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Provincia-'});
    }); 
    
this.getLocalidades = function(){
    var idProv = self.provinciaSeleccionada.IdProvincia;//self.provincias.selectedProv.IdProvincia;
    console.log("Id de la provincia en getLocalidades: " + idProv)
    if(idProv != -1 && idProv != undefined){
        LocalidadesService.query({id:idProv}).$promise.then(function(data) {
            self.localidades.loc = data;
            
            angular.forEach(self.localidades.loc, function(aux) {
                 if(aux.IdLocalidad == self.Complejo.idLoc)    
                 {
                     console.log('te entro la localidad');
                     self.localidadSeleccionada.IdLocalidad = aux.IdLocalidad;
                     self.localidadSeleccionada.Nombre = aux.Nombre;
                }
            });
        
            self.localidades.selectedOption = {IdLocalidad: self.localidadSeleccionada.IdLocalidad, Nombre:self.localidadSeleccionada.Nombre}; 
            //self.provincias.selectedOption = {IdProvincia: '1', Nombre: 'Buenos Aires'};
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
    
////////////////////////////******************************/////////////////////////////
    
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