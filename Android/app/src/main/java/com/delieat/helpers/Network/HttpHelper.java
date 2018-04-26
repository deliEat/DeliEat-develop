package com.delieat.helpers.Network;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class HttpHelper {
    private final RequestQueue requestQueue;

    @Inject
    public HttpHelper(Context appContext) {
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

    public void sendJSONGetRequest(
            final String url,
            final JSONObject jsonRequest,
            final Response.Listener<JSONObject> success,
            final Response.ErrorListener error) {
        JsonObjectRequest request = new JsonObjectRequest(
                Request.Method.GET, url, jsonRequest, success, error);
        requestQueue.add(request);
    }

    public void sendJSONGetIndexRequest(
            final String url,
            final JSONArray jsonRequest,
            final Response.Listener<JSONArray> success,
            final Response.ErrorListener error) {
        JsonArrayRequest request = new JsonArrayRequest(
                Request.Method.GET, url, jsonRequest, success, error);
        requestQueue.add(request);
    }
}
