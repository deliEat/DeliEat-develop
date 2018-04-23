package com.delieat.dagger;

import android.arch.lifecycle.ViewModel;
import android.arch.lifecycle.ViewModelProvider;

import com.delieat.viewmodels.LoginViewModel;
import com.delieat.viewmodels.ViewModelFactory;

import dagger.Binds;
import dagger.Module;
import dagger.multibindings.IntoMap;

@Module
abstract class ViewModelModule {

    @Binds
    @IntoMap
    @ViewModelKey(LoginViewModel.class)
    abstract ViewModel loginViewModel(LoginViewModel loginViewModel);

    @Binds
    abstract ViewModelProvider.Factory viewModelFactory(ViewModelFactory viewModelFactory);
}
