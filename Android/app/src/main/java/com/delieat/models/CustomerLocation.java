package com.delieat.models;

import javax.inject.Singleton;

@Singleton
public class CustomerLocation {
    public static final int PERMISSIONS_REQUEST_ACCESS_FINE_LOCATION = 100;
    private static CustomerLocation customerLocation;
    private static boolean locationPermissionGranted = false;

    private CustomerLocation() {
    }

    public CustomerLocation getInstance() {
        if (customerLocation == null) {
            customerLocation = new CustomerLocation();
        }
        return customerLocation;
    }

    public void setLocationPermission(boolean value) {
        locationPermissionGranted = value;
    }

    public boolean getLocationPermission() {
        return locationPermissionGranted;
    }

}
