package com.delieat.helpers;

import android.content.SharedPreferences;

import com.delieat.constants.UserType;
import com.delieat.models.User;

import org.json.JSONException;
import org.json.JSONObject;

public class RegistrationHelper {
    public static final String REGISTRATION_DATA = "registrationData";
    public static final String USER = "user";

    public static JSONObject composeUserRegistrationJsonRequest(SharedPreferences sharedPref) throws JSONException {
        String username = sharedPref.getString(User.USERNAME, "");
        String password = sharedPref.getString(User.PASSWORD, "");

        JSONObject userRequest = new JSONObject();
        userRequest.put(User.USERNAME, username);
        userRequest.put(User.PASSWORD, password);
        userRequest.put(User.USER_TYPE, UserType.getRepresentation(UserType.OWNER));
        return new JSONObject().put(USER, userRequest);
    }
}
