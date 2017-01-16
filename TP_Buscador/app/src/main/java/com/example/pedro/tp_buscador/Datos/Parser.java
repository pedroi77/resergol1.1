package com.example.pedro.tp_buscador.Datos;

import android.util.Log;

import com.example.pedro.tp_buscador.Entitis.Noticia;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Pedro on 07/06/2015.
 */
public class Parser {


    public static List<Noticia> ParsearXml(String sXml) {

        XmlPullParserFactory factory;
        XmlPullParser xml;            // Almacena el fichero xml
        int evento;                   // Almacena el evento producido
        boolean isItem;                // Almacena si se ha leido un item
        boolean isTitle;                // Almacena si se ha leido el título
        boolean isLink;                // Almacena si se ha leido el link
        boolean isPubDate;            // Almacena si se ha leido la fecha de publicación
        boolean isDescripcion;        // Almacena si se ha leido la descripcion
        List<Noticia> listNoticias;
        Noticia unaNoticia;


        listNoticias = new ArrayList<>();
        unaNoticia = null;



        // Inicializa los valores booleanos
        isItem = false;
        isTitle = false;
        isLink = false;
        isPubDate = false;
        isDescripcion = false;


        //Log.d("pepe", sXml);
        try {
            // Obtiene el fichero xml
            factory = XmlPullParserFactory.newInstance();
            factory.setNamespaceAware(true);
            xml = factory.newPullParser();
            xml.setInput(new StringReader(sXml));

            evento = xml.getEventType();  // Obtiene el evento producido

            // Recorre el fichero xl
            while (evento != XmlPullParser.END_DOCUMENT) {
                switch (evento) {
                    case XmlPullParser.START_TAG:
                        //Log.d("PEPE", "START_TAG"  + xml.getName());

                        if (xml.getName().equals("item")) {
                            if (isItem) {
                                listNoticias.add(unaNoticia);
                            } else {
                                isItem = true;
                            }
                            unaNoticia = new Noticia();
                        }else if (xml.getName().equals("title")) {
                            isTitle = true;
                        }else if (xml.getName().equals("description")) {
                            isDescripcion = true;
                        }else if (xml.getName().equals("pubDate")) {
                            isPubDate = true;
                        }else if (xml.getName().equals("thumbnail")) {
                            unaNoticia.setLinkImagen(xml.getAttributeValue(2));
                        }else if (xml.getName().equals("link")) {
                            isLink = true;
                        }

                        break;

                    case XmlPullParser.TEXT:
                        if (isItem) {
                            if (isTitle) {
                                unaNoticia.setTitulo(xml.getText());
                            }else if (isDescripcion) {
                                unaNoticia.setDescripcion(Util.sinEstilos(xml.getText()));
                            }else if (isLink) {
                                unaNoticia.setLink(xml.getText());
                            }else if (isPubDate) {
                                unaNoticia.setFecha(xml.getText());
                            }
                        }

                        break;

                    case XmlPullParser.END_TAG:
                        isTitle = false;
                        isLink = false;
                        isPubDate = false;
                        isDescripcion = false;

                        break;
                }

                evento = xml.next();
            }

            listNoticias.add(unaNoticia); //Agrego la ultima noticia

            //Log.d("PEPE", Integer.toString(listNoticias.size()) );

        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return listNoticias;
    }

}