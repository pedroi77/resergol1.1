var resergolApp = angular.module("resergolApp");

resergolApp.controller("AdministrarComplejoController", function($scope, $state, DueniosComplejosService, DiasServices, DocumentosService, ProvinciasService, LocalidadesService, CanchasService, TiposSuperficiesService, DueniosService, AdministrarComplejoService, ComplejosDiasServices, EmailComplejoService, EmailDuenioService,UsuarioService, ComplejoExisteUsuarioDuenioService, $uibModal,  $uibModalStack, MapService){

//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-DECLARACIONES-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
var self = this;
this.tiposDoc = [];
this.provincias = [];
this.localidades = [];
this.dias = [];
this.horaLuz = [];
this.provinciaSeleccionada = {IdProvincia: '-1', Nombre: 'Otra'}; 
this.localidadSeleccionada = {IdLocalidad: '-1', Nombre: 'Otra'};
this.tipoDocSeleccionado = {IdTipoDoc: '-1', Descripcion: 'Otro'};
this.horaLuzSeleccionada = {id: 17, desc: '17:00:00'};
//#endregion
    
    //Mapa INICIO
    $scope.place = {};
    
    $scope.search = function() {
        $scope.apiError = false;
        
        MapService.search($scope.searchPlace)
        .then(
            function(res) { // success
                MapService.addMarker(res);
                $scope.place.name = res.name;
                //$scope.place.lat = res.geometry.location.lat();
                //$scope.place.lng = res.geometry.location.lng();
                self.Complejo.X=  res.geometry.location.lat();
                self.Complejo.Y =res.geometry.location.lng();
                console.log( res.name);
                console.log(self.Complejo.X);
                console.log(self.Complejo.Y);
            },
            function(status) { // error
                $scope.apiError = true;
                $scope.apiStatus = status;
            }
        );
    }
    
    $scope.send = function() {
        alert($scope.place.name + ' : ' + $scope.place.lat + ', ' + $scope.place.lng);    
    }
    
    MapService.init();
    
    this.armarDir = function(){
        $scope.searchPlace = self.Complejo.calle + ' ' + self.Complejo.altura + ' ' + self.localidadSeleccionada.Nombre + ' ' + self.provinciaSeleccionada.Nombre ;
    };
    //Mapa FIN

this.Complejo = { 

        idDuenio: sessionStorage.id,            //duenio
        tipoDuenio: 'D',                        //duenio
        usuario: sessionStorage.usuario,        //duenio
        emailDuenio: '',                        //duenio
        contrasenia: sessionStorage.pass,       //duenio
        contrasenia2: sessionStorage.pass,      //duenio
        nombreDuenio: '',                       //duenio
        apellidoDuenio: '',                     //duenio
        idTipoDoc:0,                            //duenio
        nroDoc:'',                              //duenio
        existeDni:false,                        //duenio
        existeUsuario:false,                    //duenio
        existeMailDuenio: false,                //duenio
        contraseniasIguales: true,              //duenio
        estadoDuenio:3,                         //duenio
        idPersona: 0,                           //duenio
        diasComplejo: [],                       //diasComplejo
        calle: '',                              //complejoDireccion
        altura: '',                             //complejoDireccion
        idProv:0,                               //complejoDireccion
        idLoc:0,                                //complejoDireccion
        X: 0,                                   //complejoDireccion
        Y: 0,                                   //complejoDireccion
        existeMailComplejo: false,              //Complejo
        idComplejo: sessionStorage.idComplejo,  //Complejo
        nombreComplejo: '',                     //Complejo
        descripcionComplejo: '',                //Complejo
        estacionamiento: 0,                     //Complejo
        buffet: 0,                              //Complejo
        duchas: 0,                              //Complejo
        parrilla: 0,                            //Complejo
        wifi: 0,                                //Complejo
        horaCobroLuz:'',                         //Complejo
        porcentajeLuz:0,                        //Complejo
        porcentajeSenia:0,                      //Complejo
        horasCancelacion:0,                     //Complejo
        tiempoReserva:0,                        //Complejo
        emailComplejo: '',                      //Complejo
        idEstadoComplejo: 1,                    //Complejo
        nroCelular: '',                         //Complejo
        nroTelefono: '',                        //Complejo
        imagenes: [],                           //ComplejoImagenes
        CBU: '',                                //ComplejoPagos
        nroCuenta: ''                           //ComplejoPagos
        
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
    'idHoraDesde': 0,
    'idHotaHasta': 0
}];
    
this.horasComplejo ={
    
    horaDesde: 0,
    horaHasta: 0
    
};
    
self.horaLuz = {
    
    hora: [
            { id: 17, desc: '17:00 hs.' },
            { id: 18, desc: '18:00 hs.' },
            { id: 19, desc: '19:00 hs.' },
            { id: 20, desc: '20:00 hs.' },
            { id: 21, desc: '21:00 hs.' },
            { id: 22, desc: '22:00 hs.' },
            { id: 23, desc: '23:00 hs.' }
      ],
    selectedOption:{id: 17, desc: '17:00 hs.'}
};
    
self.provincias = {
        prov: [],
        //selectedOption:{IdProvincia: '-1', Nombre: '-Provincia-'} 
        selectedOption:{IdProvincia: '-1', Nombre: '-Provincia-'} 
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
    selectedOption: {idDia:'' , Nombre:''} 
}; 
    
self.localidades.loc.splice(0, 0, {IdLocalidad: '-1', Nombre: '-Localidad-'});
    
//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-FUNCIONES-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
    
this.traerDatosComplejos = function(){

    DueniosComplejosService.query({idDuenio: self.Complejo.idDuenio}).$promise.then(function(data){

        //datos si el dueño es aceptado
        self.Complejo.apellidoDuenio = data[0].Apellido;
        self.Complejo.nombreDuenio = data[0].NombrePersona;
        self.Complejo.nombreComplejo = data[0].NombreComplejo;
        self.Complejo.nroDoc = parseInt(data[0].NroDoc);
        self.Complejo.emailDuenio = data[0].EmailPersona;
        self.Complejo.idTipoDoc = data[0].IdTipoDoc;
        self.Complejo.usuario = data[0].Usuario;
        self.Complejo.contrasenia = data[0].Contrasenia;
        self.Complejo.contrasenia2 = data[0].Contrasenia;
        self.Complejo.nroTelefono = parseInt(data[0].nroTelefono);
        self.Complejo.calle = data[0].Calle;
        self.Complejo.altura = parseInt(data[0].Altura);
        self.Complejo.idLoc = data[0].IdLocalidad;
        self.Complejo.idProv = data[0].IdProvincia;
        self.Complejo.estadoDuenio = data[0].estadoDuenio;
        self.Complejo.idPersona = data[0].IdPersona;

        //console.log("Descripcion: " + data[0].Descripcion.length);
        //datos si el dueño es activo
        if(data[0].estadoDuenio == 3){

            self.Complejo.descripcionComplejo = data[0].Descripcion;
            self.Complejo.estacionamiento = data[0].Estacionamiento;
            if(self.Complejo.estacionamiento == 1)
                document.getElementById("estacionamiento").checked = true;

            self.Complejo.buffet = data[0].Buffet;
            if(self.Complejo.buffet == 1)
                document.getElementById("buffet").checked = true;

            self.Complejo.duchas = data[0].Duchas;
            if(self.Complejo.duchas == 1)
                document.getElementById("duchas").checked = true;

            self.Complejo.parrilla = data[0].Parrillas;
            if(self.Complejo.parrilla == 1)
                document.getElementById("parrilla").checked = true;

            self.Complejo.wifi = data[0].WiFi;
            if(self.Complejo.wifi == 1)
                document.getElementById("wifi").checked = true;

            //,com.HoraCobroLuz*/
            self.Complejo.horaCobroLuz = data[0].HoraCobroLuz;
            self.Complejo.porcentajeSenia = parseInt(data[0].PorcentajeSeña);
            self.Complejo.horasCancelacion = parseInt(data[0].HorasCancelacion);
            //,com.TiempoReserva
            self.Complejo.emailComplejo = data[0].EmailComplejo;
            self.Complejo.porcentajeLuz = parseInt(data[0].PorcentajeLuz);
            self.Complejo.nroCelular = parseInt(data[0].nroCelular);
            self.Complejo.CBU = parseInt(data[0].CBU);
            self.Complejo.nroCuenta = parseInt(data[0].NroCuenta);
            self.Complejo.X = data[0].X;
            self.Complejo.Y = data[0].Y;

            //console.log("antes de getDiasComplejos");
            self.getDiasComplejos();
            //console.log("despues de getDiasComplejos");

            angular.forEach(self.horaLuz.hora, function(aux) {

                //console.log('AUX:' + aux.desc.substr(0,5) + 'SELF:' + self.Complejo.horaCobroLuz.substr(0,5));

                if(aux.desc.substr(0,5) == self.Complejo.horaCobroLuz.substr(0,5))    
                {
                    console.log("entro porque son iguales, descrip: " + aux.desc + " ID: " + aux.id);
                    self.horaLuzSeleccionada.desc = aux.desc.substr(0,5) + " hs.";
                    self.horaLuzSeleccionada.id = aux.id;
                    
                    //self.tipoDocSeleccionado.Descripcion = aux.Descripcion;
                }
            });
         }
                
        //se busca la provincias y las localidades de la misma
        ProvinciasService.query().$promise.then(function(data) {

            self.provincias.prov = data;
            //console.log(data);
            angular.forEach(self.provincias.prov, function(aux) {

            if(aux.IdProvincia == self.Complejo.idProv)    
            {
                self.provinciaSeleccionada.IdProvincia = aux.IdProvincia;
                self.provinciaSeleccionada.Nombre = aux.Nombre;
            }
            });

            self.getLocalidades();
        });
                    
        DocumentosService.query().$promise.then(function(data) {

            self.tiposDoc.tipos = data;
            self.tiposDoc.tipos.splice(0, 0, {IdTipoDoc: '-3', Descripcion: '-Tipo doc.-'});

            angular.forEach(self.tiposDoc.tipos, function(aux) {

                //console.log('AUX:' + aux.IdTipoDoc + 'SELF:' + self.Complejo.idTipoDoc);

                if(aux.IdTipoDoc == self.Complejo.idTipoDoc)    
                {
                    self.tipoDocSeleccionado.IdTipoDoc = aux.IdTipoDoc;
                    self.tipoDocSeleccionado.Descripcion = aux.Descripcion;
                }
            });
        });    
    });
};
    
    this.getDiasComplejos = function(){
        //console.log("ID: "  + self.Complejo.idComplejo);
        ComplejosDiasServices.query({idComplejo:self.Complejo.idComplejo, aux:0}).$promise.then(function(data){

            //console.log("ID: "  + self.Complejo.idComplejo);
            //console.log("Dentro de getDiasComplejos");
            self.Complejo.diasComplejo = data;  
            
            //console.log("Data--> " + data[0]);
        });
    };

    this.getLocalidades = function(){
        var idProv = self.provinciaSeleccionada.IdProvincia;//self.provincias.selectedProv.IdProvincia;
        //console.log("Id de la provincia en getLocalidades: " + idProv)
        if(idProv != -1 && idProv != undefined){
            LocalidadesService.query({id:idProv}).$promise.then(function(data) {
                self.localidades.loc = data;

                angular.forEach(self.localidades.loc, function(aux) {
                     if(aux.IdLocalidad == self.Complejo.idLoc)    
                     {
                         //console.log('te entro la localidad');
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
    
    $scope.addRow = function(){		

        var t = document.getElementById("diaDesde");
        var selectedText = t.options[t.selectedIndex].text;
        var idDiaDesde = t.options[t.selectedIndex].value;
        $scope.diaDesde = selectedText;

        t = document.getElementById("diaHasta");
        selectedText = t.options[t.selectedIndex].text;
        var idDiaHasta = t.options[t.selectedIndex].value;
        $scope.diaHasta = selectedText;

        t = document.getElementById("horaDesde");
        selectedText = self.formatearHora(t.options[t.selectedIndex].text);
        $scope.horaDesde = selectedText;

        t = document.getElementById("horaHasta");
        selectedText = self.formatearHora(t.options[t.selectedIndex].text);
        $scope.horaHasta = selectedText;

        self.Complejo.diasComplejo.push({ 'diaDesde':$scope.diaDesde, 'diaHasta': $scope.diaHasta, 'horaDesde':$scope.horaDesde, 'horaHasta':$scope.horaHasta, 'idDiaDesde': idDiaDesde, 'idDiaHasta': idDiaHasta });
        $scope.diaDesde = $scope.diaDesde[0]; // {idDia: '1', Nombre: 'Lunes'};
        $scope.diaHasta = $scope.diaHasta[0]; //{idDia: '-1', Nombre: '-Dia-'};
        $scope.horaDesde = 8;
        $scope.horaHasta = 9;
    };
    
    this.formatearHora = function(hora){
        
        var horaFormateada = hora.substring(0,5);
        
        horaFormateada += ':00';
        
        return horaFormateada;
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
        var complejoData = new AdministrarComplejoService();
     
        self.Complejo.idProv = self.provinciaSeleccionada;
        self.Complejo.idLoc = self.localidadSeleccionada;
        //self.Complejo.tipoDuenio = 
        
        complejoData.data = self.Complejo; 
        
        console.log("Datos del complejo: " + self.Complejo.idLoc + self.Complejo.idProv );
        
        
        AdministrarComplejoService.save(complejoData.data, function(reponse){
            alert("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
          },function(errorResponse){
              console.log(errorResponse.data.message);  
         });
    };
    
    this.cambiaHasta = function(){
        
        self.horasHasta = [];
        for(var i = $scope.selectedHoraIdDesde + 1; i < 25; i++)
        {
            self.horasHasta.push({id: i, desc:  i + ':00 hs.'});
        }
        $scope.selectedHoraIdHasta = $scope.selectedHoraIdDesde + 1;
        console.log('llegue al cambia hasta');
    };
    
    this.validarDatosHorarios = function(){
        
        var dDesde = document.getElementById("diaDesde");
        var dHasta = document.getElementById("diaHasta");
        var hDesde = document.getElementById("horaDesde");
        var hHasta = document.getElementById("horaHasta");
        var idDiaDesde = dDesde.options[dDesde.selectedIndex].value;
        var idDiaHasta = dHasta.options[dHasta.selectedIndex].value;
        var selectedText; 
        var hayError = 0;
        var mensaje = '';
        
        selectedText = dDesde.options[dDesde.selectedIndex].text;
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Dia desde! \n';
            hayError = 1;
        }
        
        selectedText = dHasta.options[dHasta.selectedIndex].text;
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Dia hasta! \n';
            hayError = 1;
        }
        
        selectedText = hDesde.options[hDesde.selectedIndex].text;
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Hora desde! \n';
            hayError = 1;
        }
        
        selectedText = hHasta.options[hHasta.selectedIndex].text;
        if(selectedText.length == 0)
        {
            mensaje += 'No se ha seleccionado un Hora hasta!';
            hayError = 1;
        }
        
        angular.forEach(self.Complejo.diasComplejo, function(aux){
         
            if(aux.idDiaDesde <= idDiaDesde && aux.idDiaHasta >= idDiaDesde){
                
                mensaje += 'No se puede guardar ya que existen dias agregados! \n';
                hayError = 1;
                return;
            }
            
            if(aux.idDiaDesde <= idDiaHasta && aux.idDiaHasta >= idDiaHasta){
                
                mensaje += 'No se puede guardar ya que existen dias agregados!';
                hayError = 1;
                return;
            }
        });
        
        if(hayError == 0)
        {
            $scope.addRow();
        }
        else
        {
            bootbox.alert(mensaje, function() {
            });
        }
    };
    
    this.hacerCambiosComplejo = function(){
           
        var AdministrarComplejo = new AdministrarComplejoService();

        /*self.Complejo.idProv = self.provinciaSeleccionada;
        self.Complejo.idLoc = self.localidadSeleccionada;*/
        self.Complejo.idProv = self.provinciaSeleccionada.IdProvincia;
        self.Complejo.idTipoDoc = self.tiposDoc.selectedOption.IdTipoDoc;
        self.Complejo.idLoc = self.localidadSeleccionada.IdLocalidad;
        self.Complejo.horaCobroLuz = self.horaLuzSeleccionada.desc.substr(0,5) + ":00"; //MATI esto pincha :(
        //self.Complejo.horaCobroLuz = "19:00:00";

        AdministrarComplejo.data = self.Complejo;

        //console.log("Datos del complejo: " + self.Complejo.idLoc + self.Complejo.idProv);

        //console.log("Estamos en el hacerCambiosComplejo, Datos:  " + AdministrarComplejo.data);
        console.log(AdministrarComplejo.data);

        AdministrarComplejoService.save(AdministrarComplejo.data, function(reponse){
            self.Complejo.idComplejo = reponse.data[0];
            sessionStorage.idComplejo = reponse.data[0];
        });

        bootbox.alert("Complejo guardado exitosamente!", function() {
        });
    };
    
//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-VALIDACIONES-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
    this.validarDatos = function(){
        
        var hayError = 0;
        var mensaje = '';
        
        if(self.Complejo.diasComplejo.length == 0){
            
            mensaje += 'No ha ingresado ningún dia';  
            hayError = 1;
        }
        
        if(self.Complejo.porcentajeSenia.length == 0){
            mensaje += 'Debe ingresar un porcentaje de seña';  
            hayError = 1; 
        }
        
        if(self.Complejo.porcentajeSenia == 0){
            mensaje += 'El porcentaje de la seña no puede ser 0';  
            hayError = 1; 
        }
        
        if(self.Complejo.porcentajeSenia > 100){
            mensaje += 'El porcentaje de la seña se exedio del 100%';  
            hayError = 1; 
        }
        
        if(self.Complejo.porcentajeLuz.length == 0){
            mensaje += 'Debe ingresar un porcentaje de luz';  
            hayError = 1; 
        }
        
        if(self.Complejo.porcentajeLuz == 0){
            mensaje += 'El porcentaje de la seña no puede ser 0';  
            hayError = 1; 
        }
        
        if(self.Complejo.porcentajeLuz > 100){
            mensaje += 'El porcentaje de la seña se exedio del 100%';  
            hayError = 1; 
        }
        
        if(self.Complejo.existeMailComplejo){
            mensaje += 'El mail del complejo ya existe';  
            hayError = 1; 
        }
        
        if(self.Complejo.existeMailDuenio){
            mensaje += 'El mail del usuario ya existe';  
            hayError = 1; 
        }
        
        if(self.Complejo.existeUsuario){
            mensaje += 'El usuario ya existe';  
            hayError = 1; 
        }
        
        if(self.Complejo.CBU.length == 0){
            mensaje += 'Debe ingresar CBU';  
            hayError = 1; 
        }
        
        if(self.Complejo.nroCuenta.length == 0){
            mensaje += 'Debe ingresar un Número de Cuenta';  
            hayError = 1; 
        }
        
        if(hayError == 1){
            bootbox.alert(mensaje, function() {
            });
        }
        else{
            
            self.hacerCambiosComplejo();
        }
        
    };
    
    this.existeEmailDuenio = function(){
        
        console.log("Entro al existeEmailDuenio");
        
        if(self.Complejo.emailDuenio!=undefined){
            EmailDuenioService.query({email:self.Complejo.emailDuenio, idPersona:self.Complejo.idPersona}).$promise.then(function(data){
                  
                
                console.log("email: " + self.Complejo.emailDuenio + " idDuenio " + self.Complejo.idDuenio);
                
                console.log("asdasdasdasd" + data[0].res);
                
                if(data[0].res == 1){
                    self.Complejo.existeMailDuenio = true;  
                }
                else{
                    self.Complejo.existeMailDuenio = false;
                }
            });
            
        }
        
    };
    
    this.existeEmailComplejo = function(){
        
        console.log("Entro al existeEmailComplejo");
        
        if(self.Complejo.emailComplejo!=undefined){
            EmailComplejoService.query({email:self.Complejo.emailComplejo, idComplejo:self.Complejo.idComplejo}).$promise.then(function(data){
                  
                console.log("email: " + self.Complejo.emailComplejo + " idComplejo " + self.Complejo.idComplejo + ", " + data[0].res);
                var bExisteEmail = data[0].resultado; 
                
                if(bExisteEmail == 1){
                    self.Complejo.existeMailComplejo = true;  
                }
                else{
                    self.Complejo.existeMailComplejo = false;
                }
            });
        }
    };
    
    this.existeUsuario = function(){
        if(self.Complejo.usuario!=undefined){
            ComplejoExisteUsuarioDuenioService.query({idPersona:self.Complejo.idPersona, usuario:self.Complejo.usuario}).$promise.then(function(data){
                
                if(data[0].existe == 1){
                    self.Complejo.existeUsuario = true;
                }
                else{
                    self.Complejo.existeUsuario = false;
                }
                
                console.log(self.Complejo.existeUsuario);
            });
        }
        
    };
    
    
//-.-.-.-.-.-.-.-.-.-.-.-.-.-DIAS DEL COMPLEJO-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//    
    
    this.EliminarDiaComplejo = function(idDiaDesde, idDiaHasta, fila){
        
        var cont = 1;
        
        angular.forEach(self.Complejo.diasComplejo, function(aux) {
                 if(aux.idDiaDesde == idDiaDesde && aux.idDiaHasta == idDiaHasta)    
                 {
                     console.log('row --->' + cont);
                     delete self.Complejo.diasComplejo[cont-1];
                     fila.remove();
                     //document.getElementById("dtDias").cle();
                     
                     //console.log(self.Complejo.diasComplejo[cont]);
                     //return;
                }
                cont++;
            });   
    };
    
    this.deleteRow = function(dia) {

        try {

            var index = -1;
            var productArray = self.Complejo.diasComplejo;

            for (var i = 0; i < productArray.length; i++) {
                if (productArray[i].idDiaDesde == dia.idDiaDesde && productArray[i].idDiaHasta == dia.idDiaHasta) {
                    index = i;

                console.log(productArray[i].productName);
                }
            }
            if (index === -1) {
                alert("something broke");
            }

            self.Complejo.diasComplejo.splice(index, 1);
            
       }catch(e) {
            alert(e);
       }
    };
    
//-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-LOAD-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-//
    
self.traerDatosComplejos();
    
TiposSuperficiesService.query().$promise.then(function(data) {
        self.superficies.sup = data;
        //self.tiposDoc.tipos.push({IdTipoDoc: '-3', Descripcion: 'Tipo doc.'});
        self.superficies.sup.splice(0, 0, {IdSuperficie: '-1', Descripcion: '-Superficie-'});
    });
    
DiasServices.query().$promise.then(function(data){
    self.dias.dia = data;
    self.dias.selectedOption = self.dias.dia[0];
    //self.dias.dia.splice(0, 0, {idDia: '1', Nombre: 'Lunes'});
});
    
});