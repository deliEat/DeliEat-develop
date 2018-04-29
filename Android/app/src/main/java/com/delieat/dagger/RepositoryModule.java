package com.delieat.dagger;

import com.delieat.helpers.SessionHelper;
import com.delieat.repositories.RestaurantRepository;
import com.delieat.repositories.UserRepository;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module(subcomponents = HttpComponent.class)
class RepositoryModule {

    @Provides
    @Singleton
    static UserRepository provideUserRepository(
        HttpComponent.Builder httpComponentBuilder, SessionHelper sessionHelper) {
        return new UserRepository(httpComponentBuilder, sessionHelper);
    }

    @Provides
    @Singleton
    static RestaurantRepository provideRestaurantRepository(
            HttpComponent.Builder httpComponentBuilder) {
        return new RestaurantRepository(httpComponentBuilder);
    }

}
