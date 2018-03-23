package com.delieat.activities;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class ManagerHomeActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_manager_home);
    }

    public void goToRestaurantAdd(View view) {
        startActivity(new Intent(ManagerHomeActivity.this, RestaurantAddActivity.class));
    }

}
