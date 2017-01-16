package com.example.pedro.tp_buscador;

import android.app.Activity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.widget.Button;

import com.example.pedro.tp_buscador.Entitis.Noticia;
import com.example.pedro.tp_buscador.Listas.MyAdapter;
import com.example.pedro.tp_buscador.Listas.MyItemClick;

import java.util.List;

/**
 * Created by Pedro on 27/05/2015.
 */
public class ScreenManager {

    private Activity a;
    private RecyclerView list;
    private MyItemClick listener;

    public ScreenManager(Activity a,MyItemClick listener)
    {
        // Completar constructor
        this.a = a;
        this.listener = listener;
        list = (RecyclerView) a.findViewById(R.id.list);
    }

    public void mostrarLista(List<Noticia> listaNoticias)
    {
        LinearLayoutManager layoutManager = new LinearLayoutManager(a);
        list.setLayoutManager(layoutManager);

        MyAdapter adapter = new MyAdapter(listaNoticias,this.listener);

        list.setAdapter(adapter);
    }
}
