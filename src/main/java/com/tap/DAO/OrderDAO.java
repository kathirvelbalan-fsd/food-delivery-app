package com.tap.DAO;
import java.util.List;

import com.tap.Model.Order;

public interface OrderDAO {
	   void addOrder(Order order);
	    Order getOrder(int orderId);
	    void updateOrder(Order order);
	    void deleteOrder(int orderId);
	    List<Order> getAllOrders();
}
