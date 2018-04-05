package com.delieat.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.delieat.constants.UserType;
import com.delieat.helpers.RegistrationHelper;
import com.delieat.models.User;

public class RegisterActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
    }

    public void redirectToLoginActivity(View view) {
        finish();
        Intent intent = new Intent(RegisterActivity.this, LoginActivity.class);
        startActivity(intent);
    }

    public void redirectToCustomerRegistration(View view) {
        Intent intent = new Intent(this, RegisterDetailActivity.class);
        intent.putExtra(User.USER_TYPE, UserType.CUSTOMER);
        redirectToRegisterDetail(intent);
    }

    public void redirectToOwnerRegistration(View view) {
        Intent intent = new Intent(this, RegisterDetailActivity.class);
        intent.putExtra(User.USER_TYPE, UserType.OWNER);
        redirectToRegisterDetail(intent);
    }

    private void redirectToRegisterDetail(Intent intent) {
        if (verifyPassword()) {
            storeUserData();
            finish();
            startActivity(intent);
        } else {
            Toast.makeText(getApplicationContext(), R.string.passwords_do_not_match, Toast.LENGTH_SHORT).show();
        }
    }

    private boolean verifyPassword() {
        final TextView passwordTextView = findViewById(R.id.fullName);
        final TextView passwordConfirmTextView = findViewById(R.id.passwordConfirm);
        final String password = passwordTextView.getText().toString();
        final String confirmPassword = passwordConfirmTextView.getText().toString();

        return password.equals(confirmPassword);
    }

    private void storeUserData() {
        SharedPreferences sharedPref = getApplicationContext().getSharedPreferences(
            RegistrationHelper.REGISTRATION_DATA, 0);
        SharedPreferences.Editor editor = sharedPref.edit();

        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.fullName);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();

        editor.putString(User.USERNAME, username);
        editor.putString(User.PASSWORD, password);
        editor.apply();
    }

}
