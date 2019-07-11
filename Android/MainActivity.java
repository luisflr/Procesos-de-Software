package com.uprocesos.jm_servac;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;

public class MainActivity extends AppCompatActivity {
    Button siguiente;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        siguiente = (Button)findViewById(R.id.button);
    }

    public void EnviarOnClick(View v)
    {

        Thread nt = new Thread(){

            EditText et_numero1 = (EditText)findViewById(R.id.edt1);
            EditText et_numero2 = (EditText)findViewById(R.id.Contraseña);
            String res;
            @Override
            public void run()
            {
                String NAMESPACE = "http://tempuri.org/";
                String URL = "http://192.168.0.29:45455/WebService1.asmx";
                String METHOD_NAME = "Login";
                String SOAP_ACTION = "http://tempuri.org/Login";

                //Intent siguiente = new Intent(MainActivity.this,Main2Activity.class);
                //startActivity(siguiente);

                SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
                request.addProperty("Usuario", (et_numero1.getText().toString()));
                request.addProperty("Password", (et_numero2.getText().toString()));

                SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
                envelope.dotNet = true;

                envelope.setOutputSoapObject(request);
                HttpTransportSE transporte  = new HttpTransportSE(URL);

                try {
                    transporte.call(SOAP_ACTION, envelope);
                    SoapPrimitive resultado_xml = (SoapPrimitive) envelope.getResponse();
                    res = resultado_xml.toString();
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (XmlPullParserException e) {
                    e.printStackTrace();
                }

                runOnUiThread( new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(MainActivity.this, res, Toast.LENGTH_LONG ).show();
                        TextView result = (TextView) findViewById(R.id.ttv1);


                        if (res.equals("null"))
                        {
                            res = "no data found";
                            result.setText(res);
                        }

                        else
                        {
                            System.out.print(res);
                            Intent siguiente = new Intent(MainActivity.this, Main2Activity.class);
                            startActivity(siguiente);


                        }

                    }
                });

            }
        };

        nt.start();


    }


}
