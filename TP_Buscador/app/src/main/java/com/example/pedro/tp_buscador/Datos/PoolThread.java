package com.example.pedro.tp_buscador.Datos;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * Created by Pedro on 17/06/2015.
 */
public class PoolThread {

    private ThreadPoolExecutor executor;

    public PoolThread() {
        //executor = (ThreadPoolExecutor) Executors.newCachedThreadPool();//Crea el objeto executor o un pool de threads
        executor = (ThreadPoolExecutor) Executors.newFixedThreadPool(10);//Crea el objeto con solo 10 hilos al mismo tiempo
    }
    public void ejecutaTarea(ThreadConexion tarea) {
        executor.execute(tarea);// Ejecuta una tarea
    }
    public void terminaServidor () {
        executor.shutdown();// Este metodo termina el executor
    }
}
