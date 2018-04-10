package com.delieat;

import android.app.Application;
import android.content.Context;

import dagger.Module;
import dagger.Provides;

@Module
public final class DeliEatApp extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
    }

    @Provides
    public Context provideAppContext() {
        return this;
    }

}
