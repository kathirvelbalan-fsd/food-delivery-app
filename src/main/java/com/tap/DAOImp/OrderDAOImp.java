package com.tap.DAOImp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.OrderDAO;
import com.tap.Model.Order;
import com.tap.Utility.DBConnection;

public class OrderDAOImp implements OrderDAO {

    private static final String INSERT = "INSERT INTO ordertable (UserID, TotalAmount, Status, PaymentMethod, RestaurantID) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT = "SELECT * FROM ordertable WHERE OrderID = ?";
    private static final String UPDATE = "UPDATE ordertable SET UserID = ?, TotalAmount = ?, Status = ?, PaymentMethod = ?, RestaurantID = ? WHERE OrderID = ?";
    private static final String DELETE = "DELETE FROM ordertable WHERE OrderID = ?";
    private static final String SELECT_ALL = "SELECT * FROM ordertable";

    @Override
    public void addOrder(Order order) {
        String checkUser = "SELECT COUNT(*) FROM user WHERE UserID = ?";
        String checkRest = "SELECT COUNT(*) FROM restaurant WHERE RestaurantID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement checkUStmt = con.prepareStatement(checkUser);
             PreparedStatement checkRStmt = con.prepareStatement(checkRest);
             PreparedStatement pstmt = con.prepareStatement(INSERT)) {

            checkUStmt.setInt(1, order.getUserId());
            try (ResultSet rs = checkUStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    System.out.println("❌ Foreign Key Error: User ID unga database la illai!");
                    return;
                }
            }

            checkRStmt.setInt(1, order.getRestaurantId());
            try (ResultSet rs = checkRStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    System.out.println("❌ Foreign Key Error: Restaurant ID unga database la illai!");
                    return;
                }
            }

            pstmt.setInt(1, order.getUserId());
            pstmt.setDouble(2, order.getTotalAmount());
            pstmt.setString(3, order.getStatus());
            pstmt.setString(4, order.getPaymentMethod());
            pstmt.setInt(5, order.getRestaurantId());

            pstmt.executeUpdate();
            System.out.println("✔ Order Created Successfully!");

        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public Order getOrder(int orderId) {
        Order order = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT)) {
            pstmt.setInt(1, orderId);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    order = new Order(res.getInt("OrderID"), res.getInt("UserID"), res.getTimestamp("OrderDate"),
                            res.getDouble("TotalAmount"), res.getString("Status"), res.getString("PaymentMethod"), res.getInt("RestaurantID"));
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return order;
    }

    @Override
    public void updateOrder(Order order) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE)) {
            pstmt.setInt(1, order.getUserId());
            pstmt.setDouble(2, order.getTotalAmount());
            pstmt.setString(3, order.getStatus());
            pstmt.setString(4, order.getPaymentMethod());
            pstmt.setInt(5, order.getRestaurantId());
            pstmt.setInt(6, order.getOrderId());

            pstmt.executeUpdate();
            System.out.println("✔ Order Updated Successfully!");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void deleteOrder(int orderId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE)) {
            pstmt.setInt(1, orderId);
            pstmt.executeUpdate();
            System.out.println("✔ Order Deleted!");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet res = stmt.executeQuery(SELECT_ALL)) {
            while (res.next()) {
                list.add(new Order(res.getInt("OrderID"), res.getInt("UserID"), res.getTimestamp("OrderDate"),
                        res.getDouble("TotalAmount"), res.getString("Status"), res.getString("PaymentMethod"), res.getInt("RestaurantID")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}