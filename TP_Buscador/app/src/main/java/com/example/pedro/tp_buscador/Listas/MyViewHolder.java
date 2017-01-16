package com.example.pedro.tp_buscador.Listas;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.example.pedro.tp_buscador.R;

import java.util.List;

/**
 * Created by Pedro on 27/05/2015.
 */
public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener  {

    public TextView txtFecha;
    public TextView txtTitulo;
    public TextView txtDescripcion;
    //No se si va la url
    public ImageView imvFoto;

    private int position;
    private MyItemClick listener;

    public MyViewHolder(View itemView,MyItemClick listener) {
        super(itemView);

        // cargar las referencias de los textviews desde la view
        this.txtFecha = (TextView) itemView.findViewById(R.id.txtFecha);
        this.txtTitulo = (TextView) itemView.findViewById(R.id.txtTitulo);
        this.txtDescripcion = (TextView) itemView.findViewById(R.id.txtDescripcion);
        this.imvFoto = (ImageView) itemView.findViewById(R.id.imvFoto);
        itemView.setOnClickListener(this);
        this.listener=listener;
    }


    public void setPosition(int p)
    {
        this.position = p;
    }

    @Override
    public void onClick(View v) {
        // usar el objeto listener para reportar el evetno de click sobre este item
        this.listener.clickEnNoticia(position);
    }
}
