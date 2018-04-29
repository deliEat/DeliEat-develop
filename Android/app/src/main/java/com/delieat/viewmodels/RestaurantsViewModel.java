package com.delieat.viewmodels;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MutableLiveData;
import android.arch.lifecycle.ViewModel;
import com.delieat.models.Restaurant;
import com.delieat.repositories.RestaurantRepository;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Singleton;

//@Singleton
public class RestaurantsViewModel extends ViewModel {
//    RestaurantRepository restaurantRepo;
//    private MutableLiveData<ArrayList<Restaurant>> listOfRestaurants;
//
//    @Inject
//    public RestaurantsViewModel(RestaurantRepository resRepo) {
//        this.restaurantRepo = resRepo;
//    }
//
//    public MutableLiveData<ArrayList<Restaurant>> getRestaurants() {
//        if (listOfRestaurants == null) {
//            listOfRestaurants = new MutableLiveData<>();
//            listOfRestaurants = restaurantRepo.getRestaurants();
//        }
//        return listOfRestaurants;
//    }
}
