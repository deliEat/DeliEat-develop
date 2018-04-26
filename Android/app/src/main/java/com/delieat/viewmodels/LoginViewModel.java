package com.delieat.viewmodels;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.ViewModel;

import com.delieat.repositories.UserRepository;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class LoginViewModel extends ViewModel {
    private final UserRepository userRepo;

    @Inject
    public LoginViewModel(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    public LiveData<String> login(final String username, final String password) {
        return userRepo.login(username, password);
    }
}
