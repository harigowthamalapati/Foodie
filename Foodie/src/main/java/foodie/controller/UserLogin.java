package foodie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.FoodCrud;
import foodie.dao.UserCrud;
import foodie.dto.Food;
import foodie.dto.User;

@WebServlet("/user_login")
public class UserLogin extends HttpServlet {
	static int count=0;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		UserCrud u = new UserCrud();
		FoodCrud fc = new FoodCrud();
		User user;
		try {
			user = u.fetchByEmail(email);
			if (user.getPassword().equals(password)) {
				List<Food> fl = fc.fetchAll();
				req.setAttribute("foods", fl);
				RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
				dis.forward(req, resp);
			} else {
				count++;
				if(count==3) {
					req.setAttribute("warn", "Forgot Password : Change Your Password here");
					count=0;
				}
				req.setAttribute("msg", "Incorrect Password");
				RequestDispatcher dis = req.getRequestDispatcher("user_logn.jsp");
				dis.include(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("msg", "User Not Found");
			RequestDispatcher dis = req.getRequestDispatcher("user_login.jsp");
			dis.include(req, resp);
			e.printStackTrace();
		}

	}

}
