package com.delieat.dagger;

import android.arch.lifecycle.ViewModel;
import android.arch.lifecycle.ViewModelProvider;

import com.delieat.models.Restaurant;
import com.delieat.viewmodels.LoginViewModel;
import com.delieat.viewmodels.RestaurantsViewModel;
import com.delieat.viewmodels.ViewModelFactory;

import dagger.Binds;
import dagger.Module;
import dagger.multibindings.IntoMap;

@Module(includes = { RepositoryModule.class })
abstract class ViewModelModule {

    @Binds
    @IntoMap
    @ViewModelKey(LoginViewModel.class)
    abstract ViewModel loginViewModel(LoginViewModel loginViewModel);

    @Binds
    @IntoMap
    @ViewModelKey(RestaurantsViewModel.class)
    abstract ViewModel restaurantsViewModel(RestaurantsViewModel restaurantsViewModel);

    @Binds
    abstract ViewModelProvider.Factory viewModelFactory(ViewModelFactory viewModelFactory);
}
