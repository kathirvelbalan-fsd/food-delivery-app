package com.tap.DAOImp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.Model.Restaurant;
import com.tap.Model.User;
import com.tap.Utility.DBConnection;

public class RestaurantDAOImp implements RestaurantDAO {
	
	private static final String INSERT = " INSERT INTO restaurant( Name, CuisineType, DeliveryTime, Address, Rating, IsActive, ImagePath)"
			+" VALUES(?,?,?,?,?,?,?) ";
	private static final String SELECT = "SELECT * FROM restaurant WHERE RestaurantID=?";
	private static final String UPDATE = "UPDATE restaurant SET Name=?,CuisineType=?,DeliveryTime=?,Address=?,Rating=?,IsActive=?,ImagePath=? WHERE RestaurantID=?";
	private static final String DELETE = "DELETE FROM restaurant WHERE RestaurantID=?";
	private static final String SELECTALL = "SELECT * FROM restaurant";

	@Override
	public void addRestaurant(Restaurant rest) {
		try( Connection con = DBConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(INSERT);
			)
		{
			pstmt.setString(1,rest.getName());
			pstmt.setString(2,rest.getCuisineType());
			pstmt.setInt(3,rest.getDeliveryTime());
			pstmt.setString(4,rest.getAddress());
			pstmt.setDouble(5,rest.getRating());
			pstmt.setBoolean(6,rest.isActive());
			pstmt.setString(7,rest.getImagePath());
			
			pstmt.executeUpdate();
			System.out.println("Restaurant Inserted Successfully");
			
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		Restaurant rest = null;
		try( Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(SELECT);
		)
		{
			pstmt.setInt(1, restaurantId);
			ResultSet res = pstmt.executeQuery();
			
			if(res.next()) {
				rest = new Restaurant(
						res.getInt("RestaurantID"),
						res.getString("Name"),
						res.getString("CuisineType"),
						res.getInt("DeliveryTime"),
						res.getString("Address"),
						res.getDouble("Rating"),
						res.getBoolean("IsActive"),
						res.getString("ImagePath")	
				);
						
			}
			
		
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		
		return rest ;
	}

	@Override
	public void updateRestaurant(Restaurant rest) {
		try( Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(UPDATE);
			)
		{
			pstmt.setString(1, rest.getName());
			pstmt.setString(2, rest.getCuisineType());
			pstmt.setInt(3, rest.getDeliveryTime());
			pstmt.setString(4, rest.getAddress());
			pstmt.setDouble(5, rest.getRating());
			pstmt.setBoolean(6, rest.isActive());
			pstmt.setString(7, rest.getImagePath());
			pstmt.setInt(8, rest.getRestaurantId());

			int rows = pstmt.executeUpdate();

			System.out.println(rows + " Restaurant Updated Successfully");
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {
		try( Connection con = DBConnection.getConnection();
				 PreparedStatement pstmt = con.prepareStatement(DELETE);
			)
		{
			pstmt.setInt(1, restaurantId);
			int rows = pstmt.executeUpdate();
			System.out.println(rows + " Restaurant Deleted Successfully");
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}

	@Override
	public List<Restaurant> getAllRestaurant() {
		
		List<Restaurant> RestaurantList = new ArrayList<>();
		
		try( Connection con = DBConnection.getConnection();
			 Statement stmt = con.createStatement();
			 ResultSet res = stmt.executeQuery(SELECTALL);
			)
		{
			while(res.next()) {
				Restaurant rest = new Restaurant(
						res.getInt("RestaurantID"),
						res.getString("Name"),
						res.getString("CuisineType"),
						res.getInt("DeliveryTime"),
						res.getString("Address"),
						res.getDouble("Rating"),
						res.getBoolean("IsActive"),
						res.getString("ImagePath")	
				);
				RestaurantList.add(rest);
						
			}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		
		return RestaurantList ;
	}

}
