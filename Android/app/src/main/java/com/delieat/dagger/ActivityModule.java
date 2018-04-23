package com.delieat.dagger;

import com.delieat.activities.LoginActivity;

import dagger.Module;
import dagger.android.ContributesAndroidInjector;

@Module
abstract class ActivityModule {

    @ContributesAndroidInjector
    abstract LoginActivity loginActivity();
}
