package com.tap.DAO;
import java.util.List;
import com.tap.Model.Restaurant;

public interface RestaurantDAO {
	
	
	void addRestaurant(Restaurant rest);
	Restaurant getRestaurant(int restaurantId);
	void updateRestaurant(Restaurant rest);
	void deleteRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurant();
	
	
	
}
