package com.delieat.activities;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;

import com.delieat.constants.UserType;
import com.delieat.helpers.SessionHelper;

import javax.inject.Inject;

import dagger.android.AndroidInjection;

public class MainActivity extends AppCompatActivity {

    @Inject
    SessionHelper sessionHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        AndroidInjection.inject(this);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        startActivity(new Intent(this, RestaurantDisplayListActivity.class));

//        if (sessionHelper.isLoggedIn()) {
//            redirectToHomeActivity(savedInstanceState);
//        } else {
//            redirectToLoginActivity(savedInstanceState);
//        }
    }

    private void redirectToHomeActivity(Bundle savedInstanceState) {
        String userType = sessionHelper.getUserType();
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
