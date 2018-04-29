package com.delieat.activities;

import android.arch.lifecycle.Observer;
import android.arch.lifecycle.ViewModelProvider;
import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.widget.ListView;

import com.delieat.adapters.RestaurantsAdapter;
import com.delieat.models.Restaurant;
import com.delieat.viewmodels.RestaurantsViewModel;

import org.json.JSONArray;

import java.util.ArrayList;

import javax.inject.Inject;

import dagger.android.AndroidInjection;

public class RestaurantDisplayListActivity extends AppCompatActivity {
//    @Inject
//    ViewModelProvider.Factory viewModelFactory;
//
//    private RestaurantsViewModel rViewModel;
//    private ArrayList<Restaurant> restaurantList = new ArrayList<>();
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        AndroidInjection.inject(this);
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_restaurant_display_list);
//
//        rViewModel = ViewModelProviders.of(this, viewModelFactory).get(RestaurantsViewModel.class);
//
//        ListView listView = (ListView) findViewById(R.id.restaurants);
//
//        rViewModel.getRestaurants().observe(this, restaurants -> {
//            RestaurantsAdapter rAdapter = new RestaurantsAdapter(this, restaurantList);
//            listView.setAdapter(rAdapter);
//            restaurantList.addAll(restaurants);
//        });
//    }
}
