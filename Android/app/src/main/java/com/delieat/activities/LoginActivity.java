package com.delieat.activities;

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
import com.android.volley.toolbox.JsonObjectRequest;
import com.delieat.constants.ApiUrls;
import com.delieat.constants.UserSession;
import com.delieat.constants.UserType;
import com.delieat.helpers.HttpHelper;
import com.delieat.models.User;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;

public class LoginActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
    }

    public void login(View view) {
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST, ApiUrls.LOGIN,
                composeLoginJsonRequest(),
                (response) -> {
                    Gson gson = new Gson();
                    User currentUser = gson.fromJson(response.toString(), User.class);

                    startUserSession(currentUser);

                    finish();

                    if (UserType.isCustomer(currentUser.getUserType())) {
                        startActivity(new Intent(this, CustomerHomeActivity.class));
                    } else if (UserType.isOwner(currentUser.getUserType())) {
                        startActivity(new Intent(this, OwnerHomeActivity.class));
                    }
                },
                (error) -> Toast.makeText(getApplicationContext(), R.string.login_fail_msg, Toast.LENGTH_SHORT).show());
            queue.add(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private JSONObject composeLoginJsonRequest() throws JSONException {
        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.fullName);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();

        JSONObject request = new JSONObject();
        request.put(User.USERNAME, username)
            .put(User.PASSWORD, password);
        return request;
    }

    private void startUserSession(User user) {
        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putString(UserSession.USER_ID, user.getId())
            .putString(UserSession.USER_NAME, user.getUsername())
            .putString(UserSession.USER_TYPE, user.getUserType());
        editor.apply();
    }

    public void clickRegister(View view) {
        finish();
        startActivity(new Intent(LoginActivity.this, RegisterActivity.class));
    }

}
