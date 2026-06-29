package com.tap.servlets;
import java.io.IOException;
import java.util.List;

import com.tap.DAOImp.MenuDAOImp;
import com.tap.Model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/menuServlet")
public class MenuServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		MenuDAOImp menuDAOImp = new MenuDAOImp();
		int restaurantId = Integer.parseInt(req.getParameter("restaurantID"));
		List<Menu> allMenu = menuDAOImp.getMenusByRestaurantId(restaurantId);
		
		req.setAttribute("allMenu", allMenu);
		RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
		rd.forward(req, resp);
		
	}

}
