var resergolApp = angular.module("resergolApp");

resergolApp.controller("DueniosReservasController", function($scope, DevolucionesService, ReservasCancelacionService, ReservasService, DueniosReservasServices, DuenioReservasCompletarPagoService, AdministrarCanchasService, DuenioDiasService, ReservasFijasService, ReservasTempService, DuenioReservasFijasService, $state, $uibModal,  $uibModalStack){
    
/*************************************SECCION DE VARIABLES*****************************************************/
var self = this;
  
//this.reservas = [];
this.canchas = [];
this.IdComplejo = sessionStorage.idComplejo;
this.IdDuenio = sessionStorage.id;
this.Fecha = '';
    
this.reservas = {
    
    canchas: [{
        
        datos: []
    }]
}

this.cosas = [
    
    /*{ num: 1},
    { num: 1},
    { num: 1},
    { num: 1},
    { num: 1}*/
]
    
this.horas = [
    
    
]

this.diasComplejo = null;

this.reservaSeleccionada = {
    
    NombreCancha: ''
    ,CantJugadores: 0
    ,Superficie: ''
    ,Usuario: ''
    ,Precio: '0'
    ,Pagado: 0
    ,Resta: 0
    ,EstadoReserva: 0
    ,IdReserva: 0
    ,puedeCancelar: false
    ,HorasCancelacion: ''
    ,IdCliente: 0
    ,TotalPagar: 0
    ,IdCancha:0
    ,UsuarioReserva:''
    ,totalCalculado: 0
    ,horaDesde: ''
    ,horaHasta: ''
    ,HoraCobroLuz: ''
    ,PorcentajeLuz: 0
    ,PorcentSenia: 0
    ,Luz: 0
};
    
$scope.aceptaReservaFija = 0;
$scope.noDisponibles = [];
$scope.selectedHoraIdHasta = 21;
$scope.listasReservasFijas = [];
$scope.CantHoras = 0;
$scope.data= [
//["Hora", "Maracana", "Lencho"],
//["11:00", "Disponible", "Matias"]

["Hora"]
];
    
this.horasHasta = [];
    
this.fechaSeleccionada = new Date();
this.FechaReserva = new Date();
this.Hoy = new Date();
    
function pad(n) {return n < 10 ? "0"+n : n;}
self.Hoy = self.Hoy.getFullYear()+"-"+pad(self.Hoy.getMonth()+1)+"-"+pad(self.Hoy.getDate());
    
/*************************************SECCION DE METODOS*****************************************************/
    
this.traerReservas = function(){
    
    $scope.data= [
        ["Hora"]
    ];
    
    //Traigo todas las canchas del complejo del dueño que se logueo
    AdministrarCanchasService.query({idComplejo: self.IdComplejo, aux:0}).$promise.then(function(dataCancha){ //, aux: 0
        
        //cargo la lista de las canchas del complejo
        ///self.reservas.canchas = dataCancha; 
        //self.canchas = data;
        //console.log(dataCancha);
        var index = 0;
        
        //Recorro la lista de canchas por complejo 
        angular.forEach(dataCancha, function(unaCancha) { //self.reservas.canchas
        
            //console.log(unaCancha.nombre);
            $scope.data[0].push({"nombre": unaCancha.nombre, "estilo": "background-color:#B5CBDE;", referencia:"" , pagado:0, precioCancha: 0, "nombreCancha": '', "cantJugadores": '', "superficie": '', "resta": 0, "estadoReserva": 0, "idReserva": 0, "hora": '', "horasCancelacion": 0, "idCliente": 0, "TotalPagar": 0, "idCancha": 0, "HoraCobroLuz": '' ,"PorcentajeLuz": 0 ,"PorcentSenia": 0, "Luz": 0});
        
            //Traigo las reservas de cada cancha
            DueniosReservasServices.query({idComplejo: self.IdComplejo, fecha: self.Fecha, idCancha: unaCancha.IdCancha}).$promise.then(function(dataRes){
               
                $scope.CantHoras = dataRes.length;
                if(index == 0){
                    var i = 1;
                    //recorro la primer lista de "reservas" para llenar la lista de horas
                    angular.forEach(dataRes, function(h) {
                        $scope.data[i] = [{"nombre": h.hora, "estilo": "background-color:#B5CBDE;", referencia:"", pagado:0, precioCancha: 0, "nombreCancha": '', "cantJugadores": '', "superficie": '', "resta": 0, "estadoReserva": 0, "idReserva": 0, "hora": '', "horasCancelacion": 0, "idCliente": 0,"TotalPagar": 0,"idCancha":0, "HoraCobroLuz": '' ,"PorcentajeLuz": 0 ,"PorcentSenia": 0, "Luz": 0}];
                        i++;
                        self.horasHasta.push({"id": h.hora.substr(0,2), "desc": h.hora});
                        //console.log(h.hora.substr(0,5));
                    });
                }
                
                //Lleno cada cancha con su lista de reservas
                var auxindexCancha ;
                var auxJ;
                
                for(auxindexCancha =0;auxindexCancha < dataCancha.length;auxindexCancha++){
                    if(dataCancha[auxindexCancha].nombre == dataRes[0].nombre){
                        auxJ = auxindexCancha+1;   
                        dataCancha[auxindexCancha].datos = dataRes;
                    }
                }
                
                index++;
                var index2 = 1;
                
                //Recorro la lista de reservas
                //console.log(auxJ);
                angular.forEach(dataRes, function(res) {
                    
                    var estilo = "background-color:#FF6E6E;";
                    
                    if(res.usuario == null){
                        res.usuario = "Disponible";
                        estilo = "background-color:#A5D29C;";
                    }
                    //console.log(index);
                    $scope.data[index2][auxJ] = {"nombre": res.usuario, "estilo": estilo, "referencia":"#reservasModal", "pagado":res.Pagado, "precioCancha": res.precioCancha, "nombreCancha": res.nombre, "cantJugadores": res.CantJugadores, "superficie": res.superficie, "resta": res.resta, "estadoReserva": res.estadoReserva, "idReserva": res.IdReserva, "hora": res.hora, "horasCancelacion": res.CancelacionHasta, "idCliente": res.idCliente,"TotalPagar": 0,"idCancha": res.IdCancha, "HoraCobroLuz": res.HoraCobroLuz ,"PorcentajeLuz": res.PorcentajeLuz ,"PorcentSenia": res.PorcentSenia, "Luz": res.Luz}; 
                    index2++;
                }); 
            });
        });  
    });
};
    
this.obtenerDiaActual = function(){
    
    var hoy = new Date();
    var dd = hoy.getDate();
    var mm = hoy.getMonth()+1; //hoy es 0!
    var yyyy = hoy.getFullYear();
    
    //var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"); 
    //var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"); 
    //var fechaComplejo =new Date(); 
    //console.log(diasSemana[fechaComplejo.getDay()] + " " + fechaComplejo.getDate() + " de " + meses[fechaComplejo.getMonth()] + " de " + fechaComplejo.getFullYear());

    if(dd<10) {
        dd='0'+dd
    } 

    if(mm<10) {
        mm='0'+mm
    } 

    self.Fecha = yyyy+'-'+mm+'-'+dd;
    self.FechaReserva = dd+'/'+mm+'/'+yyyy;
};
    
this.init = function(){
    
    DuenioDiasService.query({idDuenio:self.IdDuenio}).$promise.then(function(data) {
        self.diasComplejo = data;
        //console.log(self.diasComplejo);
    }); 
     
    //console.log(self.diasComplejo);
    self.traerReservas();
    //self.obtenerDiaActual();

};
 
this.clic = function(indice, fila){
    
    //console.log(indice);
    //console.log(fila);
    //console.log(fila[indice]);
    
    /***************************TEMA HORA****************************************/
    var hora;
    var Digital=new Date();
    var hours=Digital.getHours();
    var minutes=Digital.getMinutes();
    var seconds=Digital.getSeconds();
    
    var dn="AM";
    
    if (hours>12){
        dn="PM";
    }
    
    if (hours==0)
        hours=12;
    
    if (minutes<=9)
        minutes="0"+minutes;
    
    if (seconds<=9)
        seconds="0"+seconds;

    hora = hours + ":" + minutes + ":" + seconds;
    
    /*******************************************************************/
    if(fila[indice].hora < hora)
        self.reservaSeleccionada.puedeCancelar = true;
    else
        self.reservaSeleccionada.puedeCancelar = false;
    
    //console.log(self.reservaSeleccionada.puedeCancelar);

    self.reservaSeleccionada.Usuario = '';
    self.reservaSeleccionada.NombreCancha = fila[indice].nombreCancha;
    self.reservaSeleccionada.CantJugadores = fila[indice].cantJugadores;
    self.reservaSeleccionada.Superficie = fila[indice].superficie;
    self.reservaSeleccionada.horaDesde = fila[indice].hora.substring(0,5);
    self.reservaSeleccionada.HoraCobroLuz = fila[indice].HoraCobroLuz;
    self.reservaSeleccionada.PorcentajeLuz = fila[indice].PorcentajeLuz;
    self.reservaSeleccionada.PorcentSenia = fila[indice].PorcentSenia;
    self.reservaSeleccionada.Luz = fila[indice].Luz;
    self.reservaSeleccionada.IdReserva = fila[indice].idReserva;
    
    console.log("Fila Indice Nombre: " + fila[indice].nombre + " IdReserva: " + fila[indice].idReserva);
    
    if(fila[indice].idReserva == undefined || fila[indice].idReserva == null || fila[indice].idReserva == '')
        self.reservaSeleccionada.Usuario = '';
    else
        self.reservaSeleccionada.Usuario = fila[indice].nombre;
    
    console.log("Usuario: " + self.reservaSeleccionada.Usuario);
    self.reservaSeleccionada.Precio = fila[indice].precioCancha;
    
    if(fila[indice].pagado == null)
        self.reservaSeleccionada.Pagado = 0;
    else
        self.reservaSeleccionada.Pagado = parseInt(fila[indice].pagado);
    
    if(fila[indice].resta == null){
        self.reservaSeleccionada.totalCalculado = 0;
        self.reservaSeleccionada.Resta = 0;
    }  
    else
        self.reservaSeleccionada.Resta = parseInt(fila[indice].resta);
    
    self.reservaSeleccionada.EstadoReserva = fila[indice].estadoReserva;
    
    self.reservaSeleccionada.HorasCancelacion = fila[indice].horasCancelacion; 
    self.reservaSeleccionada.IdCliente = fila[indice].idCliente;
    self.reservaSeleccionada.IdCancha = fila[indice].idCancha;
    
    if(fila[indice].idCliente == null || fila[indice].idCliente == undefined || fila[indice].idCliente == '')
        self.reservaSeleccionada.IdCliente = 1;

    //self.llenarComboHorasHasta();
    self.llenarComboHorasHasta(indice, fila);
    console.log(self.reservaSeleccionada);
};
   
this.limpiarForm = function(form){
        
    form.$setPristine();
    self.reservaSeleccionada.CantJugadoresNombreCancha = '';
    self.reservaSeleccionada.CantJugadores = 0;
    self.reservaSeleccionada.Superficie = '';
    self.reservaSeleccionada.Usuario = '';
    self.reservaSeleccionada.Precio = '0';
    self.reservaSeleccionada.Pagado = 0;
    self.reservaSeleccionada.Resta = 0;
    self.reservaSeleccionada.EstadoReserva = 0;
    self.reservaSeleccionada.IdReserva = 0;
    self.reservaSeleccionada.puedeCancelar = false;
    self.reservaSeleccionada.HorasCancelacion = '';
    self.reservaSeleccionada.IdCliente = 0;
    self.reservaSeleccionada.TotalPagar = 0;
    self.reservaSeleccionada.IdCancha = 0;
    self.reservaSeleccionada.UsuarioReserva = '';
    self.reservaSeleccionada.totalCalculado = 0;
    self.reservaSeleccionada.horaDesde = '';
    self.reservaSeleccionada.horaHasta = '';
    self.reservaSeleccionada.HoraCobroLuz = '';
    self.reservaSeleccionada.PorcentajeLuz = 0;
    self.reservaSeleccionada.PorcentSenia = 0;
    self.reservaSeleccionada.Luz = 0;
    console.log("Limpio Datos");
    
        
};
    
this.cambiaFecha = function(dt)
{   
    function pad(n) {return n < 10 ? "0"+n : n;}
    $scope.fechaElegida = dt;

    //var hoy = new Date();
    //hoy = pad(hoy.getFullYear()+"-"+pad(hoy.getMonth()+1)+"-"+hoy.getDate());
    
    self.Fecha = pad($scope.fechaElegida.getFullYear()+"-"+pad($scope.fechaElegida.getMonth()+1)+"-"+$scope.fechaElegida.getDate());
    self.FechaReserva = pad($scope.fechaElegida.getDate()+"/"+pad($scope.fechaElegida.getMonth()+1)+"/"+$scope.fechaElegida.getFullYear());

    self.traerReservas();
    
    //console.log('hoy-> ' + hoy);
    //console.log('eleccion-> ' + fechaSelect);
    
};
    
this.CalcularResta = function(){
    
    var restaPago = self.reservaSeleccionada.totalCalculado - self.reservaSeleccionada.Pagado;
    
    if(restaPago < 0){
        bootbox.alert("La reserva no puede quedar negativa.", function() {});
        
    } 
    
    self.reservaSeleccionada.Resta = restaPago;
    
    /*var pago = document.getElementById('pagado').value;
    
    console.log(pago);
    
    console.log(self.reservaSeleccionada.Resta + " - " + self.reservaSeleccionada.Pagado);*/
};
    
this.compararFechas = function (DateA, DateB) {     // this function is good for dates > 01/01/1970

    var a = new Date(DateA);
    var b = new Date(DateB);

    var msDateA = Date.UTC(a.getFullYear(), a.getMonth()+1, a.getDate());
    var msDateB = Date.UTC(b.getFullYear(), b.getMonth()+1, b.getDate());
    //console.log(msDateA);
    //console.log(msDateB);

    if (parseFloat(msDateA) < parseFloat(msDateB))
      return -1;  // lt
    else if (parseFloat(msDateA) == parseFloat(msDateB))
      return 0;  // eq
    else if (parseFloat(msDateA) > parseFloat(msDateB))
      return 1;  // gt
    else
      return null;  // error
};
    
this.borrarReserva = function()
{
    /*Verifico si puede cancelar la reserva.
     Para esto, tanto la fecha de hoy, como la del partido, debe ser
     Menor a la FechaCancelacion que traigo desde el SP,
     Si el cliente había pagado algo, se le devuelve el importe...
    */

    //Hay tiempo para realizar la cancelacion hasta esta fecha/hora
    function pad(n) {return n < 10 ? "0"+n : n;}
    var fCancelacion = self.reservaSeleccionada.HorasCancelacion.substring(0,16);
    var vAhora = new Date();
    var ahora = vAhora.getFullYear()+"-"+pad(vAhora.getMonth()+1)+"-"+pad(vAhora.getDate())+" "+ vAhora.getHours()+":"+vAhora.getMinutes();

    var result = self.compararFechas(fCancelacion, ahora);
    //var fPartido = res.FPartido.substring(0,16);
    //var result2 = self.compararFechas(fPartido, ahora);

    var devuelvo = true;
    if(result == -1) //SI YA NO SE PUEDE CANCELAR CON DEVOLUCION
        devuelvo = false;

    var sPag = parseFloat(self.reservaSeleccionada.Pagado);
    var msj = "";
    
    console.log("Cliente: " + self.reservaSeleccionada.IdCliente);
    if(self.reservaSeleccionada.IdCliente != 1){
        
        if(!devuelvo)
            msj = "No se realizará el reembolso ya que se superaron las horas de antelación de aviso";
        else if(sPag > 0) 
            msj = "Se reembolsarán la suma de $ " + sPag + ".";
        
    }
    else{
        
        if(!devuelvo)
            msj = "No se realizara la devolucion ya que se superaron las horas de antelación de aviso";
        else if(sPag > 0) 
            msj = "Se debe reembolsar la suma de $ " + sPag + ".";
    }
    
    bootbox.confirm("¿Seguro desea cancelar la reserva? <br>" + msj, function(result) {
        if(result)
        {
            if(sPag > 0 && devuelvo && self.reservaSeleccionada.IdCliente != 1)//si es cliente de la pagina
            {
                //INSERTO LA DEVOLUCION
                var devNueva = new DevolucionesService();
                devNueva.data = {
                    "idCliente": self.reservaSeleccionada.IdCliente,
                    "idDuenio": self.IdDuenio,
                    "monto": parseFloat(self.reservaSeleccionada.Pagado),
                    "tipo": 1
                };  

                
                DevolucionesService.save(devNueva.data, function(reponse){
                        idRetorno = reponse.data[0];
                        //console.log('se guardo devolucion -->' + idRetorno);

                        ReservasCancelacionService.delete({idReserva: self.reservaSeleccionada.IdReserva}, function(reponse){
                            
                            idRetorno = reponse.data[0];
                            //console.log('SE BORRO...... RETORNO -->' + idRetorno);
                            
                            var hDesde = self.reservaSeleccionada.horaDesde + ':00';
                            var selectedText = document.getElementById("horaHasta");
                            var hHasta = horaHasta.options[horaHasta.selectedIndex].text + ':00';
                            
                            //console.log("pIdCliente: " + self.reservaSeleccionada.IdCliente + "pIdComplejo: " + self.IdComplejo + "pIdCancha: " + self.reservaSeleccionada.IdCancha + "pHoraInicio: " + hDesde + "pHoraFin: " + hHasta);
                            
                            DuenioReservasFijasService.query({pIdCliente: self.reservaSeleccionada.IdCliente, pIdComplejo: self.IdComplejo, pIdCancha: self.reservaSeleccionada.IdCancha, pHoraInicio: hDesde, pHoraFin: hHasta}).$promise.then(function(data){ 
                    
                                console.log("Cantidad de reservas:" + data.length);
                                console.log("ID de las reservas");
                                console.log(data);
                                
                                if(data.length == 0)
                                    bootbox.alert("¡Cancelación de reserva exitosa!", function() {});
                                else{

                                    bootbox.confirm("Este cliente tiene reservas fijas.<br> ¿Desea eliminarlas?", function(result) {
                                        if(result)
                                        {
                                            angular.forEach(data, function(h) {

                                                ReservasCancelacionService.delete({idReserva: h.IdReserva}, function(reponse){

                                                    idRetorno = reponse.data[0];
                                                    console.log('SE BORRO...... RETORNO -->' + idRetorno);

                                                },function(errorResponse){
                                                        console.log('ERROR BORRAR RES...' + errorResponse); 
                                                });

                                                //console.log(h.hora.substr(0,5));
                                            });
                                        }
                                    });
                                }
                            });
                            
                            bootbox.alert("¡Cancelación de reserva, y reembolso exitoso!", function() {});
                            },function(errorResponse){
                                console.log('ERROR BORRAR RES...' + errorResponse); 
                            });

                      },function(errorResponse){
                        console.log('ERROR devolucion...' + errorResponse); 
                     }); 
            }
            else
            {
                ReservasCancelacionService.delete({idReserva: self.reservaSeleccionada.IdReserva}, function(reponse){
                    idRetorno = reponse.data[0];
                    console.log('SE BORRO...... RETORNO -->' + idRetorno);
                    
                    var existenReservasFijas = false;
                    
                    var hDesde = self.reservaSeleccionada.horaDesde + ':00';
                    var selectedText = document.getElementById("horaHasta");
                    var hHasta = horaHasta.options[horaHasta.selectedIndex].text + ':00';
                            
                    console.log("pIdCliente: " + self.reservaSeleccionada.IdCliente + "pIdComplejo: " + self.IdComplejo + "pIdCancha: " + self.reservaSeleccionada.IdCancha + "pHoraInicio: " + hDesde + "pHoraFin: " + hHasta);
                            
                    DuenioReservasFijasService.query({pIdCliente: self.reservaSeleccionada.IdCliente, pIdComplejo: self.IdComplejo, pIdCancha: self.reservaSeleccionada.IdCancha, pHoraInicio: hDesde, pHoraFin: hHasta}).$promise.then(function(data){ 
                    
                        
                        console.log("Cantidad de reservas:" + data.length);
                        console.log("ID de las reservas");
                        console.log(data);
                        
                        
                        if(data.length == 0)
                            bootbox.alert("¡Cancelación de reserva exitosa!", function() {});
                        else{

                            bootbox.confirm("Este cliente tiene reservas fijas.<br> ¿Desea eliminarlas?", function(result) {
                                if(result)
                                {
                                    angular.forEach(data, function(h) {

                                        ReservasCancelacionService.delete({idReserva: h.IdReserva}, function(reponse){

                                            idRetorno = reponse.data[0];
                                            console.log('SE BORRO...... RETORNO -->' + idRetorno);

                                        },function(errorResponse){
                                                console.log('ERROR BORRAR RES...' + errorResponse); 
                                        });

                                        //console.log(h.hora.substr(0,5));
                                    });
                                }
                            });
                        }
                    });
                    
                    //self.init();
                    
                },function(errorResponse){
                    console.log('ERROR BORRAR RES...' + errorResponse); 
                });
            }
            self.init();
            $('#reservasModal').modal('hide');
        }
    }); 
};
    
this.llenarComboHorasHasta = function(indice, fila){

    //console.log(indice); //columna
    //console.log(fila);
    //console.log(fila[indice]);
    //console.log("cantidad de horas: " + $scope.CantHoras);
    
    self.horasHasta = [];
    
    var i;
    for (i = 0; i < $scope.CantHoras + 1; i++) {
        
        if($scope.data[i][indice].hora != null && $scope.data[i][indice].hora != undefined && $scope.data[i][indice].hora != ''){
            //jojo
            if(parseInt($scope.data[i][indice].hora.substring(0,2)) > parseInt(fila[indice].hora.substring(0,2))){
                
                //console.log("Usuario: " + $scope.data[i][indice].nombre);
                
                if($scope.data[i][indice].nombre != "Disponible"){
                    self.horasHasta.push({"id": $scope.data[i][indice].hora.substring(0,5), "desc": $scope.data[i][indice].hora.substring(0,5)});
                    break;
                }
                
                self.horasHasta.push({"id": $scope.data[i][indice].hora.substring(0,5), "desc": $scope.data[i][indice].hora.substring(0,5)});
            }
        }  
        
        if(i == $scope.CantHoras){
            
            var ultHora = parseInt($scope.data[i][indice].hora.substring(0,2)) + 1;
            ultHora += ":00";
            
            self.horasHasta.push({"id": ultHora, "desc": ultHora});
        }
    };
    
    $scope.selectedHoraIdHasta = self.horasHasta[0].desc.substring(0,5);
    
    if(self.reservaSeleccionada.Usuario == '')
        self.calcularPago();
};
    
this.calcularPago = function(){
    
    
    //Calculo el precio a pagar siempre y cuando se haya elegido una fecha y hora desde y hasta.
    //console.log('CALCULANDO PRECIO.....');
    ////////NUEVO////////////////////////////////////////////////////
    //Traigo las hora desde y hasta.
    var hd = parseInt(self.reservaSeleccionada.horaDesde.substring(0,2));
    var hh = parseInt($scope.selectedHoraIdHasta.substring(0,2));

    //console.log(hd + " " + hh);

    //Calculo cuantas horas se van a alquilar...
    var horasAlq = hh - hd;
    
    //console.log('horas alq--> ' + horasAlq);
    
    
    var precio = parseFloat(self.reservaSeleccionada.Precio);
    
    //console.log(precio);
    
    var horaLuz = -1;
    
    if(self.reservaSeleccionada.HoraCobroLuz != undefined && self.reservaSeleccionada.HoraCobroLuz != null)
        horaLuz = self.reservaSeleccionada.HoraCobroLuz.substring(0,2);
    
    //console.log('luz desde-->' + horaLuz);
    
    
    var porcentajeLuz = 0;
    
    //console.log("asdadas: " + self.reservaSeleccionada.PorcentajeLuz);
    
    if(self.reservaSeleccionada.PorcentajeLuz != null && self.reservaSeleccionada.PorcentajeLuz != undefined);
        porcentajeLuz = parseFloat(self.reservaSeleccionada.PorcentajeLuz);

    //console.log('porcent luz-->' + porcentajeLuz);

    var horasConLuz = 0;
    if(self.reservaSeleccionada.Luz == 1 && horaLuz != -1)
    {
        for (i=0; i<horasAlq; i++)
        {
            var num =  parseInt(hd + i);
            //console.log(num);
            if(num >= horaLuz)
                horasConLuz++;
        }   
    }
    
    //console.log(horasConLuz);

    var precioAMostrar = 0;
    
    if(horasConLuz == 0)
        precioAMostrar = precio * horasAlq;
    else if(horasConLuz == horasAlq){
        precioAMostrar = (precio * horasAlq) + ((precio * horasAlq) * porcentajeLuz / 100);
        //console.log('precio*horasalq->' + precio * horasAlq);
        //console.log('*' + porcentajeLuz);
    }
    else //Si una parte se cobra con luz y otra no...
        {
            //console.log('porcentajeluz--> ' + porcentajeLuz);
            var precioCLuz = (precio * horasConLuz) + ((precio * horasConLuz) * porcentajeLuz / 100);
            var precioSLuz = (horasAlq - horasConLuz) * precio;

            precioAMostrar = precioCLuz + precioSLuz;
        }

    //console.log('precioamostrar-> ' + precioAMostrar);
    self.reservaSeleccionada.Resta = precioAMostrar;
    self.reservaSeleccionada.totalCalculado = precioAMostrar;
    
};
    
this.reservar = function(aceptaReservaFija){

    var ReservaNueva = new ReservasService();
    var estadoReserva = 0;
    //console.log(self.Fecha.replace('-', '/').replace(' - ', '/'));
    var horaHasta = document.getElementById("horaHasta");
    var selectedText = horaHasta.options[horaHasta.selectedIndex].text;
    self.reservaSeleccionada.UsuarioReserva = document.getElementById("usuario").value.toString();
    
    if(self.reservaSeleccionada.UsuarioReserva == ''){
        
        bootbox.alert("Debe ingresar el nombre del cliente...", function() {});
        return false;
    }
        
    //console.log(horaHasta);

    console.log("Resta: " + self.reservaSeleccionada.Resta);
    
    if(self.reservaSeleccionada.Resta == 0)
        estadoReserva = 2;
    else
        estadoReserva = 1;
    
    ReservaNueva.data= {
        
        'idCliente': 1
        ,'idComplejo' : self.IdComplejo
        ,'idCancha': self.reservaSeleccionada.IdCancha
        ,'fechaPartido' : self.FechaReserva
        ,'horaD' : self.reservaSeleccionada.horaDesde
        ,'horaH' : selectedText
        ,'importeAPagar' : self.reservaSeleccionada.totalCalculado
        ,'pagado' : self.reservaSeleccionada.Pagado
        ,'porcentajePago' : 100
        ,'estadoReserva' : estadoReserva
        ,'usuarioReserva': self.reservaSeleccionada.UsuarioReserva
    }
    
    //console.log(ReservaNueva.data);

    ReservasService.save(ReservaNueva.data, function(reponse){
        idReserva = reponse.data[0];
        console.log('idReserva -->' + idReserva);

        console.log("acepta reserva fija --> " + aceptaReservaFija);
        //Si realizó reserva fija, hago todas las reservas despues de haber reservado la primera normalmente.
        if(aceptaReservaFija == 1)
        {       
            var idDeDia = $scope.dt.getDay() == 0 ? 7 : $scope.dt.getDay();
            var anio = $scope.dt.getFullYear();

            //jojo
            console.log("jojojo: " + self.Fecha);
            self.getFechasReservaFija(self.reservaSeleccionada.horaDesde, selectedText,idDeDia, anio, self.Fecha);
        }    
        
    },function(errorResponse){
        bootbox.alert("Hubo un error al querer reservar la cancha", function() {});
    });  
    
    bootbox.alert("Reserva exitosa", function() {});
    self.init();
    $('#reservasModal').modal('hide');
    
    
    self.reservaSeleccionada.IdCancha = 0;
    self.reservaSeleccionada.horaDesde = '';
    self.reservaSeleccionada.totalCalculado = 0;
    self.reservaSeleccionada.Pagado = 0;
    self.reservaSeleccionada.UsuarioReserva = '';

};
    
this.getFechasReservaFija = function(hDesde, hHast, idDia, anio, fprimerReserva){
    
    ReservasFijasService.query({pIdCancha: self.reservaSeleccionada.IdCancha, pIdComplejo: self.IdComplejo, pHoraDesde:hDesde, pIdDia:idDia, pAnio:anio, pFechaPrimerReserva:fprimerReserva}).$promise.then(function(data){
        
        $scope.FechasReservaFija = data;
        
        //console.log($scope.FechasReservaFija);
        //console.log('PRIMERA FECHA FIJA->' + $scope.FechasReservaFija[0].fecha);


        $scope.noDisponibles = [];
        
        var hHasta = hHast + ":00";
        if($scope.FechasReservaFija.length == 0)
        {
            bootbox.alert("La reserva fija no se hará ya que no hay días disponibles en lo que resta del año para el horario seleccionado...", function() {});
        }
        else
        {
            var noDispEnString = "";
            var importeTotal = parseFloat(self.reservaSeleccionada.totalCalculado);
            var horaHasta = hHast + ":00";
            hDesde += ":00";
            
             angular.forEach($scope.FechasReservaFija, function(aux) {
                 //Guardo las fechas no disponibles para la reserva fija, asi se las muestro al cliente.
                if(aux.NoDisponible != undefined && aux.NoDisponible != null && aux.NoDisponible != "")
                {

                    $scope.noDisponibles.push(aux.NoDisponible); 
                    noDispEnString += aux.NoDisponible + "<br>";
                }
                else
                {
                    $scope.listasReservasFijas.push({idCliente: self.reservaSeleccionada.IdCliente, idComplejo: self.IdComplejo, idCancha: self.reservaSeleccionada.IdCancha, fechaPartido: aux.fecha, horaD: hDesde, horaH: hHasta, importeAPagar: importeTotal, pagado: 0, porcentajePago: 0, estadoReserva: 3, "usuarioReserva": self.reservaSeleccionada.UsuarioReserva});

                }

             });


            if($scope.noDisponibles.length > 0)
            {
                var mensaje = 'La reserva fija se realizará para el día y horario elegido en lo que resta del año. \n ';

                mensaje += 'Sin embargo las siguientes fechas no se podrán reservar ya que no están disponibles: <br> ';
                mensaje += noDispEnString + "\n \n" + '¿Desea realizar la reserva fija igualmente?';

                bootbox.confirm(mensaje, function(result) {
                    if(result)
                    {
                        bootbox.alert("Sólo se paga lo correspondiente a la primer reserva, las fechas restantes las reservará el sistema, y se pagarán personalmente en el complejo. ", function() {});

                        $scope.aceptaReservaFija = 1;

                    }
                    else
                    {
                        $scope.aceptaReservaFija = 0;
                    }
                }); 
            }
            else
            {
                //Se puede hacer la reserva fija por el resto del año para todos los dias!.
                var mensaje = 'La reserva fija se realizará para el día y horario elegido en lo que resta del año. \n ';
                mensaje += noDispEnString + "\n \n" + '¿Desea realizar la reserva fija?';
                bootbox.confirm(mensaje, function(result) {
                if(result)
                {
                    bootbox.alert("Sólo se paga lo correspondiente a la primer reserva, las fechas restantes las reservará el sistema, y se pagarán personalmente en el complejo. ", function() {});

                    $scope.aceptaReservaFija = 1;
                    console.log("acepta 1: " + $scope.aceptaReservaFija);
                    console.log("Entramos a res fija");
                    
                    var ReservaFijaNueva = new ReservasFijasService();

                    ReservaFijaNueva.data = $scope.listasReservasFijas;
                    console.log(ReservaFijaNueva.data[0]);

                    ReservasFijasService.save(ReservaFijaNueva.data, function(reponse){    
                        idReservaFija = reponse.data[0];
                        console.log('idReserva -->' + idReservaFija);                      
                    },function(errorResponse){
                        console.log('ERROR res fija...'); 
                    });
                    
                }
                else
                    $scope.aceptaReservaFija = 0;
                    console.log("acepta 0: " + $scope.aceptaReservaFija);
                });
            }
            
            console.log("acepta: " + $scope.aceptaReservaFija);
            if($scope.aceptaReservaFija == 1){
                
            }
        }
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
    
/**************************************FUNCIONES DE CALENDARIO*********************************************************************************/   
this.completarPago = function(){
    
    console.log(self.reservaSeleccionada.IdReserva);
    
    data = self.reservaSeleccionada;
    
    DuenioReservasCompletarPagoService.save(data, function(reponse){
            
        bootbox.alert("Se completo el pago de esta reserva con éxito!", function() {
                
            $scope.data= [
            ["Hora"]
            ];

            self.init();

            $('#reservasModal').modal('hide');

        });
        
         },function(errorResponse){
             console.log('Error');
    });
    

};

/*************************************SECCION DE LLAMADOS*****************************************************/
self.init();
self.obtenerDiaActual();
    
/******************************SECCION FECHAS********************************************************/ 
    $scope.today = function() {
        $scope.dt = new Date();
      };
      $scope.today();

      $scope.clear = function() {
        $scope.dt = null;
      };
    
         
      $scope.inlineOptions = {
        customClass: getDayClass,
        minDate: new Date(),
        showWeeks: true
      };

      $scope.dateOptions = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2020, 5, 22),
        //minDate: new Date(),
        startingDay: 1
      };

// Disable weekend selection
function disabled(data) {
    var date = data.date,
    mode = data.mode;
    //Acá deshabilito los días que el complejo no abre.
    /*
    0 = domingo.
    1 = lunes.
    2 = martes.
    3 = miercoles.
    4 = jueves.
    5 = viernes.
    6 = sabado.
    */
    //console.log(self.diasComplejo);
    var diasQueAbre = [];
    
    angular.forEach(self.diasComplejo, function(aux) {
        
        //console.log(aux.iddia);
        switch(aux.iddia) {
            case '1':
            diasQueAbre.push(1);
            break;
            case '2':
            diasQueAbre.push(2);
            break;
            case '3':
            diasQueAbre.push(3);
            break;
            case '4':
            diasQueAbre.push(4);
            break;
            case '5':
            diasQueAbre.push(5);
            break;
            case '6':
            diasQueAbre.push(6);
            break;
            case '7':
            diasQueAbre.push(0);
            break;
        }
    });

    //console.log(diasQueAbre);
    return mode === 'day' && diasQueAbre.indexOf(date.getDay()) === -1;
}
    
      $scope.dateOptionsFechaFiltro = {
        dateDisabled: disabled,
        language: 'es-es',  
        formatYear: 'yy',
        maxDate: new Date(2018, 1, 1),
        minDate: new Date(),
        startingDay: 1
      };
    
       $scope.toggleMin = function() {
        $scope.dateOptionsFechaFiltro.minDate = new Date();
      };

      $scope.toggleMin();

      $scope.open1 = function() {
        $scope.popup1.opened = true;
      };

      $scope.open2 = function() {
        $scope.popup2.opened = true;
      };

      $scope.setDate = function(year, month, day) {
        $scope.dt = new Date(year, month, day);
      };

      $scope.formats = ['dd/MM/yyyy', 'dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
      $scope.format = $scope.formats[0];
      $scope.altInputFormats = ['M!/d!/yyyy'];

      $scope.popup1 = {
        opened: false
      };

      $scope.popup2 = {
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
      }

});