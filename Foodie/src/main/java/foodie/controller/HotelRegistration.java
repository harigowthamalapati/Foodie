package foodie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.HotelCrud;
import foodie.dto.Hotel;

@WebServlet("/hotel_register")
public class HotelRegistration extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hotelName = req.getParameter("hotelName");
		String contactPerson = req.getParameter("contactPerson");
		String contact = req.getParameter("contact");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confPassword = req.getParameter("confirmPassword");
		HotelCrud h = new HotelCrud();
		try {
			if (password.equals(confPassword)) {

				h.save(new Hotel(hotelName, contactPerson, Long.parseLong(contact), email, confPassword));
				RequestDispatcher dis = req.getRequestDispatcher("hotel_login.jsp");
				dis.forward(req, resp);
			} else {
				req.setAttribute("msg", "Password Mis_ Match");
				RequestDispatcher dis = req.getRequestDispatcher("hotel_registration.jsp");
				dis.include(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("msg", "User Already Exist");
			RequestDispatcher dis = req.getRequestDispatcher("hotel_registration.jsp");
			dis.include(req, resp);
			e.printStackTrace();
		}

	}
}
