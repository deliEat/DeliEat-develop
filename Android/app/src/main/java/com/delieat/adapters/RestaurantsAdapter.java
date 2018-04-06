package com.delieat.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.delieat.activities.R;
import com.delieat.models.Restaurant;

import java.util.ArrayList;

/**
 * Created by kayciwang on 2018-04-05.
 */

public class RestaurantsAdapter extends ArrayAdapter<Restaurant>{

    public RestaurantsAdapter(Context context, ArrayList<Restaurant> restaurants) {
        super(context, 0, restaurants);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        Restaurant r = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_restaurant, parent, false);
        }
        // Lookup view for data population
        TextView res_name = (TextView) convertView.findViewById(R.id.restaurant_name);
        TextView cooking_time = (TextView) convertView.findViewById(R.id.cooking_time);
        ImageView logo = (ImageView) convertView.findViewById(R.id.restaurant_logo);
        // Populate the data into the template view using the data object
        res_name.setText(r.getName());
        cooking_time.setText(r.getEstimated_cook_time());
        logo.setBackgroundResource(R.drawable.googleg_standard_color_18);
        // Return the completed view to render on screen
        return convertView;
    }
}
