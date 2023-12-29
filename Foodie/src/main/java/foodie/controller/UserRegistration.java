package foodie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.UserCrud;
import foodie.dto.User;

@WebServlet("/user_register")
public class UserRegistration extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String name = req.getParameter("firstName");
		String last_name = req.getParameter("lastName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confPassword = req.getParameter("confirmPassword");
		String address = req.getParameter("address");
		String phone = req.getParameter("phoneNumber");
		String wallet = req.getParameter("wallet");
		 UserCrud user = new UserCrud();
		 try {
			 if(password.equals(confPassword)) {
				 user.save(new User(name, last_name, email, confPassword, address, Long.parseLong(phone), Double.parseDouble(wallet)));
				 RequestDispatcher dis = req.getRequestDispatcher("user_login.jsp");
				 dis.forward(req, resp);
			 }else {
				 req.setAttribute("msg","Password Mis-Match");
				RequestDispatcher dis = req.getRequestDispatcher("user_registeration.jsp");
				dis.include(req, resp);
			 }
			
		}  catch (Exception e) {
			req.setAttribute("msg","User Already Exist");
			RequestDispatcher dis = req.getRequestDispatcher("user_registeration.jsp");
			dis.include(req, resp);
			
		}
	}

}
