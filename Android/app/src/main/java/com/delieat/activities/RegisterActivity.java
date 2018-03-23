package com.delieat.activities;

import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class RegisterActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
    }

    public void register(View view) {
        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.password);
        final TextView userTypeTextView = findViewById(R.id.userType);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();
        final String userType = userTypeTextView.getText().toString();

        JSONObject parentData = new JSONObject();
        JSONObject childData = new JSONObject();
        try {
            childData.put("username", username);
            childData.put("password", password);
            childData.put("user_type", userType);
            parentData.put("user", childData);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        RequestQueue queue = Volley.newRequestQueue(this);
        final String url = "http://10.0.2.2:3000/register";

        JsonObjectRequest stringRequest = new JsonObjectRequest(Request.Method.POST, url, parentData,
            new Response.Listener<JSONObject>() {
                @Override
                public void onResponse(JSONObject response) {
                    System.out.println(response.toString());
                    finish();
                }
            },
            new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    System.out.println(error.toString());
                    Context context = getApplicationContext();
                    CharSequence text = error.toString();
                    int duration = Toast.LENGTH_SHORT;

                    Toast toast = Toast.makeText(context, text, duration);
                    toast.show();
                }
            }
        );

        queue.add(stringRequest);
    }
}
