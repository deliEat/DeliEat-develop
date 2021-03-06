package com.delieat.models;

public class User {
    public static final String ID = "id";
    public static final String USERNAME = "username";
    public static final String PASSWORD = "password";
    public static final String USER_TYPE = "user_type";
    public static final String USER = "user";

    private String id;
    private String username;
    private String user_type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserType() {
        return user_type;
    }

    public void setUserType(String userType) {
        this.user_type = userType;
    }
}
