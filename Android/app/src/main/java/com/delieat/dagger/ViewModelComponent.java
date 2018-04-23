package com.delieat.dagger;

import dagger.Subcomponent;

@Subcomponent(modules = { ViewModelModule.class })
public interface ViewModelComponent {

    @Subcomponent.Builder
    interface Builder {
        ViewModelComponent build();
    }
}
