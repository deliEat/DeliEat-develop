package com.delieat.activities;

import android.arch.lifecycle.ViewModelProviders;
import android.content.Intent;
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
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.delieat.adapters.RestaurantsAdapter;
import com.delieat.constants.ApiUrls;
import com.delieat.helpers.HttpHelper;
import com.delieat.models.Restaurant;
import com.delieat.viewmodels.RestaurantsViewModel;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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
        RestaurantsViewModel restaurantsViewModel =
                ViewModelProviders.of(this).get(RestaurantsViewModel.class);
        addRestaurants();
    }

    private void addRestaurants() {
        getRestaurantsFromServer();
    }

    private void getRestaurantsFromServer() {
        String requestUrl = ApiUrls.GET_RESTAURANTS;
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            JsonArrayRequest request = new JsonArrayRequest(Request.Method.GET, requestUrl,
                    null, new Response.Listener<JSONArray>()
                    {
                        @Override
                        public void onResponse(JSONArray response) {
                            try {
                                parseRestaurants(response);
                            } catch (Exception e) {

                            }
                        }
                        }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                }
            });
            queue.add(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void parseRestaurants(JSONArray restaurantList) throws JSONException{
        for (int i = 0; i < restaurantList.length(); i++) {
            addSingleRestaurant(restaurantList.getJSONObject(i));
        }
    }

    private void addSingleRestaurant(JSONObject restaurant) throws JSONException{
        Restaurant newRestaurantObject = new Restaurant();
        newRestaurantObject.setOwner_id(restaurant.getInt("owner_id"));
        newRestaurantObject.setName(restaurant.getString("name"));
        newRestaurantObject.setEstimated_cook_time(restaurant.getString("estimated_cook_time"));
        restaurants.add(newRestaurantObject);
    }

}
