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
import com.delieat.models.Customer;
import com.delieat.models.User;

import org.json.JSONException;
import org.json.JSONObject;

public class RegisterCustomerActivity extends AppCompatActivity {
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

    public void createUser(View view) {
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            SharedPreferences sharedPref = getSharedPreferences(RegistrationHelper.REGISTRATION_DATA, 0);
            JSONObject userRegistrationJsonRequest = RegistrationHelper.composeUserRegistrationJsonRequest(sharedPref);

            JsonObjectRequest createUser = new JsonObjectRequest(Request.Method.POST, ApiUrls.REGISTER_USER,
                userRegistrationJsonRequest,
                (response) -> {
                    try {
                        createCustomer(response.getString(User.ID));
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

    private void createCustomer(String userId) {
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            JsonObjectRequest createCustomer = new JsonObjectRequest(Request.Method.POST, ApiUrls.REGISTER_CUSTOMER,
                composeCustomerRegistrationJsonRequest(userId),
                (response) -> {
                    finish();
                    Intent customerHome = new Intent(this, CustomerHomeActivity.class);
                    startActivity(customerHome);
                },
                (error) -> {
                    Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
                }
            );
            queue.add(createCustomer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private JSONObject composeCustomerRegistrationJsonRequest(String userId) throws JSONException {
        final TextView fullNameTextView = findViewById(R.id.fullName);
        final TextView emailTextView = findViewById(R.id.email);
        final TextView phoneNumberTextView = findViewById(R.id.phoneNumber);
        final String fullName = fullNameTextView.getText().toString();
        final String email = emailTextView.getText().toString();
        final String phoneNumber = phoneNumberTextView.getText().toString();

        JSONObject customerRequest = new JSONObject();
        customerRequest.put(Customer.USER_ID, userId);
        customerRequest.put(Customer.FULL_NAME, fullName);
        customerRequest.put(Customer.EMAIL, email);
        customerRequest.put(Customer.PHONE_NUMBER, phoneNumber);
        return new JSONObject().put(Customer.CUSTOMER, customerRequest);
    }

}
