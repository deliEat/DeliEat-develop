package com.delieat.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import com.delieat.constants.UserType;
import com.delieat.helpers.RegistrationHelper;
import com.delieat.models.Customer;
import com.delieat.models.Owner;
import com.delieat.models.User;

import org.json.JSONException;
import org.json.JSONObject;

public class RegisterDetailActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_detail);
    }

    public void redirectToLoginActivity(View view) {
        finish();
        Intent login = new Intent(RegisterDetailActivity.this, LoginActivity.class);
        startActivity(login);
    }

    public void createUser(View view) {
//        UserType userType = (UserType) getIntent().getSerializableExtra(User.USER_TYPE);
//        String requestUrl = userType == UserType.OWNER ? ApiUrls.REGISTER_OWNER : ApiUrls.REGISTER_CUSTOMER;
//
//        RequestQueue queue = HttpHelper.INSTANCE.provideRequestQueue(getApplicationContext());
//        try {
//            JSONObject request = composeUserRegistrationRequest(userType);
//            JsonObjectRequest createUserRequest = new JsonObjectRequest(Request.Method.POST, requestUrl, request,
//                (response) -> {
//                    try {
//                        finish();
//                        startActivity(new Intent(this, LoginActivity.class));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                },
//                (error) -> {
//                    Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
//                }
//            );
//            queue.add(createUserRequest);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

    private JSONObject composeUserRegistrationRequest(UserType userType) throws JSONException {
        SharedPreferences sharedPref = getSharedPreferences(RegistrationHelper.REGISTRATION_DATA, 0);
        String username = sharedPref.getString(User.USERNAME, "");
        String password = sharedPref.getString(User.PASSWORD, "");

        JSONObject user = new JSONObject();
        user.put(User.USERNAME, username);
        user.put(User.PASSWORD, password);
        user.put(User.USER_TYPE, userType.getRepresentation());

        JSONObject request = new JSONObject();
        request.put(User.USER, user);

        if (userType == UserType.OWNER) {
            request.put(Owner.OWNER, composeOwnerDetailRequest());
        } else {
            request.put(Customer.CUSTOMER, composeCustomerDetailRequest());
        }

        return request;
    }

    private JSONObject composeOwnerDetailRequest() throws JSONException {
        final TextView fullNameTextView = findViewById(R.id.fullName);
        final TextView emailTextView = findViewById(R.id.email);
        final TextView phoneNumberTextView = findViewById(R.id.phoneNumber);
        final String fullName = fullNameTextView.getText().toString();
        final String email = emailTextView.getText().toString();
        final String phoneNumber = phoneNumberTextView.getText().toString();

        JSONObject owner = new JSONObject();
        owner.put(Owner.FULL_NAME, fullName);
        owner.put(Owner.EMAIL, email);
        owner.put(Owner.PHONE_NUMBER, phoneNumber);
        return owner;
    }

    private JSONObject composeCustomerDetailRequest() throws JSONException {
        final TextView fullNameTextView = findViewById(R.id.fullName);
        final TextView emailTextView = findViewById(R.id.email);
        final TextView phoneNumberTextView = findViewById(R.id.phoneNumber);
        final String fullName = fullNameTextView.getText().toString();
        final String email = emailTextView.getText().toString();
        final String phoneNumber = phoneNumberTextView.getText().toString();

        JSONObject customer = new JSONObject();
        customer.put(Customer.FULL_NAME, fullName);
        customer.put(Customer.EMAIL, email);
        customer.put(Customer.PHONE_NUMBER, phoneNumber);
        return customer;
    }

}
