package com.tap.servlets;
import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImp.UserDAOImp;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{   
		HttpSession session = req.getSession();
		String email =req.getParameter("email");
		String password =req.getParameter("password");
	
		
		UserDAOImp userDAOImp = new UserDAOImp();
		User user =userDAOImp.getUserByEmail(email);
		String dbPassw = user.getPassword();
		
		if(BCrypt.checkpw(password,dbPassw)) 
		{
			session.setAttribute("email", email);
			resp.sendRedirect("callRestaurantServlet");
		}
		else {
			resp.sendRedirect("login.html");
		}
		
		
		
		
		
	}
}
