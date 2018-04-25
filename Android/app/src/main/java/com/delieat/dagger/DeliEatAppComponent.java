package com.delieat.dagger;

import com.delieat.DeliEatApp;

import javax.inject.Singleton;

import dagger.BindsInstance;
import dagger.Component;

@Component(modules = DeliEatAppModule.class)
@Singleton
public interface DeliEatAppComponent {

    @Component.Builder
    interface Builder {
        @BindsInstance
        Builder delieatApp(DeliEatApp deliEatApp);

        DeliEatAppComponent build();
    }

    void inject(DeliEatApp deliEatApp);

}
