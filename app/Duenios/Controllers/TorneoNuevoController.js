var resergolApp = angular.module("resergolApp");

resergolApp.controller("TorneoNuevoController", function($scope, $state, TipoTorneosService, DueniosSuperficiesService, DueniosJugadoresService,DuenioDiasService, DuenioCanchasService, DueniosCantEquiposService, DuenioTorneoService, $uibModal,  $uibModalStack){

    var self = this;
    this.tiposTorneos =[];
    this.superficies =[];
    $scope.msj= '';
    
    this.Torneo ={
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
       
        self.tiposPartidos.selectedOption = self.tiposPartidos.tipos[0];
        //LEER sacar el 1 HARCODE
        TipoTorneosService.query({idTorneo:-1}).$promise.then(function(data) {
            self.tiposTorneos.tipos = data;
            self.tiposTorneos.selectedOption = self.tiposTorneos.tipos[0];
        }); 
        
        DueniosCantEquiposService.query({TipoTorneo:self.tiposTorneos.selectedOption.IdTipoTorneo}).$promise.then(function(data) {
            self.cantEquipos.tipos = data;
            self.cantEquipos.selectedOption = self.cantEquipos.tipos[0];
        }); 
    
        DueniosSuperficiesService.query({idDuenio:this.Torneo.idDuenio}).$promise.then(function(data) {
            self.superficies.tipos = data;
            self.superficies.selectedOption = self.superficies.tipos[0];
        }); 
        
        DueniosJugadoresService.query({idDuenio:this.Torneo.idDuenio}).$promise.then(function(data) {
            self.cantJugadores.tipos = data;
            self.cantJugadores.selectedOption = self.cantJugadores.tipos[0];
        }); 
        
        
        DuenioDiasService.query({idDuenio:this.Torneo.idDuenio}).$promise.then(function(data) {
            self.diasDesde.tipos = data;
            var i;
            for(i=0; i<self.diasDesde.tipos.length; i++){
                self.diasDesde.tipos[i]['HoraDesde'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['HoraDesde'].substring(0,2)), 00, 0);
                self.diasDesde.tipos[i]['HoraHasta'] =new Date(1970, 0, 1, parseInt(self.diasDesde.tipos[i]['HoraHasta'].substring(0,2)), 00, 0);
                self.diasDesde.tipos[i]['juega'] = false;
                self.diasDesde.tipos[i]['siNo'] = 'NO';
                self.diasDesde.tipos[i]['desdeMin'] =  self.diasDesde.tipos[i]['HoraDesde'].getHours().toString() + ':0' +
                                                       self.diasDesde.tipos[i]['HoraDesde'].getMinutes().toString();
                
                self.diasDesde.tipos[i]['hastaMax'] =  self.diasDesde.tipos[i]['HoraHasta'].getHours().toString() + ':0' +
                                                       self.diasDesde.tipos[i]['HoraHasta'].getMinutes().toString();
            };
        }); 
        
        DuenioCanchasService.query({idDuenio:this.Torneo.idDuenio}).$promise.then(function(data) {
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
                
                self.canchas.tipos[i]['juegaCancha'] = false;
                self.canchas.tipos[i]['siNo'] = 'NO';
            };
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

     
    
    this.sumaFecha = function(d, fecha){
         var Fecha = new Date();
         var sFecha = fecha || (Fecha.getDate() + "/" + (Fecha.getMonth() +1) + "/" + Fecha.getFullYear());
         var sep = sFecha.indexOf('/') != -1 ? '/' : '-'; 
         var aFecha = sFecha.split(sep);
         var fecha = aFecha[2]+'/'+aFecha[1]+'/'+aFecha[0];
         fecha= new Date(fecha);
         fecha.setDate(fecha.getDate()+parseInt(d));
         var anno=fecha.getFullYear();
         var mes= fecha.getMonth()+1;
         var dia= fecha.getDate();
         mes = (mes < 10) ? ("0" + mes) : mes;
         dia = (dia < 10) ? ("0" + dia) : dia;
         var fechaFinal = dia+sep+mes+sep+anno;
         return (fechaFinal);
    };
    
    
    //set de las fechas cuando inicia la pantalla
    this.FecInscDesde = new Date();
    
    this.fininsAux =   this.FecInscDesde.getDate() + '/'+  addZero(this.FecInscDesde.getMonth()) + '/' +  addZero(this.FecInscDesde.getFullYear());
    
    this.fininsAux = self.sumaFecha(7,this.fininsAux);

    self.FecInscHasta =new Date( parseInt(this.fininsAux.substring(6,10)), 
                          parseInt(this.fininsAux.substring(3,5)), 
                          parseInt(this.fininsAux.substring(0,2)));
    

    this.fininsAux = this.FecInscHasta.getDate() + '/'+  addZero(this.FecInscHasta.getMonth()) + '/' +  addZero(this.FecInscHasta.getFullYear());
    
    
    
    self.TorneoDesde =new Date( parseInt(this.fininsAux.substring(6,10)), 
                          parseInt(this.fininsAux.substring(3,5)), 
                          parseInt(this.fininsAux.substring(0,2)));
    
    this.fininsAux =   this.TorneoDesde.getDate() + '/'+  addZero(this.TorneoDesde.getMonth()) + '/' +  addZero(this.TorneoDesde.getFullYear());
    
    this.fininsAux = self.sumaFecha(7,this.fininsAux);
    
    self.TorneoHasta =new Date( parseInt(this.fininsAux.substring(6,10)), 
                          parseInt(this.fininsAux.substring(3,5)), 
                          parseInt(this.fininsAux.substring(0,2)));
   
    
    
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
        
    
    
    
    this.crearTorneo = function(){
       
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
        
            console.log(TorneoNuevo.data);
            
        DuenioTorneoService.save(TorneoNuevo.data, function(reponse){
            idTorneo = reponse.data[0];
            self.open('sm', true, idTorneo);
          },function(errorResponse){
             self.open('sm', false,0);
         });
        }
    };
    
    this.validarDatos = function(){
        if(!this.tieneDias()){
            bootbox.alert("No selecciono días.", function() {});
            return false;
        }
                
        if(!this.tieneCanchas()){
            bootbox.alert("No selecciono canchas.", function() {});
            return false;
        }
        
        if(!this.superficieValida()){
            bootbox.alert("La superficie del torneo no coincide con ninguna de las canchas seleccionadas.", function() {});
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
    
    this.limpiar = function(){
        $('body,html').animate({scrollTop : 0}, 500);
        $state.reload("Duenios.torneoNuevo");
    };
    

    
    /*Modal*/
    $scope.animationsEnabled = true;
    
    
    self.open = function (size, res, pidTorneo) {
        var modalInstance = $uibModal.open({
          animation: $scope.animationsEnabled,
          templateUrl: 'myModalContent.html',
          controller: 'ModalInstanceCtrl',
          size: size,
          resolve: { msj : function () {
                                if (res){
                                        return 'Se creo el torneo! ¿desea agregar imagenes ahora?';
                                    }else{
                                       return 'Se produjo un error.';
                                    }
                                },
                     res : function(){return res},
                     p_idDuenio: function(){return self.Torneo.idDuenio},
                     p_idTorneo: function(){return pidTorneo}
                   }
            });
        
        
    };

    self.init(); 
});


angular.module('resergolApp').controller('ModalInstanceCtrl', function ($scope,$state, $uibModalInstance, msj, res, p_idDuenio, p_idTorneo) {

  $scope.msj = msj;
    
 $scope.cargarImagenes = function () {
     if(res){
         $state.go("Duenios.torneoImagenes",{idTorneo:p_idTorneo, idDuenio:p_idDuenio});
     };
     $('body,html').animate({scrollTop : 0}, 500);
     $uibModalInstance.close('sm');
     
  };

  $scope.cancelar = function () {
    $('body,html').animate({scrollTop : 0}, 500);
    $uibModalInstance.dismiss('cancel');
  };
  
});