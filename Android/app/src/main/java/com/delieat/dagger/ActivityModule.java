package com.delieat.dagger;

import com.delieat.activities.CustomerHomeActivity;
import com.delieat.activities.LoginActivity;
import com.delieat.activities.MainActivity;
import com.delieat.activities.OwnerHomeActivity;
import com.delieat.activities.RegisterActivity;
import com.delieat.activities.RegisterDetailActivity;
import com.delieat.activities.RestaurantAddActivity;
import com.delieat.activities.RestaurantDisplayListActivity;

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module(includes = { ViewModelModule.class })
abstract class ActivityModule {
    @ContributesAndroidInjector
    abstract CustomerHomeActivity customerHomeActivity();

    @ContributesAndroidInjector
    abstract LoginActivity loginActivity();

    @ContributesAndroidInjector
    abstract MainActivity mainActivity();

    @ContributesAndroidInjector
    abstract OwnerHomeActivity ownerHomeActivity();

    @ContributesAndroidInjector
    abstract RegisterActivity registerActivity();

    @ContributesAndroidInjector
    abstract RegisterDetailActivity registerDetailActivity();

    @ContributesAndroidInjector
    abstract RestaurantAddActivity restaurantAddActivity();

    @ContributesAndroidInjector
    abstract RestaurantDisplayListActivity restaurantDisplayListActivity();
}
