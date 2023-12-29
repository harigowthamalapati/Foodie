package foodie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Perform logout logic
        HttpSession session = req.getSession();
        session.invalidate(); // Invalidate the session (clear user data)

        // Redirect to the login page
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
	}

}
