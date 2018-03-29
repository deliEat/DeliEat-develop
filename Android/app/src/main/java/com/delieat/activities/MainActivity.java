package com.delieat.activities;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.delieat.constants.UserSession;
import com.delieat.constants.UserType;

public class MainActivity extends AppCompatActivity {

    private SharedPreferences session;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        session = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());

        if (isLoggedIn()) {
            redirectToHomeActivity(savedInstanceState);
        } else {
            redirectToLoginActivity(savedInstanceState);
        }
    }

    private boolean isLoggedIn() {
        return session.getString(UserSession.USER_NAME, null) != null;
    }

    private void redirectToHomeActivity(Bundle savedInstanceState) {
        String userType = session.getString(UserSession.USER_TYPE, null);
        if (UserType.isCustomer(userType)) {
            finish();
            startActivity(new Intent(this, CustomerHomeActivity.class), savedInstanceState);
        } else if (UserType.isOwner(userType)) {
            finish();
            startActivity(new Intent(this, OwnerHomeActivity.class), savedInstanceState);
        }
    }

    private void redirectToLoginActivity(Bundle savedInstanceState) {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                finish();
                Intent intent = new Intent(MainActivity.this, LoginActivity.class);
                startActivity(intent);
            }
        }, 2000);
    }

}
