package com.delieat.helpers;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.delieat.DeliEatApp;

import org.json.JSONObject;

import javax.inject.Inject;
import javax.inject.Singleton;

import dagger.Component;

@Singleton
public class HttpHelper {
    private final RequestQueue requestQueue;

    @Inject
    HttpHelper(Context appContext) {
        this.requestQueue = Volley.newRequestQueue(appContext);
    }

    public void sendJsonPostRequest(
        final String url,
        final JSONObject jsonRequest,
        final Response.Listener<JSONObject> success,
        final Response.ErrorListener error) {
        JsonObjectRequest request = new JsonObjectRequest(
            Request.Method.POST, url, jsonRequest, success, error);
        requestQueue.add(request);
    }
}
