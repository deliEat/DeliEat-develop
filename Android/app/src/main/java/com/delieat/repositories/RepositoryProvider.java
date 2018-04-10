package com.delieat.repositories;

import com.delieat.DeliEatApp;

import javax.inject.Singleton;

import dagger.Component;

@Component(modules = { DeliEatApp.class, RepositoryModule.class })
@Singleton
public interface RepositoryProvider {
    UserRepository getUserRepository();
}
