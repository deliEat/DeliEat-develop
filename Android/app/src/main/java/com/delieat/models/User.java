package com.delieat.models;

public class User {

    public static final String USERNAME = "username";
    public static final String PASSWORD = "password";

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
