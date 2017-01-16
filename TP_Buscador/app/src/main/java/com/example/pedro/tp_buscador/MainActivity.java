package com.example.pedro.tp_buscador;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.EditText;
import android.view.View;

import com.example.pedro.tp_buscador.Datos.Parser;
import com.example.pedro.tp_buscador.Datos.PoolThread;
import com.example.pedro.tp_buscador.Entitis.Noticia;
import com.example.pedro.tp_buscador.Listas.MyItemClick;
import com.example.pedro.tp_buscador.Datos.ThreadConexion;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import android.os.Handler;
import android.widget.Toast;

import java.io.StringReader;


import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.IOException;


public class MainActivity extends ActionBarActivity implements MyItemClick, Handler.Callback, View.OnClickListener  {

    private List<Noticia> listaNoticias;
    private  String xmlRss;
    ScreenManager sm;
    byte[] imagen;
   // private ThreadPoolExecutor executor;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        listaNoticias = new ArrayList<>();


        View.OnClickListener miListener = new MyListener(this);

        Button btnLeer = (Button) findViewById(R.id.btnBuscar);
        EditText txturl = (EditText) findViewById(R.id.url);


        btnLeer.setText(R.string.botonLeer);
        txturl.setHint(R.string.editmsj);
        btnLeer.setOnClickListener(this);


        sm = new ScreenManager(this,this);
        sm.mostrarLista(listaNoticias);
/*
        Handler h = new Handler(this); //Le paso this porque es quien escucha los msjs
        //ThreadConexion tc2 = new ThreadConexion("http://www.infobae.com/rss/hoy.xml",false,h);
        //ThreadConexion tc2 = new ThreadConexion("http://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss",false,h);
        ThreadConexion tc2 = new ThreadConexion("http://rss.cnn.com/rss/edition.rss",false,h);
        Thread t2 = new Thread(tc2);
        t2.start();
        sm = new ScreenManager(this,this);
        sm.mostrarLista(listaNoticias);*/

    }
    @Override
    public void onClick(View v){
        this.listaNoticias = null;
        String http = getResources().getString(R.string.http);
        String urlAviso = getResources().getString(R.string.urlAviso);
        String cargando =  getResources().getString(R.string.cargando);
        String url = ((EditText)findViewById(R.id.url)).getText().toString();


        if(url.isEmpty()){
            Toast.makeText(this, urlAviso, Toast.LENGTH_LONG).show();
            return;
        }
        //Valido que tenga el http, si no lo tiene se lo agrego
        if (!url.startsWith(http)){
            url = http + url;
        }
        Toast.makeText(this, cargando, Toast.LENGTH_SHORT).show();
        Handler h = new Handler(this); //Le paso this porque es quien escucha los msjs
        //ThreadConexion tc = new ThreadConexion("http://www.infobae.com/rss/hoy.xml",false,h);
       //ThreadConexion tc = new ThreadConexion("http://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss",false,h);
        //ThreadConexion tc = new ThreadConexion("http://rss.cnn.com/rss/edition.rss",false,h);

        ThreadConexion tc = new ThreadConexion(url,false,h);
        Thread t2 = new Thread(tc);
        t2.start();

    }

@Override
public boolean handleMessage(Message msg) {
        String error = getResources().getString(R.string.errporConexion);
        switch(msg.arg1)
        {
            case 0:
                Toast.makeText(this, error, Toast.LENGTH_SHORT).show();
                break;//Error
            case 1:
                //Log.d("pepe","Recibiendo bytes (imagen) pos " + msg.arg2);
                byte[] data =  (byte[]) msg.obj;
                listaNoticias.get(msg.arg2).setImagen(data);
                break;
            case 2:
                //Log.d("pepe", "Llego msj" + msg.obj.toString());
                xmlRss = msg.obj.toString();
                listaNoticias = Parser.ParsearXml(xmlRss);
                sm.mostrarLista(listaNoticias);

                //busco imagenes
                Handler h = new Handler(this);
                PoolThread pools = new PoolThread();
                for(int i = 0; i< listaNoticias.size(); i++) {
                    Noticia n = listaNoticias.get(i);
                    if(n.getLinkImagen() != null) {
                        ThreadConexion tc = new ThreadConexion(n.getLinkImagen(), true, h, i);
                        pools.ejecutaTarea(tc);
                    }
                }
                pools.terminaServidor();
                break;
        }
        return true;
}



    @Override
    public void clickEnNoticia(int pos) { // Llega la posicion del item sobre el que se hizo click
        Noticia n = null;
        String cargando =  getResources().getString(R.string.cargando);

        n = listaNoticias.get(pos);

        //Log.d("PEPE", n.getLink());

        Intent i = new Intent( this , MainActivityWeb.class);
        i.putExtra("url", n.getLink());
        Toast.makeText(this, cargando, Toast.LENGTH_SHORT).show();
        startActivity(i);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
