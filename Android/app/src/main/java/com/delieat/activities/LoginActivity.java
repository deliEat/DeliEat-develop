package com.delieat.activities;

import android.arch.lifecycle.ViewModelProviders;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import com.delieat.constants.UserType;
import com.delieat.viewmodels.LoginViewModel;

public class LoginActivity extends AppCompatActivity {
    LoginViewModel viewModel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        viewModel = ViewModelProviders.of(this).get(LoginViewModel.class);
    }

    public void login(View view) {
        final TextView usernameTextView = findViewById(R.id.username);
        final TextView passwordTextView = findViewById(R.id.fullName);
        final String username = usernameTextView.getText().toString();
        final String password = passwordTextView.getText().toString();
        viewModel.login(username, password).observe(this, userType -> {
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
