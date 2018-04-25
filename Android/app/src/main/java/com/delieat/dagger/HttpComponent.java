package com.delieat.dagger;

import com.delieat.helpers.Network.HttpHelper;

import dagger.Subcomponent;

@Subcomponent(modules = HttpModule.class)
public interface HttpComponent {

    HttpHelper httpHelper();

    @Subcomponent.Builder
    interface Builder {
        HttpComponent build();
    }
}
