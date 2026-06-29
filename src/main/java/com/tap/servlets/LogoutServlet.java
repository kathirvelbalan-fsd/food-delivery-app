package com.tap.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate(); // செஷனை முழுமையாக அழிக்கிறது (email, cart எல்லாம் அழியும்)
        }
        // மீண்டும் உணவகங்களின் பட்டியலைக் காட்ட ரெஸ்டாரண்ட் செர்வ்லெட்டிற்கு அனுப்புகிறது
        resp.sendRedirect("callRestaurantServlet"); 
    }
}