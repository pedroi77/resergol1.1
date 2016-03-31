var duenios = angular.module("resergolApp");

duenios.controller("DueniosController", function(DueniosService, DocumentosService, ProvinciasService){
	
    this.mensajeBienvenida = 'En Resergol te damos la posibilidad de llegar a todos los jugadores del fútbol amateur de manera gratuita. Sólo tenés que completar los siguientes datos y te mandaremos un  e-mail como aviso para que puedas registrar tu complejo!'
    
    var self = this;
    
    this.tiposDoc =[];                      
    this.provincias = [];
    
    
    this.tiposDoc = {
        tipos: [],
        selectedOption: {} 
    };  
    
     
    this.provincias = {
        prov: [],
        selectedOption:{} 
    }; 
    
    DocumentosService.query().$promise.then(function(data) {
        self.tiposDoc.tipos = data;
        self.tiposDoc.tipos.push({idTipoDoc: '-3', Descripcion: 'Tipo doc.'}); //Valor por defecto
    });
    
    ProvinciasService.query().$promise.then(function(data) {
        self.provincias.prov = data;
        self.provincias.prov.push({IdProvincia: '-1', Nombre: 'Provincias'}); //Valor por defecto
    });
    
    
	this.createDuenio = function(){
     
       var duenioNuevo = new DueniosService();
        
       duenio.duenioNuevo = {
            "usuario": "LB",
            "contrasenia": "7744",
            "nombre": "Lucas",
            "apellido": "Biglia",
            "idTipoDoc": 1,
            "nroDoc": 25444670,
            "email": "test@gmail.com",
            "valor": -5
	       };    
        
        console.log("estoy en el createDuenio");
        console.log(duenioNuevo.data);
        
      
        
        DueniosService.save(duenioNuevo.data, function(reponse){
          alert("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
        },function(errorResponse){
            console.log(errorResponse.data.message);  
        });
      
    };
});

