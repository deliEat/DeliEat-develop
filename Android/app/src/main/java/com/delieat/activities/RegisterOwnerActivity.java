package com.delieat.activities;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.delieat.constants.ApiUrls;
import com.delieat.helpers.HttpHelper;
import com.delieat.models.User;

import org.json.JSONException;
import org.json.JSONObject;

public class RegisterOwnerActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_owner);
    }

    public void redirectToLoginActivity(View view) {
        finish();
        Intent login = new Intent(RegisterOwnerActivity.this, LoginActivity.class);
        startActivity(login);
    }

    private void register(String id) {
        final TextView fullNameTextView = findViewById(R.id.fullName);
        final String fullName = fullNameTextView.getText().toString();

        JSONObject parentData = new JSONObject();
        JSONObject childData = new JSONObject();
        try {
            childData.put("user_id", id);
            childData.put("name", fullName);
            parentData.put("owner", childData);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());

        final JsonObjectRequest createOwner = new JsonObjectRequest(Request.Method.POST, ApiUrls.REGISTER_OWNER, parentData,
            new Response.Listener<JSONObject>() {
                @Override
                public void onResponse(JSONObject response) {
//                        RegisterCustomerActivity.this.finish();
                    Intent login = new Intent(RegisterOwnerActivity.this, LoginActivity.class);
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
        queue.add(createOwner);
    }

    public void createUser(View view) {
        SharedPreferences sharedPref = getSharedPreferences("registerData", 0);
        String username = sharedPref.getString(User.USERNAME, "");
        String password = sharedPref.getString(User.PASSWORD, "");

        JSONObject parentData = new JSONObject();
        JSONObject childData = new JSONObject();
        try {
            childData.put("username", username);
            childData.put("password", password);
            childData.put("user_type", "owner");
            parentData.put("user", childData);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        final JsonObjectRequest createUser = new JsonObjectRequest(Request.Method.POST, ApiUrls.REGISTER_USER, parentData,
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
