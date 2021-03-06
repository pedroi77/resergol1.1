var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerComplejoController", function($scope, $sce, store, $timeout, $state, $stateParams, ProvinciasService, LocalidadesService, ComplejosService, ComplejoService, CanchasService, TiposSuperficiesService, DuenioDiasService, ComplejosDiasServices, PuntuacionesComplejoService, ComentariosComplejoService, AdministrarCanchasService,
ComplejoImagenesDBService){
	
    var self = this;
    
    this.estaLogueado = false;
    $scope.complejo = [];
    $scope.canchas = [];
    $scope.imagenesComplejo = [];
    $scope.idComplejo = $stateParams.idComp;
    $scope.nombreComplejo = "";
    
    this.myInterval =5000;
    this.noWrapSlides = false;
    this.active = 0;
    
    //Puntuacion que hizo el cliente si es que puntuó.
    this.PuntuacionCliente = 0;
    this.Puntuacion = {
                        idComplejo:$scope.idComplejo,
                        idCliente:sessionStorage.id,
                        puntaje: 0
                     };

    this.PuntajeDesc = "";//"":
    this.PuntajeClass = "button-md label-warning";//"";

    this.seVoto5 = false;
    this.seVoto4 = false;
    this.seVoto3 = false;
    this.seVoto2 = false;
    this.seVoto1 = false;
    
    //Esto es para el MAPA. Inicio
    $scope.map = {center: {latitude: -34.602473, longitude: -58.381057 }, zoom: 14 };
    //$scope.map = {center: {latitude: -34.602473, longitude: -58.381057 }, zoom: 14 };
    $scope.options = {scrollwheel: false};
    $scope.coordsUpdates = 0;
    $scope.dynamicMoveCtr = 0;
    $scope.marker = {
      id: 0,
      coords: {
        latitude: 0,
        longitude: 0
      },
      options: { draggable: true },
      events: {
        dragend: function (marker, eventName, args) {
          $log.log('marker dragend');
          var lat = marker.getPosition().lat();
          var lon = marker.getPosition().lng();
          $log.log(lat);
          $log.log(lon);

          $scope.marker.options = {
            draggable: true,
            labelContent: "lat: " + $scope.marker.coords.latitude + ' ' + 'lon: ' + $scope.marker.coords.longitude,
            labelAnchor: "100 0",
            labelClass: "marker-labels"
          };
        }
      }
    };
    $scope.$watchCollection("marker.coords", function (newVal, oldVal) {
      if (_.isEqual(newVal, oldVal))
        return;
      $scope.coordsUpdates++;
    });
    //Esto es para el MAPA. Fin
    
    $scope.ComentariosComplejo = []; //usuario,comentario y fecha.   
    this.Comentario = {
                        idComplejo:$scope.idComplejo,
                        idCliente:sessionStorage.id,
                        comentario: ''
                     };
    this.comment = "";

    this.diasComplejo = [];
    $scope.tooltipDiasComplejo = "";
    $scope.DiasYHorariosTooltip = "";
    
    var token = store.get("token") || null;
    var sesion = sessionStorage.usuario  || null;

    if(!token || !sesion ){
        self.estaLogueado = false;
    }    
    else{
        self.estaLogueado = true;
    }   
    
    
    this.desactivarBotonPuntuacion = function(punt){
        switch(punt) {
            case 1:
                self.seVoto1 = true;
                self.seVoto2 = false;
                self.seVoto3 = false;
                self.seVoto4 = false;
                self.seVoto5 = false;
                break;
            case 2:
                self.seVoto1 = false;
                self.seVoto2 = true;
                self.seVoto3 = false;
                self.seVoto4 = false;
                self.seVoto5 = false;
                break;
            case 3:
                self.seVoto1 = false;
                self.seVoto2 = false;
                self.seVoto3 = true;
                self.seVoto4 = false;
                self.seVoto5 = false;
                break;
            case 4:
                self.seVoto1 = false;
                self.seVoto2 = false;
                self.seVoto3 = false;
                self.seVoto4 = true;
                self.seVoto5 = false;
                break;
            case 5:
                self.seVoto1 = false;
                self.seVoto2 = false;
                self.seVoto3 = false;
                self.seVoto4 = false;
                self.seVoto5 = true;
                break;
        }
    };
    
    this.mostrarCanchas = function()
    {
        $('html,body').animate({scrollTop:1000},'slow');return false;
    };



    //Traigo la puntuacion que hizo el cliente, para darle algun efecto al botón que votó.
    this.getPuntuacionCliente = function(){
			PuntuacionesComplejoService.query({idComplejo: $scope.idComplejo, idCliente:sessionStorage.id}).$promise.then(function(data){
                    if(data != null && data != undefined && data.length > 0)
                    {
                        if(data[0].Puntaje != null && data[0].Puntaje != 0)
                        {
                        	self.PuntuacionCliente = parseInt(data[0].Puntaje);
                            self.desactivarBotonPuntuacion(self.PuntuacionCliente);
                        }
                        else
                        {
                            self.seVoto1 = false;
                            self.seVoto2 = false;
                            self.seVoto3 = false;
                            self.seVoto4 = false;
                            self.seVoto5 = false;
                        }
                    }
                        
            });
	};
    
    //Traigo la puntuacion que del complejo.
    this.getPuntuacionComplejo = function(){
            PuntuacionesComplejoService.query({idComplejo: $scope.idComplejo}).$promise.then(function(data){       
                    if(data != null && data != undefined)
                    {
                        console.log('ENTRE 22222222222222');
                        if(data[0].Puntaje != null)
                        {
                           var punt = parseFloat(data[0].Puntaje);
                           console.log('3333 PUNTAJE-->' + punt);

                                if(punt == 0){
                                    self.PuntajeDesc = 'Sin votos.';
                                    self.PuntajeClass = "btn-xs label-info";
                                }
                                else
                                    if(punt > 0 && punt <= 1){
                                        self.PuntajeDesc = 'Muy malo';
                                        self.PuntajeClass = "btn-xs label-danger";
                                    }
                                     else
                                        if(punt > 1 && punt <= 2){ 
                                            self.PuntajeDesc = 'No me gusta';
                                            self.PuntajeClass = "btn-xs label-warning";
                                        }
                                    else
                                        if(punt > 2 && punt <= 3){
                                            self.PuntajeDesc = 'Mas o menos';
                                            self.PuntajeClass = "btn-xs label-info";
                                        }
                                        else
                                            if(punt > 3 && punt <= 4){
                                                self.PuntajeDesc = 'Muy bueno';
                                                self.PuntajeClass = "btn-xs label-primary";
                                            }
                                            else
                                                if(punt > 4 && punt <= 5){
                                                    console.log('555555555555555');
                                                    self.PuntajeDesc = 'Una fantasía';
                                                    self.PuntajeClass = "btn-xs block label-success";
                                                }
                        }
                    }
                    else
                    {
                        self.PuntajeDesc = 'Sin votos.';
                        self.PuntajeClass = "btn-xs label-info";
                    }

            });
    };

    self.getPuntuacionComplejo();
    
    //Traigo los comentarios del complejo.
    this.getComentariosComplejo = function(){
                ComentariosComplejoService.query({idComplejo: $scope.idComplejo}).$promise.then(function(data){
                        if(data != null && data != undefined)
                            $scope.ComentariosComplejo = data;
                });
        };

    

    self.getComentariosComplejo();
    
    
   this.getCanchas = function(){
            AdministrarCanchasService.query({idComplejo:$scope.idComplejo, aux:0}).$promise.then(function(data){
                
                  angular.forEach(data,function(aux){
                    if(aux.IdEstado == 1 || aux.IdEstado == "1") //Muestro solo las canchas ACTIVAS.
                      $scope.canchas.push(aux);
                  });
                    console.log($scope.canchas);
            });
    
    };
    
    
      ComplejoImagenesDBService.query({idComplejo: $scope.idComplejo}).$promise.then(function(data) {
            $scope.imagenesComplejo = data;
            
            if ($scope.imagenesComplejo.length > 0){
                var contador = 0;
                //Esto lo hago para agregar un id a cada imagen
                angular.forEach(data, function(aux) {
                    $scope.imagenesComplejo[contador]["id"]=contador;
                    aux.contador = contador;
                    contador++;
                });	
            }else{
                $scope.imagenesComplejo = [];
                $scope.imagenesComplejo.push({ "imagen": "http://localhost:8080/resergol1.1/api/Imagenes/default-image.jpg", "id":0});
            };
          
        });
    
    this.getComplejo = function(){
        
			ComplejoService.query({idComplejo:$scope.idComplejo}).$promise.then(function(data){
                $scope.complejo = data;
                $scope.nombreComplejo = data[0].nombreComplejo;
                console.log($scope.nombreComplejo);
                
                $scope.map = {center: {latitude: data[0].X, longitude: data[0].Y}, zoom: 14 };
                
                $scope.marker.coords = {
                    latitude:data[0].X,
                    longitude:  data[0].Y 
                  };
                
                self.getCanchas();
                if(self.estaLogueado)
                    self.getPuntuacionCliente();

            });
	};
    
    
   self.getComplejo();


    
    
    this.setDiasComplejoAMostrar = function(){
        var texto = "";
        ComplejosDiasServices.query({idComplejo:$scope.idComplejo, aux:0}).$promise.then(function(data){
            angular.forEach(data,function(aux){
                if(aux.diaDesde != aux.diaHasta)
                {
                    texto += '<div class="label label-success">' + aux.diaDesde.substring(0,3) + '   a   '+aux.diaHasta.substring(0,3)+' de   ' + aux.horaDesde.substring(0,5) + 'hs    a   '+ aux.horaHasta.substring(0,5) + 'hs</div><br>';
                }
                else
                {
                    texto += '<div class="label label-success">' + aux.diaDesde.substring(0,3) + '   de    ' + aux.horaDesde.substring(0,5) + 'hs a ' + aux.horaHasta.substring(0,5) + 'hs </div><br> ';
                }
                
             });
            
            $scope.DiasYHorariosTooltip = $sce.trustAsHtml(texto);
        });
    };
                                                                          
    self.setDiasComplejoAMostrar();
    
    
    //Si el cliente ya puntuó el complejo, el SP hace un update.
    this.puntuar = function(puntaje){

        var puntuacionNueva = new PuntuacionesComplejoService();
        self.Puntuacion.puntaje = puntaje;
        
        console.log(self.Puntuacion.puntaje);
        puntuacionNueva.data=self.Puntuacion;
        
        PuntuacionesComplejoService.save(puntuacionNueva.data, function(reponse){
                idPunt = reponse.data[0];
                console.log('idPunt -->' + idPunt);
            
            self.getPuntuacionCliente();
            self.getPuntuacionComplejo();
            
          },function(errorResponse){
            console.log('ERROR...'); 
         });

    };
    
    this.comentar = function(){
        if(self.comment != null && self.comment != '' && self.comment != undefined)
        {
            var comentarioNuevo = new ComentariosComplejoService();
            self.Comentario.comentario = self.comment;
            
            comentarioNuevo.data=self.Comentario;
            
            ComentariosComplejoService.save(comentarioNuevo.data, function(reponse){
                    idComm = reponse.data[0];
                    console.log('idComm -->' + idComm);
                
                self.comment = "";
                //Actualizo los comentarios...
                self.getComentariosComplejo();
                
              },function(errorResponse){
                console.log('ERROR...'); 
             });

         }

    };
    
   
    //Para que funcione el estilo de los tooltips!.
    $(document).ready(function() {
        $("body").tooltip({ selector: '[data-toggle=tooltip]' });   
    });
    
});