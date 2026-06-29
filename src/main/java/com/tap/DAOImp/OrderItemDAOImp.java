package com.tap.DAOImp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.OrderItemDAO;
import com.tap.Model.OrderItem;
import com.tap.Utility.DBConnection;

public class OrderItemDAOImp implements OrderItemDAO {

    private static final String INSERT = "INSERT INTO orderitem (OrderID, MenuID, Quantity, ItemTotal) VALUES (?, ?, ?, ?)";
    private static final String SELECT = "SELECT * FROM orderitem WHERE OrderItemID = ?";
    private static final String UPDATE = "UPDATE orderitem SET OrderID = ?, MenuID = ?, Quantity = ?, ItemTotal = ? WHERE OrderItemID = ?";
    private static final String DELETE = "DELETE FROM orderitem WHERE OrderItemID = ?";
    private static final String SELECT_ALL = "SELECT * FROM orderitem";

    @Override
    public void addOrderItem(OrderItem orderItem) {
        String checkOrder = "SELECT COUNT(*) FROM ordertable WHERE OrderID = ?";
        String checkMenu = "SELECT COUNT(*) FROM menu WHERE MenuID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement checkOStmt = con.prepareStatement(checkOrder);
             PreparedStatement checkMStmt = con.prepareStatement(checkMenu);
             PreparedStatement pstmt = con.prepareStatement(INSERT)) {

            checkOStmt.setInt(1, orderItem.getOrderId());
            try (ResultSet rs = checkOStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    System.out.println("❌ Foreign Key Error: Intha Order ID innum create aagala!");
                    return;
                }
            }

            checkMStmt.setInt(1, orderItem.getMenuId());
            try (ResultSet rs = checkMStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    System.out.println("❌ Foreign Key Error: Intha Menu ID table la illai!");
                    return;
                }
            }

            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());

            pstmt.executeUpdate();
            System.out.println("✔ Item Added to OrderItem Table!");

        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        OrderItem item = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(SELECT)) {
            pstmt.setInt(1, orderItemId);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    item = new OrderItem(res.getInt("OrderItemID"), res.getInt("OrderID"),
                            res.getInt("MenuID"), res.getInt("Quantity"), res.getDouble("ItemTotal"));
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return item;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE)) {
            pstmt.setInt(1, orderItem.getOrderId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getItemTotal());
            pstmt.setInt(5, orderItem.getOrderItemId());

            pstmt.executeUpdate();
            System.out.println("✔ Order Item Updated!");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE)) {
            pstmt.setInt(1, orderItemId);
            pstmt.executeUpdate();
            System.out.println("✔ Item Removed from Order!");
        } catch (SQLException e) { e.printStackTrace(); }
    }

    @Override
    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet res = stmt.executeQuery(SELECT_ALL)) {
            while (res.next()) {
                list.add(new OrderItem(res.getInt("OrderItemID"), res.getInt("OrderID"),
                        res.getInt("MenuID"), res.getInt("Quantity"), res.getDouble("ItemTotal")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}