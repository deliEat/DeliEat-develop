package com.delieat.dagger;

import android.content.Context;

import com.delieat.DeliEatApp;
import com.delieat.repositories.UserRepository;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import dagger.android.AndroidInjectionModule;

@Module(includes = {
    AndroidInjectionModule.class,
    ActivityModule.class,
    RepositoryModule.class,
    ViewModelModule.class })
class DeliEatAppModule {

    @Provides
    @Singleton
    static Context provideAppContext(DeliEatApp deliEatApp) {
        return deliEatApp.getApplicationContext();
    }

}
