package com.delieat.dagger;

import com.delieat.repositories.UserRepository;

import dagger.Subcomponent;

@Subcomponent(modules = { RepositoryModule.class })
public interface RepositoryComponent {
    UserRepository userRepository();

    @Subcomponent.Builder
    interface Builder {
        RepositoryComponent build();
    }
}
