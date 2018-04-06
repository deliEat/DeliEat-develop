package com.delieat.activities;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.delieat.models.Restaurant;


import java.util.ArrayList;
import java.util.List;

public class RestaurantDisplayListActivity extends AppCompatActivity {
    private List<Restaurant> restaurants = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_restaurant_display_list);
        Restaurant res = new Restaurant();
        res.setName("blabla");
        restaurants.add(res);
        displayRestaurant();
    }

    private void displayRestaurant() {
        ScrollView scrollView = findViewById(R.id.restaurants);
        for (Restaurant r: restaurants) {
            TextView text = new TextView(this);
            text.setText(r.getName());
            scrollView.addView(text);
        }
    }


}
