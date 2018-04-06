package com.delieat.activities;

import android.os.Bundle;
import android.support.constraint.ConstraintLayout;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import com.delieat.adapters.RestaurantsAdapter;
import com.delieat.models.Restaurant;


import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.List;

public class RestaurantDisplayListActivity extends AppCompatActivity {
    private ArrayList<Restaurant> restaurants;
    private RestaurantsAdapter rAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_restaurant_display_list);
        restaurants = new ArrayList<Restaurant>();
        rAdapter = new RestaurantsAdapter(this, restaurants);
        ListView listView = (ListView) findViewById(R.id.restaurants);
        listView.setAdapter(rAdapter);
        addRestaurants();
    }

    private void addRestaurants() {
        for (Restaurant r : restaurants) {
            rAdapter.add(r);
        }
    }

}
