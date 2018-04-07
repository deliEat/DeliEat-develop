package com.delieat.activities;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonObjectRequest;
import com.delieat.constants.ApiUrls;
import com.delieat.helpers.HttpHelper;
import com.delieat.models.Restaurant;

import org.json.JSONException;
import org.json.JSONObject;

public class RestaurantAddActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_restaurant_add);
    }

    public void createRestaurant(View view) {
        String requestUrl = ApiUrls.ADD_RESTAURANT;
        RequestQueue queue = HttpHelper.INSTANCE.getRequestQueue(getApplicationContext());
        try {
            JSONObject request = composeAddRestaurantRequest();
            JsonObjectRequest createUserRequest = new JsonObjectRequest(Request.Method.POST, requestUrl, request,
                    (response) -> {
                        try {
                            finish();
                            startActivity(new Intent(this, LoginActivity.class));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    },
                    (error) -> {
                        Toast.makeText(getApplicationContext(), error.toString(), Toast.LENGTH_SHORT).show();
                    }
            );
            queue.add(createUserRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private JSONObject composeAddRestaurantRequest() throws JSONException{
        final TextView restaurantTextView = findViewById(R.id.restaurantName);
        final TextView cookTimeView = findViewById(R.id.cookTime);
        final String restaurantName = restaurantTextView.getText().toString();
        final String cookTime = cookTimeView.getText().toString();

        JSONObject restaurant = new JSONObject();
        restaurant.put(Restaurant.NAME, restaurantName);
        restaurant.put(Restaurant.ESTIMATED_COOK_TIME, cookTime);
        return restaurant;
    }



}
