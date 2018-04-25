package com.delieat.dagger;

import com.delieat.helpers.SessionHelper;
import com.delieat.repositories.UserRepository;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module(subcomponents = HttpComponent.class)
public class RepositoryModule {

    @Provides
    @Singleton
    public static UserRepository provideUserRepository(
        HttpComponent.Builder httpComponentBuilder, SessionHelper sessionHelper) {
        return new UserRepository(httpComponentBuilder, sessionHelper);
    }

}
