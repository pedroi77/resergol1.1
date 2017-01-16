package com.example.pedro.tp_buscador.Datos;

/**
 * Created by Pedro on 10/06/2015.
 */
public class Util {

    public static String getFecha(String cadena){

        String fechaOut;
        String dia;
        String mes;
        String anio;

        //esto es harcode ver la forma de hacerlo mas bien
        //"Tue, 09 Jun 2015 21:28:00 GMT"";
        dia = cadena.substring(5,7);
        mes = cadena.substring(8,11);
        anio = cadena.substring(12,16);

        if(mes.equals("Jan"))  {
            mes= "01";
        }
        if(mes.equals("Feb"))  {
            mes= "02";
        }
        if(mes.equals("Mar"))  {
            mes= "03";
        }
        if(mes.equals("Apr"))  {
            mes= "04";
        }
        if(mes.equals("May"))  {
            mes= "05";
        }
        if(mes.equals("Jun"))  {
            mes= "06";
        }
        if(mes.equals("Jul"))  {
            mes= "07";
        }
        if(mes.equals("Aug"))  {
            mes= "08";
        }
        if(mes.equals("Sep"))  {
            mes= "09";
        }
        if(mes.equals("Oct"))  {
            mes= "10";
        }
        if(mes.equals("Nov"))  {
            mes= "11";
        }
        if(mes.equals("Dec"))  {
            mes= "12";
        }

        return dia + "/" + mes + "/" + anio;
    }

    public static String sinEstilos(String cadena){

        cadena = cadena.replace("<b>", "");
        cadena = cadena.replace("</b>", "");
        cadena = cadena.replace("<p>", "");
        cadena = cadena.replace("</p>", "");
        cadena = cadena.replace("<div>", "");
        cadena = cadena.replace("</div>", "");
        cadena = cadena.replace("<a>", "");
        cadena = cadena.replace("</a>", "");

        return cadena;
    }

}
