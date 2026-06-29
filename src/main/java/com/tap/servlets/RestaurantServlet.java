package com.tap.servlets;
import java.io.IOException;
import java.util.List;

import com.tap.DAOImp.RestaurantDAOImp;
import com.tap.Model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/callRestaurantServlet")
public class RestaurantServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		RestaurantDAOImp restDAOImp = new RestaurantDAOImp();
		List<Restaurant> allRestaurants = restDAOImp.getAllRestaurant();
		
		req.setAttribute("restaurants", allRestaurants);
		RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
		rd.forward(req, resp);
	}
}
