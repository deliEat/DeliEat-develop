package com.delieat.viewmodels;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MutableLiveData;
import android.arch.lifecycle.ViewModel;
import com.delieat.models.Restaurant;
import java.util.List;

public class RestaurantsViewModel extends ViewModel {
    private MutableLiveData<List<Restaurant>> restaurants;
    public LiveData<List<Restaurant>> getRestaurants() {
        if (restaurants == null) {
            restaurants = new MutableLiveData<List<Restaurant>>();
            loadRestaurants();
        }
        return restaurants;
    }

    private void loadRestaurants() {
        //TODO: get restaurant data from repository async calls
    }
}
