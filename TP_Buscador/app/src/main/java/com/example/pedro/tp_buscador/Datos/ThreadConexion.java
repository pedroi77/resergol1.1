package com.example.pedro.tp_buscador.Datos;

import android.os.Handler;
import android.os.Message;
import android.util.Log;

/**
 * Created by Pedro on 10/06/2015.
 */
public class ThreadConexion implements Runnable  {
    private String url;
    private boolean flagBytesString;
    private Handler h;
    private int indice;

    /*	Recibimos un Handler, la URL y un flag que indica si leemos bytes o String
     *
     */
    public ThreadConexion(String url,boolean flagBytesString, Handler h)
    {
        this.url = url;
        this.flagBytesString=flagBytesString;
        this.h= h;
    }

    public ThreadConexion(String url,boolean flagBytesString, Handler h,int indice)
    {
        this(url, flagBytesString, h);
        this.indice = indice;
    }


    /*
     * Metodo run del thread, se conecta a la url y recupera los datos que envio por el handler
     *
     */
    public void run() {

        Message msg = new Message();
        msg.arg1 = 0; //error

        HttpManager httpManager = new HttpManager(url);

        try{

            if(flagBytesString)
            {
                byte[] bytesRespuesta;
                bytesRespuesta = httpManager.getBytesDataByGET();
                // cargar respuesta en mensaje
                msg.arg1 = 1;
                msg.arg2 = this.indice; //Le devuelvo el indice de la imagen
                msg.obj = bytesRespuesta;
            }
            else
            {
                String strRespuesta;
                strRespuesta = httpManager.getStrDataByGET();
                // cargar respuesta en mensaje

                msg.arg1 = 2;
                msg.obj =strRespuesta;
            }

        }catch(Exception e)
        {
            Log.d("http", "ERROR");
            msg.arg1=0;
        }

        // Enviar mensaje
        h.sendMessage(msg);
    }
}
