/*codigo de ejemplo del profesor*/
var resergolApp = angular.module("resergolApp");

resergolApp.controller("VerCanchaController", function($state){
	
	          
    this.mostrarReservar = function(){
             $state.go('Clientes.verCancha.Reservar');  
    };

 
	
});
