package com.delieat.viewmodels;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MutableLiveData;
import android.arch.lifecycle.ViewModel;
import com.delieat.models.Restaurant;
import com.delieat.repositories.RestaurantRepository;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class RestaurantsViewModel extends ViewModel {
    RestaurantRepository restaurantRepo;

    @Inject
    public RestaurantsViewModel(RestaurantRepository resRepo) {
        this.restaurantRepo = resRepo;
    }

    public LiveData<ArrayList<Restaurant>> getRestaurants() {
        return restaurantRepo.getRestaurants();
    }
}
