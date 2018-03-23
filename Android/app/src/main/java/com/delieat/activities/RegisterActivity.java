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

/**
 * Created by kayciwang on 2018-03-18.
 */

public class RegisterActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
    }

    public void redirectToCustomerRegistration(View view)
    {
        if (verifyPassword()) {
            storeUserData();
            Intent intent = new Intent(RegisterActivity.this, CustomerRegisterActivity.class);
            startActivity(intent);
        } else {
            Context context = getApplicationContext();
            CharSequence text = "Passwords do not match!";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
    }

    public void redirectToOwnerRegistration(View view)
    {
        if (verifyPassword()) {
            storeUserData();
            //TODO: create a new activity for owner registration
            Intent intent = new Intent(RegisterActivity.this, CustomerRegisterActivity.class);
            startActivity(intent);
        } else {
            Context context = getApplicationContext();
            CharSequence text = "Passwords do not match!";
            int duration = Toast.LENGTH_SHORT;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
    }

    private boolean verifyPassword() {
        final TextView passwordTextView = findViewById(R.id.password);
        final TextView passwordConfirmTextView = findViewById(R.id.passwordConfirm);
        final String password = passwordTextView.getText().toString();
        final String confirmPassword = passwordConfirmTextView.getText().toString();

        return password.equals(confirmPassword);
    }

    private void storeUserData() {
        SharedPreferences sharedPref = PreferenceManager.getDefaultSharedPreferences(this);
        SharedPreferences.Editor editor = sharedPref.edit();

        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.password);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();

        editor.putString("username", username);
        editor.putString("password", password);
        editor.commit();
    }
}
