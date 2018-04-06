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
import com.delieat.models.Customer;
import com.delieat.models.Owner;
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
                    try {
                        finish();

                        String userType = response.getString(User.USER_TYPE);
                        if (UserType.isCustomer(userType)) {
                            Customer customer = new Gson().fromJson(
                                response.getJSONObject(Customer.CUSTOMER).toString(), Customer.class);
                            startCustomerSession(customer);
                            startActivity(new Intent(this, CustomerHomeActivity.class));
                        } else if (UserType.isOwner(userType)) {
                            Owner owner = new Gson().fromJson(
                                response.getJSONObject(Owner.OWNER).toString(), Owner.class);
                            startOwnerSession(owner);
                            startActivity(new Intent(this, OwnerHomeActivity.class));
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
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

    private void startOwnerSession(Owner owner) {
        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putInt(UserSession.USER_ID, owner.getUser_id())
            .putString(UserSession.USER_TYPE, UserType.OWNER.getRepresentation())
            .putInt(UserSession.OWNER_ID, owner.getId())
            .putString(UserSession.FULL_NAME, owner.getFull_name())
            .putString(UserSession.PHONE_NUMBER, owner.getPhone_number())
            .putString(UserSession.EMAIL, owner.getEmail());
        editor.apply();
    }

    private void startCustomerSession(Customer customer) {
        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        SharedPreferences.Editor editor = sharedPref.edit();
        editor.putInt(UserSession.USER_ID, customer.getUser_id())
            .putString(UserSession.USER_TYPE, UserType.CUSTOMER.getRepresentation())
            .putInt(UserSession.CUSTOMER_ID, customer.getId())
            .putString(UserSession.FULL_NAME, customer.getFull_name())
            .putString(UserSession.PHONE_NUMBER, customer.getPhone_number())
            .putString(UserSession.EMAIL, customer.getEmail());
        editor.apply();
    }

    public void clickRegister(View view) {
        finish();
        startActivity(new Intent(LoginActivity.this, RegisterActivity.class));
    }

}
