package com.example.pedro.tp_buscador;

import android.content.Intent;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;


public class MainActivityWeb extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_activity_web);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main_activity_web, menu);

        WebView webViewNoticia = (WebView) findViewById(R.id.webViewNoticia);
        String cargando =  getResources().getString(R.string.cargando);

        //Habilito JavaScrip
        WebSettings webSettings = webViewNoticia.getSettings();
        webSettings.setJavaScriptEnabled(true);

        //Recupero los datos que me pasan
        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        String url = extras.getString("url");

        //Cargamos la URL
        webViewNoticia.setWebViewClient(new WebViewClient());
        Toast.makeText(this, cargando, Toast.LENGTH_SHORT).show();
        webViewNoticia.loadUrl(url);
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
