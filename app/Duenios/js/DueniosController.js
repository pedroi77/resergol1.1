var duenios = angular.module("resergolApp");

duenios.controller("DueniosController", function(DueniosService){
	
    
    //cambiar a partir de aca por cliente
    
	this.createDuenio = function(){
     
       var duenio = new DueniosService();
        
       duenio.data = {
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
        console.log(duenio.data);
        
      
        
        DueniosService.save(duenio.data, function(reponse){
          alert("El registro se realizo correctamente! " + reponse.data);  //Quitar el id
        },function(errorResponse){
            console.log(errorResponse.data.message);  
        });
      
    };
});

