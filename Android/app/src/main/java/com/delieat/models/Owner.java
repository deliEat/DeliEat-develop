package com.delieat.models;

public class Owner {
    public static final String ID = "id";
    public static final String USER_ID = "user_id";
    public static final String FULL_NAME = "full_name";
    public static final String PHONE_NUMBER = "phone_number";
    public static final String EMAIL = "email";
    public static final String OWNER = "owner";

    private int id;
    private int user_id;
    private String  full_name;
    private String phone_number;
    private String email;

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getFull_name() {
        return full_name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public String getEmail() {
        return email;
    }
}
