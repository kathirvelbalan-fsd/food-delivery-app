package com.tap.Utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	
	private static final  String URL = "jdbc:mysql://localhost:3306/food_application";
	
	private static final String USERNAME="root";
	
	private static final String PASSWORD="root";
	
	private static Connection con = null;
	
	
	public static Connection getConnection() 
	{
		try 
		
		{   
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
