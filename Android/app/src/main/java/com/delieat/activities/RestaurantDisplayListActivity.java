package com.delieat.activities;

import android.arch.lifecycle.ViewModelProviders;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ListView;

import com.delieat.adapters.RestaurantsAdapter;
import com.delieat.models.Restaurant;
import com.delieat.viewmodels.RestaurantsViewModel;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

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
//        String requestUrl = ApiUrls.GET_RESTAURANTS;
//        RequestQueue queue = HttpHelper.INSTANCE.provideRequestQueue(getApplicationContext());
//        try {
//            JsonArrayRequest request = new JsonArrayRequest(Request.Method.GET, requestUrl,
//                    null, new Response.Listener<JSONArray>()
//                    {
//                        @Override
//                        public void onResponse(JSONArray response) {
//                            try {
//                                parseRestaurants(response);
//                            } catch (Exception e) {
//
//                            }
//                        }
//                        }, new Response.ErrorListener() {
//                @Override
//                public void onErrorResponse(VolleyError error) {
//                }
//            });
//            queue.add(request);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
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
