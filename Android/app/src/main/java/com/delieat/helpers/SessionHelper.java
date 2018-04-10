package com.delieat.helpers;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.delieat.constants.UserSession;
import com.delieat.constants.UserType;
import com.delieat.models.Customer;
import com.delieat.models.Owner;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class SessionHelper {
    private final SharedPreferences session;

    @Inject
    public SessionHelper(Context appContext) {
        session = PreferenceManager.getDefaultSharedPreferences(appContext);
    }

    public void startOwnerSession(Owner owner) {
        SharedPreferences.Editor editor = session.edit();
        editor.putInt(UserSession.USER_ID, owner.getUser_id())
            .putString(UserSession.USER_TYPE, UserType.OWNER.getRepresentation())
            .putInt(UserSession.OWNER_ID, owner.getId())
            .putString(UserSession.FULL_NAME, owner.getFull_name())
            .putString(UserSession.PHONE_NUMBER, owner.getPhone_number())
            .putString(UserSession.EMAIL, owner.getEmail());
        editor.apply();
    }

    public void startCustomerSession(Customer customer) {
        SharedPreferences.Editor editor = session.edit();
        editor.putInt(UserSession.USER_ID, customer.getUser_id())
            .putString(UserSession.USER_TYPE, UserType.CUSTOMER.getRepresentation())
            .putInt(UserSession.CUSTOMER_ID, customer.getId())
            .putString(UserSession.FULL_NAME, customer.getFull_name())
            .putString(UserSession.PHONE_NUMBER, customer.getPhone_number())
            .putString(UserSession.EMAIL, customer.getEmail());
        editor.apply();
    }
}
