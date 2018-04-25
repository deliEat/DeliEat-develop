package com.delieat.dagger;

import android.content.Context;

import com.delieat.helpers.SessionHelper;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
class SessionModule {

    @Provides
    @Singleton
    static SessionHelper provideSessionHelper(Context appContext) {
        return new SessionHelper(appContext);
    }
}
