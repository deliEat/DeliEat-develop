package com.delieat.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonObjectRequest;
import com.delieat.constants.ApiUrls;
import com.delieat.helpers.HttpHelper;
import com.delieat.helpers.RegistrationHelper;
import com.delieat.models.Owner;
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

    public void createUser(View view) {
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            SharedPreferences sharedPref = getSharedPreferences(RegistrationHelper.REGISTRATION_DATA, 0);
            JSONObject userRegistrationJsonRequest = RegistrationHelper.composeUserRegistrationJsonRequest(sharedPref);

            JsonObjectRequest createUser = new JsonObjectRequest(Request.Method.POST, ApiUrls.REGISTER_USER,
                userRegistrationJsonRequest,
                (response) -> {
                    try {
                        createOwner(response.getString(User.ID));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                },
                (error) -> {
                    Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
                }
            );
            queue.add(createUser);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void createOwner(String userId) {
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            JsonObjectRequest createOwner = new JsonObjectRequest(Request.Method.POST, ApiUrls.REGISTER_OWNER,
                composeOwnerRegistrationJsonRequest(userId),
                (response) -> {
                    finish();
                    Intent ownerHome = new Intent(this, OwnerHomeActivity.class);
                    startActivity(ownerHome);
                },
                (error) -> {
                    Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
                }
            );
            queue.add(createOwner);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private JSONObject composeOwnerRegistrationJsonRequest(String userId) throws JSONException {
        final TextView fullNameTextView = findViewById(R.id.fullName);
        final String fullName = fullNameTextView.getText().toString();

        JSONObject ownerRequest = new JSONObject();
        ownerRequest.put(Owner.USER_ID, userId);
        ownerRequest.put(Owner.FULL_NAME, fullName);
        return new JSONObject().put(Owner.OWNER, ownerRequest);
    }

}
