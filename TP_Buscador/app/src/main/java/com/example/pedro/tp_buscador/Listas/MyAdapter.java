package com.example.pedro.tp_buscador.Listas;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;

import com.example.pedro.tp_buscador.Datos.Util;
import com.example.pedro.tp_buscador.Entitis.Noticia;
import com.example.pedro.tp_buscador.R;

import java.util.List;

/**
 * Created by Pedro on 27/05/2015.
 */
public class MyAdapter extends Adapter<MyViewHolder> {

    private List<Noticia> lista;
    private MyItemClick listener;

    public MyAdapter(List<Noticia> lista, MyItemClick listener)
    {
        this.lista = lista;
        this.listener = listener;
    }


    @Override
    public MyViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_layout, parent, false);
        MyViewHolder myViewHolder = new MyViewHolder(v,this.listener);
        return myViewHolder;
    }

    @Override
    public void onBindViewHolder(MyViewHolder holder, int position) {

        Noticia n = lista.get(position);

        // Cargar los textviews del holder con los datos de "c"
        holder.txtFecha.setText(Util.getFecha(n.getFecha()));
        holder.txtTitulo.setText(n.getTitulo());
        holder.txtDescripcion.setText(n.getDescripcion());
        //imagen y url
        if(n.getImagen() != null) {
            Bitmap bip = BitmapFactory.decodeByteArray(n.getImagen(), 0, n.getImagen().length);
            holder.imvFoto.setImageBitmap(bip);
        }
        else {
            holder.imvFoto.setImageResource(R.drawable.rss);
        }
        holder.setPosition(position);
    }

    @Override
    public int getItemCount() {
        return lista.size();
        //return 4;
    }

}
