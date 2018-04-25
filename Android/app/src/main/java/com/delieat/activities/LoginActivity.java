package com.delieat.activities;

import android.arch.lifecycle.ViewModelProvider;
import android.arch.lifecycle.ViewModelProviders;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import com.delieat.constants.UserType;
import com.delieat.viewmodels.LoginViewModel;

import javax.inject.Inject;

import dagger.android.AndroidInjection;

public class LoginActivity extends AppCompatActivity {

    @Inject
    ViewModelProvider.Factory viewModelFactory;

    private LoginViewModel loginViewModel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        AndroidInjection.inject(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        loginViewModel = ViewModelProviders.of(this, viewModelFactory).get(LoginViewModel.class);
    }

    public void login(View view) {
        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.fullName);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();
        loginViewModel.login(username, password).observe(this, userType -> {
            finish();
            if (UserType.isCustomer(userType)) {
                startActivity(new Intent(this, CustomerHomeActivity.class));
            } else if (UserType.isOwner(userType)) {
                startActivity(new Intent(this, OwnerHomeActivity.class));
            }
        });
    }

    public void clickRegister(View view) {
        finish();
        startActivity(new Intent(this, RegisterActivity.class));
    }

}
