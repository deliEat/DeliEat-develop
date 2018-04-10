package com.delieat.repositories;

import android.arch.lifecycle.LiveData;
import android.arch.lifecycle.MutableLiveData;
import android.util.Log;

import com.delieat.constants.ApiUrls;
import com.delieat.constants.UserType;
import com.delieat.helpers.HttpHelper;
import com.delieat.helpers.SessionHelper;
import com.delieat.models.Customer;
import com.delieat.models.Owner;
import com.delieat.models.User;
import com.google.gson.Gson;

import org.json.JSONException;
import org.json.JSONObject;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class UserRepository {
    private static final String LOG_TAG = UserRepository.class.getSimpleName();
    private final HttpHelper httpHelper;
    private final SessionHelper sessionHelper;

    @Inject
    public UserRepository(HttpHelper httpHelper, SessionHelper sessionHelper) {
        this.httpHelper = httpHelper;
        this.sessionHelper = sessionHelper;
    }

    public LiveData<String> login(final String username, final String password) {
        final MutableLiveData<String> loginResponse = new MutableLiveData<>();
        JSONObject loginRequest = composeLoginJsonRequest(username, password);
        httpHelper.sendJsonPostRequest(ApiUrls.LOGIN, loginRequest,
            response -> {
                try {
                    String userType = response.getString(User.USER_TYPE);
                    if (UserType.isCustomer(userType)) {
                        Customer customer = new Gson().fromJson(
                            response.getJSONObject(Customer.CUSTOMER).toString(), Customer.class);
                        sessionHelper.startCustomerSession(customer);
                    } else if (UserType.isOwner(userType)) {
                        Owner owner = new Gson().fromJson(
                            response.getJSONObject(Owner.OWNER).toString(), Owner.class);
                        sessionHelper.startOwnerSession(owner);
                    }
                    loginResponse.setValue(userType);
                } catch (JSONException e) {
                    Log.e(LOG_TAG, "Failed to parse login JSON response", e);
                }
            },
            error -> {
                Log.e(LOG_TAG, "Failed to login.", error);
            }
        );
        return loginResponse;
    }

    private JSONObject composeLoginJsonRequest(final String username, final String password) {
        JSONObject request = new JSONObject();
        try {
            request.put(User.USERNAME, username)
                .put(User.PASSWORD, password);
        } catch (JSONException e) {
            Log.e(LOG_TAG, "Failed to create login JSON request.", e);
        }
        return request;
    }
}
