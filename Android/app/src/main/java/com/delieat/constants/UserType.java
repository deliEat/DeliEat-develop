package com.delieat.constants;

public enum UserType {
    CUSTOMER("C"),
    OWNER("R");

    private final String rep;

    UserType(String rep) {
        this.rep = rep;
    }

    public static boolean isCustomer(String userType) {
        return CUSTOMER.rep.equalsIgnoreCase(userType);
    }

    public static boolean isOwner(String userType) {
        return OWNER.rep.equalsIgnoreCase(userType);
    }
}
