package com.delieat.repositories;

import com.delieat.helpers.HttpHelper;
import com.delieat.helpers.SessionHelper;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class RepositoryModule {
    @Provides
    @Singleton
    public UserRepository provideUserRepository(HttpHelper httpHelper, SessionHelper sessionHelper) {
        return new UserRepository(httpHelper, sessionHelper);
    }
}
