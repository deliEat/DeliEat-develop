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
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.delieat.constants.UserSession;
import com.delieat.constants.UserType;
import com.delieat.models.User;
import com.google.gson.Gson;

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
        final String url = "http://10.0.2.2:3000/login";

        StringRequest stringRequest = new StringRequest(Request.Method.POST, url,
            new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    Gson gson = new Gson();
                    User currentUser = gson.fromJson(response, User.class);
                    startUserSession(currentUser);
                    if (UserType.isCustomer(currentUser.getUserType())) {
                        startActivity(new Intent(LoginActivity.this, CustomerHomeActivity.class));
                    } else if (UserType.isOwner(currentUser.getUserType())) {
                        startActivity(new Intent(LoginActivity.this, OwnerHomeActivity.class));
                    }
                }
            },
            new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Context context = getApplicationContext();
                    CharSequence text = getString(R.string.login_fail_msg);
                    int duration = Toast.LENGTH_SHORT;

                    Toast toast = Toast.makeText(context, text, duration);
                    toast.show();
                }
            }
        ) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();

                params.put("username", username);
                params.put("password", password);

                return params;
            }

            @Override
            public Map<String, String> getHeaders() {
                Map<String, String> params = new HashMap<>();

                params.put("Content-Type", "application/x-www-form-urlencoded");
                params.put("Accept", "text/plain");

                return params;
            }
        };

        queue.add(stringRequest);
    }

    public void clickRegister(View view) {
        startActivity(new Intent(LoginActivity.this, RegisterActivity.class));
    }

    private void startUserSession(User user) {
        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString(UserSession.USER_ID, user.getId())
            .putString(UserSession.USER_NAME, user.getUsername())
            .putString(UserSession.USER_TYPE, user.getUserType());
        editor.apply();
    }

}
