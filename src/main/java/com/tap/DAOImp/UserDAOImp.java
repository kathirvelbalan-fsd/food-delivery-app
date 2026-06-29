package com.tap.DAOImp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.Model.User;
import com.tap.Utility.DBConnection;

public class UserDAOImp implements UserDAO {
	
    private static final String INSERT = "INSERT INTO user(UserName, Password, Email, Address, Role) VALUES (?,?,?,?,?)";
    private static final String SELECT = " SELECT * FROM user WHERE UserID = ? ";
    private static final String UPDATE =
    		"UPDATE User SET Username=?, Password=?, Email=?, Address=?, Role=? WHERE UserID=?";
    private static final String DELETE =
    		"DELETE FROM User WHERE UserID=?";
    private static final String SELECT_ALL =" SELECT * FROM user  ";
    private static final String SELECT_BY_EMAIL =
            "SELECT * FROM user WHERE Email = ?";
    

	@Override
	public int addUser(User user)
	{
		try(Connection con =DBConnection.getConnection();
			PreparedStatement psmt =con.prepareStatement(INSERT);		
		)
		{
			psmt.setString(1,user.getUserName());
			psmt.setString(2,user.getPassword());
			psmt.setString(3,user.getEmail());
			psmt.setString(4,user.getAddress());
			psmt.setString(5,user.getRole());
			
			int i = psmt.executeUpdate();
			return i;
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User getUser(int userId) 
	{   
		User user = null;
		try(Connection con =DBConnection.getConnection();
			PreparedStatement psmt =con.prepareStatement(SELECT);		
			)
		{
			psmt.setInt(1, userId);
			ResultSet res = psmt.executeQuery();
			
			if(res.next())
			{
				user = new User(
						res.getInt("UserID"),
						res.getString("Username"),
						res.getString("Password"),
						res.getString("Email"),
						res.getString("Address"),
						res.getString("Role"),
						res.getTimestamp("CreatedDate"),
						res.getTimestamp("LastLoginDate")
						);
			}
		}

		catch(SQLException e) 
		{
			e.printStackTrace();
		}
		return user;
	}

	
	
	@Override
	public void updateUser(User user)
	{
		try(Connection con =DBConnection.getConnection();
			PreparedStatement psmt =con.prepareStatement(UPDATE);		
			)
		{
			
			psmt.setString(1,user.getUserName());
			psmt.setString(2,user.getPassword());
			psmt.setString(3,user.getEmail());
			psmt.setString(4,user.getAddress());
			psmt.setString(5,user.getRole());
			psmt.setInt(6,user.getUserId());
			
			int rows = psmt.executeUpdate();
			System.out.println(rows+"Row Updated");
		}
		catch(SQLException e) 
		{
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUser(int userId) 
	{
		try(
				Connection con = DBConnection.getConnection();
				PreparedStatement pstmt = con.prepareStatement(DELETE);
			)
			{
				pstmt.setInt(1, userId);

				int rows = pstmt.executeUpdate();

				System.out.println(rows + " Row Deleted");
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
	}
	@Override
	public User getUserByEmail(String email)
	{
	    User user = null;

	    try(Connection con = DBConnection.getConnection();
	        PreparedStatement psmt = con.prepareStatement(SELECT_BY_EMAIL))
	    {
	        psmt.setString(1, email);

	        ResultSet res = psmt.executeQuery();

	        if(res.next())
	        {
	            user = new User(
	                    res.getInt("UserID"),
	                    res.getString("UserName"),
	                    res.getString("Password"),
	                    res.getString("Email"),
	                    res.getString("Address"),
	                    res.getString("Role"),
	                    res.getTimestamp("CreatedDate"),
	                    res.getTimestamp("LastLoginDate")
	            );
	        }
	    }
	    catch(SQLException e)
	    {
	        e.printStackTrace();
	    }

	    return user;
	}

	@Override
	public List<User> getAllusers() 
	{
		List<User> userList = new ArrayList<>();

		try(
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(SELECT_ALL);
		)
		{
			while(res.next())
			{
				User user = new User(
						res.getInt("UserID"),
						res.getString("Username"),
						res.getString("Password"),
						res.getString("Email"),
						res.getString("Address"),
						res.getString("Role"),
						res.getTimestamp("CreatedDate"),
						res.getTimestamp("LastLoginDate")
						);

				userList.add(user);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return userList;
	}



}
