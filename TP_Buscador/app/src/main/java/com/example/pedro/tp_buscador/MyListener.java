package com.example.pedro.tp_buscador;

import android.app.Activity;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.example.pedro.tp_buscador.Datos.ThreadConexion;

/**
 * Created by alumno on 28/05/2015.
 */
public class MyListener implements View.OnClickListener {
    private Activity a;

    public MyListener(Activity a){
        this.a =a;
    }

    @Override
    public void onClick(View v){
        String url = ((EditText)a.findViewById(R.id.url)).getText().toString();
        Log.d("pepe",url);
    }
}
