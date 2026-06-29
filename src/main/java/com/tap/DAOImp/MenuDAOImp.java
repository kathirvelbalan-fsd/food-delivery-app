package com.tap.DAOImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.Model.Menu;
import com.tap.Utility.DBConnection;

public class MenuDAOImp implements MenuDAO {

    private static final String INSERT =
            "INSERT INTO menu(RestaurantID, ItemName, Description, Price, IsAvailable, ImagePath) VALUES(?,?,?,?,?,?)";
    private static final String SELECT = "SELECT * FROM menu WHERE MenuID=?";
    private static final String UPDATE =
            "UPDATE menu SET RestaurantID=?, ItemName=?, Description=?, Price=?, IsAvailable=?, ImagePath=? WHERE MenuID=?";
    private static final String DELETE = "DELETE FROM menu WHERE MenuID=?";
    private static final String SELECTALL = "SELECT * FROM menu";
    	private static final String SELECT_BY_RESTAURANT_ID = "SELECT * FROM menu WHERE RestaurantID = ?";

    @Override
    public void addMenu(Menu menu) {
        String checkRest = "SELECT COUNT(*) FROM restaurant WHERE RestaurantID = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement checkStmt = con.prepareStatement(checkRest);
             PreparedStatement pstmt = con.prepareStatement(INSERT)) {

            checkStmt.setInt(1, menu.getRestaurantId());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) {
                System.out.println("Error: Restaurant ID " + menu.getRestaurantId() + " does not exist!");
                return;
            }

            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setDouble(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());

            pstmt.executeUpdate();
            System.out.println("Menu Inserted Successfully");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Menu getMenu(int menuId) {
        Menu menu = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT)) {
            pstmt.setInt(1, menuId);
            ResultSet res = pstmt.executeQuery();
            if (res.next()) {
                menu = new Menu(res.getInt("MenuID"), res.getInt("RestaurantID"), res.getString("ItemName"),
                        res.getString("Description"), res.getDouble("Price"), res.getBoolean("IsAvailable"), res.getString("ImagePath"));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return menu;
    }

    @Override
    public void updateMenu(Menu menu) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE)) {
            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setDouble(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());
            pstmt.setInt(7, menu.getMenuId());
            pstmt.executeUpdate();
            System.out.println("Menu Updated Successfully");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void deleteMenu(int menuId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE)) {
            pstmt.setInt(1, menuId);
            pstmt.executeUpdate();
            System.out.println("Menu Deleted Successfully");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public List<Menu> getAllMenu() {
        List<Menu> menuList = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet res = stmt.executeQuery(SELECTALL)) {
            while (res.next()) {
                menuList.add(new Menu(res.getInt("MenuID"), res.getInt("RestaurantID"), res.getString("ItemName"),
                        res.getString("Description"), res.getDouble("Price"), res.getBoolean("IsAvailable"), res.getString("ImagePath")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return menuList;
    }
    @Override
    public List<Menu> getMenusByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement pstmt = con.prepareStatement(SELECT_BY_RESTAURANT_ID);
            )
        {

            pstmt.setInt(1, restaurantId);

            ResultSet res = pstmt.executeQuery();

            while(res.next()) {

                Menu menu = new Menu(
                        res.getInt("MenuID"),
                        res.getInt("RestaurantID"),
                        res.getString("ItemName"),
                        res.getString("Description"),
                        res.getDouble("Price"),
                        res.getBoolean("IsAvailable"),
                        res.getString("ImagePath")
                );

                menuList.add(menu);
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
}