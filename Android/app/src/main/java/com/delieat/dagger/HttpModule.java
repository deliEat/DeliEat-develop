package com.delieat.dagger;

import android.content.Context;

import com.delieat.helpers.Network.HttpHelper;

import dagger.Module;
import dagger.Provides;

@Module
public class HttpModule {

    @Provides
    static HttpHelper provideHttpHelper(Context appContext) {
        return new HttpHelper(appContext);
    }

}
