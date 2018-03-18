package com.delieat.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class LoginActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    public void login(View view) {
        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.password);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();

        RequestQueue queue = Volley.newRequestQueue(this);
        final String url ="http://10.0.2.2:3000/login";

        StringRequest stringRequest = new StringRequest(Request.Method.POST, url,
            new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    System.out.println(response);
                    if ("C".equalsIgnoreCase(response)) {
                        startActivity(new Intent(LoginActivity.this, CustomerHomeActivity.class));
                    } else if ("R".equalsIgnoreCase(response)) {
                        startActivity(new Intent(LoginActivity.this, ManagerHomeActivity.class));
                    }
                }
            },
            new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    // TODO
                }
            }
        ) {
            @Override
            protected Map<String,String> getParams() {
                Map<String,String> params = new HashMap<>();

                params.put("username", username);
                params.put("password", password);

                return params;
            }

            @Override
            public Map<String, String> getHeaders() {
                Map<String,String> params = new HashMap<>();

                params.put("Content-Type","application/x-www-form-urlencoded");
                params.put("Accept", "text/plain");

                return params;
            }
        };

        queue.add(stringRequest);
    }

}
