package com.delieat.activities;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
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
import com.delieat.models.User;

import org.json.JSONException;
import org.json.JSONObject;

public class RegisterCustomerActivity extends AppCompatActivity{
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_customer);
    }

    public void redirectToLoginActivity(View view) {
        finish();
        Intent login = new Intent(RegisterCustomerActivity.this, LoginActivity.class);
        startActivity(login);
    }

    private void register(String id) {
        final TextView fullNameTextView = findViewById(R.id.fullName);
        final TextView emailTextView = findViewById(R.id.email);
        final TextView phoneNumberTextView = findViewById(R.id.phoneNumber);
        final String fullName = fullNameTextView.getText().toString();
        final String email = emailTextView.getText().toString();
        final String phoneNumber = phoneNumberTextView.getText().toString();

        JSONObject parentData = new JSONObject();
        JSONObject childData = new JSONObject();
        try {
            childData.put("user_id", id);
            childData.put("full_name", fullName);
            childData.put("email", email);
            childData.put("phone_number", phoneNumber);
            parentData.put("customer", childData);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        RequestQueue queue = Volley.newRequestQueue(this);
        final String urlCustomer = "http://10.0.2.2:3000/customer_register";

        final JsonObjectRequest createCustomer = new JsonObjectRequest(Request.Method.POST, urlCustomer, parentData,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
//                        RegisterCustomerActivity.this.finish();
                        Intent login = new Intent(RegisterCustomerActivity.this, LoginActivity.class);
                        startActivity(login);
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
        queue.add(createCustomer);
    }

    public void createUser(View view) {
        final String urlRegister = "http://10.0.2.2:3000/register";
        SharedPreferences sharedPref = getSharedPreferences("registerData", 0);
        String username = sharedPref.getString(User.USERNAME, "");
        String password = sharedPref.getString(User.PASSWORD, "");

        JSONObject parentData = new JSONObject();
        JSONObject childData = new JSONObject();
        try {
            childData.put("username", username);
            childData.put("password", password);
            childData.put("user_type", "customer");
            parentData.put("user", childData);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        RequestQueue queue = Volley.newRequestQueue(this);
        final JsonObjectRequest createUser = new JsonObjectRequest(Request.Method.POST, urlRegister, parentData,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            register(response.getString("id"));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
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
        queue.add(createUser);
    }

}
