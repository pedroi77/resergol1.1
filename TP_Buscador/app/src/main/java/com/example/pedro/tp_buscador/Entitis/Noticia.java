package com.example.pedro.tp_buscador.Entitis;

import android.util.Log;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by Pedro on 27/05/2015.
 */
public class Noticia {
    static DateFormat FORMATTER = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz", Locale.ENGLISH);
    static DateFormat FORMATTER2 = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm zzz", Locale.ENGLISH);
    private String titulo;
    private String descripcion;
    private Date fecha;
    private String link;
    private String linkImagen;
    //imagen
    //array de byte byte[] recomiendan este tipo
    //es un objeto bitmap
    private byte[] imagen;

    public Noticia(){}

    public Noticia(String titulo, String descripcion, Date fecha, String link){
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.link = link;
    }

    public String getTitulo(){
        return this.titulo;
    }

    public void setTitulo(String titulo){
        this.titulo = titulo;
    }

    public String getDescripcion(){
        return this.descripcion;
    }

    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }

    public String getFecha() {
        return FORMATTER.format(this.fecha);
    }

    public void setFecha(String date) {
        try {
            this.fecha = FORMATTER.parse(date);
        } catch (java.text.ParseException e) {
            try{
                this.fecha = FORMATTER2.parse(date);
            }catch (java.text.ParseException d) {
                this.fecha = new Date(1900,1,1);
            }
        }
    }

    public String getLink() {
        return this.link;
    }

    public void setLink(String link){
        this.link = link;
    }

    public String getLinkImagen() {
        return this.linkImagen;
    }

    public void setLinkImagen(String link){
        this.linkImagen = link;
    }



    public byte[] getImagen(){
        return this.imagen;
    }

    public void setImagen(byte[] valor){
        this.imagen = valor;
    }


}
