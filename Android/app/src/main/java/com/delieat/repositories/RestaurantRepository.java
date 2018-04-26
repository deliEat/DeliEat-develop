package com.delieat.repositories;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MutableLiveData;
import android.util.Log;

import com.delieat.constants.ApiUrls;
import com.delieat.dagger.HttpComponent;
import com.delieat.helpers.Network.HttpHelper;
import com.delieat.helpers.SessionHelper;
import com.delieat.models.Restaurant;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class RestaurantRepository {
    private static final String LOG_TAG = RestaurantRepository.class.getSimpleName();
    private final HttpHelper httpHelper;

    @Inject
    public RestaurantRepository(HttpComponent.Builder httpComponentBuilder) {
        this.httpHelper = httpComponentBuilder.build().httpHelper();
    }

    public LiveData<ArrayList<Restaurant>> getRestaurants() {
        final MutableLiveData<ArrayList<Restaurant>> restaurantResponse = new MutableLiveData<>();
        httpHelper.sendJSONGetIndexRequest(ApiUrls.GET_RESTAURANTS, null,
                response -> {
                    try {
                        ArrayList<Restaurant> listOfRestaurants = new ArrayList<>();
                        parseRestaurants(response, listOfRestaurants);
                        restaurantResponse.setValue(listOfRestaurants);
                    } catch (Exception e) {
                        Log.e(LOG_TAG, "Failed to parse restaurant JSONArray response", e);
                    }
                },
                error -> {
                    Log.e(LOG_TAG, "Failed to get restaurants.", error);
                }
        );
        return restaurantResponse;
    }

    private void parseRestaurants(JSONArray restaurantJSONList, List<Restaurant> restaurantList) throws JSONException {
        for (int i = 0; i < restaurantJSONList.length(); i++) {
            addSingleRestaurant(restaurantJSONList.getJSONObject(i), restaurantList);
        }
    }

    private void addSingleRestaurant(JSONObject restaurant, List<Restaurant> restaurantList) throws JSONException{
        Restaurant newRestaurantObject = new Restaurant();
        newRestaurantObject.setOwner_id(restaurant.getInt("owner_id"));
        newRestaurantObject.setName(restaurant.getString("name"));
        newRestaurantObject.setEstimated_cook_time(restaurant.getString("estimated_cook_time"));
        restaurantList.add(newRestaurantObject);
    }
}
