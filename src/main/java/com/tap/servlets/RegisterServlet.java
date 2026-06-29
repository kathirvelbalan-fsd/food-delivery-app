package com.tap.servlets;
import java.io.IOException;
import java.io.PrintWriter;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImp.UserDAOImp;
import com.tap.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String name = req.getParameter("userName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		String address = req.getParameter("address");
		String hashPw = BCrypt.hashpw(password,BCrypt.gensalt(12) );
		
		
		User user = new User(name,hashPw,email,address,role);
		
		UserDAOImp userDAOImp = new UserDAOImp();
		int res = userDAOImp.addUser(user);
		
		if(res > 0) 
		{
			resp.sendRedirect("login.html");
		}
		else 
		{   
			resp.sendRedirect("reg.html");
		}
	}
}
