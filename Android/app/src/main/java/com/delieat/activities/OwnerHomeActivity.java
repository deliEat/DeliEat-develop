package com.delieat.activities;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class OwnerHomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_owner_home);
    }

    public void redirectToRestaurantAdd(View view) {
        startActivity(new Intent(OwnerHomeActivity.this, RestaurantAddActivity.class));
    }

}
