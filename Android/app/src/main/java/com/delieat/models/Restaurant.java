package com.delieat.models;

/**
 * Created by kayciwang on 2018-04-04.
 */

public class Restaurant {
    public static final String OWNER_ID = "owner_id";
    public static final String NAME = "name";
    public static final String ESTIMATED_COOK_TIME = "estimated_cook_time";

    private int id;
    private int owner_id;
    private String  name;
    private String estimated_cook_time;

    public int getId() {
        return id;
    }

    public int getOwner_id() {
        return owner_id;
    }

    public String getName() {
        return name;
    }

    public String getEstimated_cook_time() {
        return estimated_cook_time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setOwner_id(int owner_id) {
        this.owner_id = owner_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEstimated_cook_time(String estimated_cook_time) {
        this.estimated_cook_time = estimated_cook_time;
    }


}
