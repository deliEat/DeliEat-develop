package com.delieat.activities;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

import com.delieat.helpers.SessionHelper;

import javax.inject.Inject;

import dagger.android.AndroidInjection;

public class OwnerHomeActivity extends AppCompatActivity {

    @Inject
    SessionHelper sessionHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        AndroidInjection.inject(this);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_owner_home);
    }

    public void redirectToRestaurantAdd(View view) {
        startActivity(new Intent(OwnerHomeActivity.this, RestaurantAddActivity.class));
    }

    public void logout(View view) {
        sessionHelper.endSession();
        startActivity(new Intent(OwnerHomeActivity.this, LoginActivity.class));
    }

}
