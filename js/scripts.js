
$(document).ready(function(){  /* jQuery toggle layout */

$('#btnToggle').click(function(){
  if ($(this).hasClass('on')) {
    $('#main .col-md-6').addClass('col-md-4').removeClass('col-md-6');
    $(this).removeClass('on');
  }
  else {
    $('#main .col-md-4').addClass('col-md-6').removeClass('col-md-4');
    $(this).addClass('on');
  }
});
});

$(window).bind("load resize slid.bs.carousel", function() {
  var imageHeight = $(".active .holder").height();
  $(".controllers").height( imageHeight );
  console.log("Slid");
});

$(document).ready(function() {
  $(".carousel").carousel({
    interval: 2000
  });
  $(".carousel").on("slid", function() {
    var to_slide;
    to_slide = $(".carousel-item.active").attr("data-slide-no");
    $(".myCarousel-target.active").removeClass("active");
    $(".carousel-indicators [data-slide-to=" + to_slide + "]").addClass("active");
  });
  $(".myCarousel-target").on("click", function() {
    $(this).preventDefault();
    $(".carousel").carousel(parseInt($(this).attr("data-slide-to")));
    $(".myCarousel-target.active").removeClass("active");
    $(this).addClass("active");
  });
});



function init_map() {
		var var_location = new google.maps.LatLng(45.430817,12.331516);
 
        var var_mapoptions = {
          center: var_location,
          zoom: 14
        };
 
		var var_marker = new google.maps.Marker({
			position: var_location,
			map: var_map,
			title:"Venice"});
 
        var var_map = new google.maps.Map(document.getElementById("map-container"),
            var_mapoptions);
 
		var_marker.setMap(var_map);	
 
      }
 
 /*     google.maps.event.addDomListener(window, 'load', init_map);*/


/*<PI> funciones agregadas por Pedro Irala. INICIO*/
 function validaLogin(){
    
    if(document.getElementById("usuario").value == "dueño"){
      /*window.open("DuenioPrincipal.html", "_self");  /*Con resergol no funciona*/
      window.open("app/Duenios/Templates/DuenioPrincipal.html", ""); 
    }
    else{
      
    }
  }
 
  
  function mostrarCalendario(){
      $('#fecha').datepicker("show");
  }
 

 

 /*<pi> FIN*/
 
//*Metodos de Maty
/*
function muestra_oculta(id)
{
    if (document.getElementById)
    { 
        //se define la variable "el" igual a nuestro div
        var el = document.getElementById(id); 
        
        //damos un atributo display:none que oculta el div
        if(el.id == "filtroCancha")
        {
            var filtroComplejo = document.getElementById("filtroComplejo"); 
            
            el.style.display = (el.style.display == 'none') ? 'block' : 'none'; 
            filtroComplejo.style.display = (filtroComplejo.style.display == 'block') ? 'none' : 'block'; 
        }
        else if(el.id == "filtroComplejo")
        {
            var filtroCancha = document.getElementById("filtroCancha");
            
            el.style.display = (el.style.display == 'none') ? 'block' : 'none'; 
            
            filtroCancha.style.display = (filtroCancha.style.display == 'block') ? 'none' : 'block'; 
        }
    }
}

//hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente
window.onload = function(){
    //"contenido_a_mostrar" es el nombre que le dimos al DIV 
    muestra_oculta('filtroCancha');
} 
    */
/*Fin metodos de Maty*/    


/*IVAN-TOOLTIP*/
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
/*FIN IVAN TOOLTIP*/

