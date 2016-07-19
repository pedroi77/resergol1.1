var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoModificarController", function($scope, $state,$stateParams,  TipoTorneosService, DueniosSuperficiesService, DueniosJugadoresService,DuenioDiasService, DuenioCanchasService, DueniosCantEquiposService, DuenioTorneoService, $uibModal,  $uibModalStack ,TorneoService, DuenioTorneoMailService, MandarMailsService){

    var self = this;
    this.tiposTorneos =[];
    this.superficies =[];
    this.idTorneo = $stateParams.idTorneo;
    $scope.msj= '';
    
    this.Torneo ={
                        idTorneo:self.idTorneo,
                        idDuenio:sessionStorage.id,
                        idTipoTorneo: 0,
                        nombre: '',
                        cantEquipos: 0,
                        cantJugadores: 0,
                        idSuperficie: 1,
                        idaYvuelta: 0,
                        tiempoPartido:10,
                        precioInscripcion: 0,
                        fecIniInscripcion: '06/05/2016',
                        fecFinInscripcion: '10/05/2016',
                        horasCancelacion: 72,
                        fechaInicio: '15/05/2016',
                        fechaFin: '18/06/2016',
                        descripcion: null,
                        reglas: '',
                        idEstado: 2 ,
                        canchas:[],
                        dias:[]

                      };
        
    
    this.tiposTorneos = {
        tipos: [],
        selectedOption: {IdTipoTorneo: '1', Nombre: ''} 
    };    
    
    this.superficies = {
        tipos: [],
        selectedOption: {IdSuperficie: '1', Descripcion: ''} 
    };    
    
    this.cantJugadores = {
        tipos: [],
        selectedOption: {CantJugadores: '1'} 
    };   
    
    this.cantEquipos = {
        tipos: [],
        selectedOption: {cantidad: '1'} 
    };   
    
    this.diasDesde = {
        tipos: [],
        selectedOption: {iddia: '1',nombre:'', HoraDesde:'', HoraHasta:'', juega:0} 
    };    
    
    this.canchas = {
        tipos: []
    };  
    
    this.tiposPartidos = {
        tipos: [{ tipo:"Ida"}, { tipo:"Ida y vuelta"}],
        selectedOption: { tipo: ''} 
    }; 
    
   
   
    this.init = function(){
       
       
        //LEER sacar el 1 HARCODE
        TipoTorneosService.query({idTorneo:-1}).$promise.then(function(data) {
            self.tiposTorneos.tipos = data;
        }); 
        
        DueniosCantEquiposService.query({TipoTorneo:self.tiposTorneos.selectedOption.IdTipoTorneo}).$promise.then(function(data) {
            self.cantEquipos.tipos = data;
        }); 
    
        DueniosSuperficiesService.query({idDuenio:this.Torneo.idDuenio}).$promise.then(function(data) {
            self.superficies.tipos = data;
        }); 
        
        DueniosJugadoresService.query({idDuenio:this.Torneo.idDuenio}).$promise.then(function(data) {
            self.cantJugadores.tipos = data;
        }); 
        
        
        DuenioDiasService.query({idDuenio:this.Torneo.idDuenio, idTorneo:self.idTorneo }).$promise.then(function(data) {
            self.diasDesde.tipos = data;
            var i;
            for(i=0; i<self.diasDesde.tipos.length; i++){
                self.diasDesde.tipos[i]['HoraDesde'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['HoraDesde'].substring(0,2)), 00, 0);
                self.diasDesde.tipos[i]['HoraHasta'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['HoraHasta'].substring(0,2)), 00, 0);
                
                if(self.diasDesde.tipos[i]['tIdDia'] != 0){
                    self.diasDesde.tipos[i]['juega'] = true;
                    self.diasDesde.tipos[i]['siNo'] = 'SI';
                    self.diasDesde.tipos[i]['HoraDesde'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['tHoraDesde'].substring(0,2)), 00, 0);
                    self.diasDesde.tipos[i]['HoraHasta'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['tHoraHasta'].substring(0,2)), 00, 0);
                }else{
                    self.diasDesde.tipos[i]['juega'] = false;
                    self.diasDesde.tipos[i]['siNo'] = 'NO';
                }
                
                
                
                self.diasDesde.tipos[i]['desdeMin'] =  self.diasDesde.tipos[i]['HoraDesde'].getHours().toString() + ':0' +
                                                       self.diasDesde.tipos[i]['HoraDesde'].getMinutes().toString();
                
                self.diasDesde.tipos[i]['hastaMax'] =  self.diasDesde.tipos[i]['HoraHasta'].getHours().toString() + ':0' +
                                                       self.diasDesde.tipos[i]['HoraHasta'].getMinutes().toString();
            };
        }); 
        
        DuenioCanchasService.query({idDuenio:this.Torneo.idDuenio, idTorneo: self.idTorneo}).$promise.then(function(data) {
            self.canchas.tipos = data;
            var i;
            for(i=0; i<self.canchas.tipos.length; i++){
                if(self.canchas.tipos[i]['techada'] == 1) 
                    self.canchas.tipos[i]['techo'] = 'SI';
                else    
                    self.canchas.tipos[i]['techo'] = 'NO';
                
                 if(self.canchas.tipos[i]['luz'] == 1) 
                    self.canchas.tipos[i]['conLuz'] = 'SI';
                else 
                    self.canchas.tipos[i]['conLuz'] = 'NO';
                
                if (self.canchas.tipos[i]['tIdCancha'] != 0) {
                     self.canchas.tipos[i]['juegaCancha'] = true;
                    self.canchas.tipos[i]['siNo'] = 'SI';
                }else{
                    self.canchas.tipos[i]['juegaCancha'] = false;
                    self.canchas.tipos[i]['siNo'] = 'NO';
                }
            };
        }); 
       
        
        TorneoService.query({idTorneo: self.idTorneo}).$promise.then(function(data) {
            torneoAux = data;
            
            
            self.Torneo.idDuenio= sessionStorage.id,
            self.Torneo.idTipoTorneo=       torneoAux[0]['idTipoTorneo'],
            self.Torneo.nombre=             torneoAux[0]['nombre'],
            self.Torneo.cantEquipos=        torneoAux[0]['CantEquipos'],
            self.Torneo.cantJugadores=      torneoAux[0]['CantJugadores'],
            self.Torneo.idSuperficie=       torneoAux[0]['idSuperficie'],
            self.Torneo.idaYvuelta=         torneoAux[0]['idaYvuelta'],
            self.Torneo.tiempoPartido=      parseInt(torneoAux[0]['tiempoPartido']),
            self.Torneo.precioInscripcion=  parseInt(torneoAux[0]['PrecioInscripcion']),
            self.Torneo.fecIniInscripcion=  torneoAux[0]['FecIniInscripcion'],
            self.Torneo.fecFinInscripcion=  torneoAux[0]['FecFinInscripcion'],
            self.Torneo.horasCancelacion=   parseInt(torneoAux[0]['HorasCancelacion']),
            self.Torneo.fechaInicio=        torneoAux[0]['FechaInicio'],
            self.Torneo.fechaFin=           torneoAux[0]['FechaFin'],
            self.Torneo.descripcion=        torneoAux[0]['Descripcion'],
            self.Torneo.reglas=             torneoAux[0]['Reglas'],
            self.Torneo.idEstado=           torneoAux[0]['idTipoTorneo']
            /*self.Torneo.canchas:torneoAux[0]['idTipoTorneo'],
            self.Torneo.dias:torneoAux[0]['idTipoTorneo'],*/
            //console.log(torneoAux[0]['idTipoTorneo']);
            
            self.tiposTorneos.selectedOption = self.tiposTorneos.tipos[parseInt(torneoAux[0]['idTipoTorneo'])-1];
       
            if(self.Torneo.idaYvuelta=='1'){
                 self.tiposPartidos.selectedOption = self.tiposPartidos.tipos[1];
            }else{
                 self.tiposPartidos.selectedOption = self.tiposPartidos.tipos[0];
            };
            
            self.cantEquipos.selectedOption.cantidad = self.Torneo.cantEquipos;
            self.cantJugadores.selectedOption.CantJugadores =  self.Torneo.cantJugadores;
           
            var i;
            for(i=0; i<self.superficies.tipos.length; i++){
                if(self.superficies.tipos[i].IdSuperficie ==  self.Torneo.idSuperficie){
                    self.superficies.selectedOption = self.superficies.tipos[i];    
                }    
            };
             
            self.FecInscDesde = new Date( parseInt(self.Torneo.fecIniInscripcion.substring(0,4)), 
                                  parseInt(self.Torneo.fecIniInscripcion.substring(5,7)-1), 
                                  parseInt(self.Torneo.fecIniInscripcion.substring(8,10)));
            
            self.FecInscHasta =new Date( parseInt(self.Torneo.fecFinInscripcion.substring(0,4)), 
                                  parseInt(self.Torneo.fecFinInscripcion.substring(5,7)-1), 
                                  parseInt(self.Torneo.fecFinInscripcion.substring(8,10)));
            
            self.TorneoDesde = new Date( parseInt(self.Torneo.fechaInicio.substring(0,4)), 
                                  parseInt(self.Torneo.fechaInicio.substring(5,7)-1), 
                                  parseInt(self.Torneo.fechaInicio.substring(8,10)));
            
            self.TorneoHasta = new Date( parseInt(self.Torneo.fechaInicio.substring(0,4)), 
                                  parseInt(self.Torneo.fechaInicio.substring(5,7)-1), 
                                  parseInt(self.Torneo.fechaInicio.substring(8,10)));;
            
            
        });
        
        $scope.toggleMin();
        
    };
    
    this.juegaSiNo = function(indice, valor){
        self.diasDesde.tipos[indice]["juega"]=valor;
        if(valor==1){
            self.diasDesde.tipos[indice]["siNo"]='SI';
        }
        else{
            self.diasDesde.tipos[indice]["siNo"]='NO';
        };
    };
    
    this.juegaCanchaSiNo = function(indice, valor){
        self.canchas.tipos[indice]["juegaCancha"]=valor;
        if(valor==1){
            self.canchas.tipos[indice]["siNo"]='SI';
        }
        else{
            self.canchas.tipos[indice]["siNo"]='NO';
        };
    };
    
    this.getCantEquipos= function(){
        DueniosCantEquiposService.query({TipoTorneo:self.tiposTorneos.selectedOption.IdTipoTorneo}).$promise.then(function(data) {
            self.cantEquipos.tipos = data;
            self.cantEquipos.selectedOption = self.cantEquipos.tipos[0];
        }); 
    
    };
    
  
    this.tieneDias= function(){
        var i;
        for(i=0; i<self.diasDesde.tipos.length; i++){
            if(self.diasDesde.tipos[i]['juega'] == true){
                return true;
            }
        };
        return false;
    };
    
    this.tieneCanchas= function(){
        var i;
        for(i=0; i<self.canchas.tipos.length; i++){
            if(self.canchas.tipos[i]['juegaCancha'] == true){
                return true;
            }
        };
        return false;
    };
    
    this.superficieValida= function(){
        var i;
        for(i=0; i<self.canchas.tipos.length; i++){
            if(self.canchas.tipos[i]['juegaCancha'] == true){
                //Deberia validar po id
               if(this.superficies.selectedOption.Descripcion ==self.canchas.tipos[i]['descripcion']){ 
                return true;
               }
            }
        };
        return false;
    };
    
    this.validaFecInscDesde= function(){
        if (self.FecInscDesde == undefined){
            self.FecInscDesde = "";
        }
    };
    
    this.validaFecInscHasta= function(){
        if (self.FecInscHasta == undefined){
            self.FecInscHasta = "";
        }
    };
    
    this.validaFecDesde= function(){
        if (self.TorneoDesde == undefined){
            self.TorneoDesde = "";
        }
    };
    
    this.validaFecHasta= function(){
        if (self.TorneoHasta == undefined){
            self.TorneoHasta = "";
        }
    };
    
    
    this.setearDesdeInsc= function(){
        self.FecInscHasta = self.FecInscDesde;
        $scope.dateOptionsInscHasta.minDate= self.FecInscDesde;
    };
    
    /*****************************PARA FECHAS*********************************/
     $scope.today = function() {
        $scope.dt = new Date();
      };
    
      $scope.today();

      $scope.clear = function() {
        $scope.dt = null;
      };

     
      this.FecInscDesde = new Date();
      this.FecInscHasta = new Date();
      this.TorneoDesde = new Date();
      this.TorneoHasta = new Date();
    
      this.setearDesdeInsc= function(){
        self.FecInscHasta = self.FecInscDesde;
        $scope.dateOptionsInscHasta.minDate= self.FecInscDesde;
        self.setearTorneoDesde();  
      };
    
     this.setearTorneoDesde= function(){
        self.TorneoDesde = self.FecInscHasta;
        self.TorneoHasta = self.FecInscHasta;
        $scope.dateOptionsTorneoDesde.minDate= self.TorneoDesde;
        $scope.dateOptionsTorneoHasta.minDate= self.TorneoHasta;
      };
 
     this.setearTorneoHasta = function(){
        self.TorneoHasta = self.TorneoDesde;
        $scope.dateOptionsTorneoHasta.minDate= self.TorneoHasta;
     };
    
      $scope.dateOptionsInscDesde = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.dateOptionsInscHasta = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
      $scope.dateOptionsTorneoDesde = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.dateOptionsTorneoHasta = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };


        //Deshabilita x eje el dom 0 o el sab 6
    
    function disabled(data) {
        var date = data.date,
          mode = data.mode;
        //return mode === 'day' && (date.getDay() === 0 || date.getDay() === 6);
        return mode === 'day' && (false);
      }
    

      $scope.toggleMin = function() {
        $scope.dateOptionsInscDesde.minDate = new Date();
      };

      

      $scope.OpenFecInscDesde = function() {
        $scope.FecInscripcionDesde.opened = true;
      };

      $scope.OpenFecInscHasta = function() {
        $scope.FecInscripcionHasta.opened = true;
      };
        
      $scope.OpenFecDesde = function() {
        $scope.FecDesde.opened = true;
      };

      $scope.OpenFecHasta = function() {
        $scope.FecHasta.opened = true;
      };
    
     
      $scope.setDate = function(year, month, day) {
        $scope.dt = new Date(year, month, day);
      };

      $scope.formats = ['dd/MM/yyyy', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
      $scope.format = $scope.formats[0];
      $scope.altInputFormats = ['M!/d!/yyyy'];

      $scope.FecInscripcionDesde = {
        opened: false
      };

      $scope.FecInscripcionHasta = {
        opened: false
      };
    
     $scope.FecDesde = {
        opened: false
      };

      $scope.FecHasta = {
        opened: false
      };

      var tomorrow = new Date();
      tomorrow.setDate(tomorrow.getDate() + 1);
      var afterTomorrow = new Date();
      afterTomorrow.setDate(tomorrow.getDate() + 1);
      $scope.events = [
        {
          date: tomorrow,
          status: 'full'
        },
        {
          date: afterTomorrow,
          status: 'partially'
        }
      ];

      function getDayClass(data) {
        var date = data.date,
          mode = data.mode;
        if (mode === 'day') {
          var dayToCheck = new Date(date).setHours(0,0,0,0);

          for (var i = 0; i < $scope.events.length; i++) {
            var currentDay = new Date($scope.events[i].date).setHours(0,0,0,0);

            if (dayToCheck === currentDay) {
              return $scope.events[i].status;
            }
          }
        }

        return '';
      };


        /*
        idDuenio:sessionStorage.id,
                        idTipoTorneo: 0,
                        nombre: "Sudamericana",
                        cantEquipos: 8,
                        cantJugadores: 11,
                        idSuperficie: 1,
                        idaYvuelta: 0,
                        precioInscripcion: 500.00,
                        fecIniInscripcion: "06/05/2016",
                        fecFinInscripcion: "10/05/2016",
                        horasCancelacion: 16,
                        fechaInicio: "15/05/2016",
                        fechaFin: "18/06/2016",
                        descripcion: "el segundo torneo",
                        reglas: "reglas Vale todo!",
                        idEstado: 2     */
        
    
    
    
    this.modificarTorneo = function(){
       
        if(this.validarDatos()){
            self.Torneo.idTipoTorneo = self.tiposTorneos.selectedOption.IdTipoTorneo;
            self.Torneo.cantJugadores = self.cantJugadores.selectedOption.CantJugadores;
            self.Torneo.idSuperficie = self.superficies.selectedOption.IdSuperficie;
            self.Torneo.idaYvuelta = self.tiposPartidos.selectedOption.tipo;
            self.Torneo.idaYvuelta = self.tiposPartidos.selectedOption.tipo;
            self.Torneo.cantEquipos = self.cantEquipos.selectedOption.cantidad;
            self.Torneo.fecIniInscripcion = self.FecInscDesde.toLocaleDateString();
            self.Torneo.fecFinInscripcion = self.FecInscHasta.toLocaleDateString();
            self.Torneo.fechaInicio = self.TorneoDesde.toLocaleDateString();
            self.Torneo.fechaFin = self.TorneoHasta.toLocaleDateString();
            self.Torneo.idEstado = 2;  //Inscripcion

            if(self.Torneo.idaYvuelta == 'Ida')
                self.Torneo.idaYvuelta = 0;
            else
                self.Torneo.idaYvuelta = 1;


            var i;
            for(i=0; i<self.canchas.tipos.length; i++){
                if(self.canchas.tipos[i]['juegaCancha'] == true) {
                    self.Torneo.canchas.push({ "idComplejo": sessionStorage.idComplejo, "idCancha": self.canchas.tipos[i]['idcancha']});
                };
            };

            for(i=0; i<self.diasDesde.tipos.length; i++){
                if(self.diasDesde.tipos[i]['juega'] == true) {

                    var h = addZero(self.diasDesde.tipos[i]['HoraDesde'].getHours());
                    var m = addZero(self.diasDesde.tipos[i]['HoraDesde'].getMinutes());
                    var s = addZero(self.diasDesde.tipos[i]['HoraDesde'].getSeconds());

                    var HoraDesde = h + ":" + m + ":" + s;

                    h = addZero(self.diasDesde.tipos[i]['HoraHasta'].getHours());
                    m = addZero(self.diasDesde.tipos[i]['HoraHasta'].getMinutes());
                    s = addZero(self.diasDesde.tipos[i]['HoraHasta'].getSeconds());

                    var HoraHasta = h + ":" + m + ":" + s;

                    self.Torneo.dias.push({ "idDia": self.diasDesde.tipos[i]['iddia'], "horaDesde": HoraDesde , "horaHasta": HoraHasta });
                };
        };
        
       
        
        var TorneoNuevo = new DuenioTorneoService();
        
        TorneoNuevo.data=self.Torneo;
        
        DuenioTorneoService.update(TorneoNuevo.data, function(reponse){
           // idTorneo = reponse.data[0];
            bootbox.alert("Se actualizó el torneo!", function() {});
             $state.reload("Duenios.torneoModificar", {idTorneo:self.idTorneo});
            //self.open('sm', true, idTorneo);
          },function(errorResponse){
            bootbox.alert("Ocurrió un error al actualizar el torneo", function() {});
         });
        }
    };
    
    this.validarDatos = function(){
        if(!this.tieneDias()){
            bootbox.alert("No selecciono días.", function() {});
            //alert("");
            return false;
        }
                
        if(!this.tieneCanchas()){
            alert("No selecciono canchas");
            return false;
        }
        
        if(!this.superficieValida()){
            bootbox.alert("La superficie del torneo no coincide con ninguna de las canchas seleccionadas.", function() {});
            //alert("La superficie del torneo no coincide con ninguna de las canchas seleccionadas.");
            return false;
        }
        
        return true;
        
    };
    
    function addZero(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    };
    
    this.imagenes = function(){ 
             
        $state.go("Duenios.torneoImagenes",{idTorneo:self.Torneo.idTorneo, idDuenio:self.Torneo.idDuenio, nombre:self.Torneo.nombre });
    };
    
    this.eliminar = function(){
        
        bootbox.confirm("¿Esta seguro de eliminar el torneo?", function(result) {
            if(result){
                
                DuenioTorneoMailService.query({idTorneo:self.Torneo.idTorneo}).$promise.then(function(data) {
                    equipos = data;
                    self.mandarMail(equipos);
                }); 
                
                
                var TorneoEliminar = new DuenioTorneoService();
        
                TorneoEliminar.data= {'idTorneo':self.Torneo.idTorneo};
                
                DuenioTorneoService.delete(TorneoEliminar.data, function(reponse){
                    bootbox.alert("Se eliminó el torneo.", function() {});
                    $state.go("Duenios.torneoBuscar");
                  },function(errorResponse){
                    bootbox.alert("Ocurrió un error al eliminar el torneo", function() {});
                 });
                
               
                
                 
            }
        }); 
    };
    
    this.mandarMail = function(equipos){
        
        console.log(equipos);
        
        var i;
        for(i=0; i<equipos.length; i++){
        
            var mailNuevo = new MandarMailsService();
                        mailNuevo.data = {
                            "receptor": equipos[i].Email,
                            "asunto": 'Aviso torneo ' + equipos[i].nomTorneo,
                            "mensaje": 'Resergol le informa que se a cancelado el torneo ' +equipos[i].nomTorneo +  ' del complejo ' + equipos[i].complejo + ' en el cual su equipo se inscribió. Se le acreditará en su cuenta el importe abonado a la hora de inscribirse. <br> Sepa disculpar las molestias ocacionadas.' 
                        };  

                    MandarMailsService.save(mailNuevo.data, function(reponse){
                            console.log('se mando el mail');
                          },function(errorResponse){
                            console.log('no se mando el mail' + errorResponse); 
                         }); 
        };
    };

    self.init(); 
});


