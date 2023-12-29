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
import foodie.dao.HotelCrud;
import foodie.dto.Food;
import foodie.dto.Hotel;

@WebServlet("/hotel_login")
public class HotelLogin extends HttpServlet {
	static int count=0;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HotelCrud h = new HotelCrud();
		FoodCrud fc = new FoodCrud();
		try {
			Hotel hotel = h.fetchByEmail(email);
			if (hotel.getPassword().equals(password)) {
				req.setAttribute("lists",(List<Food>)hotel.getFood());
				RequestDispatcher dis = req.getRequestDispatcher("hotelfoods.jsp");
				dis.forward(req, resp);
			} else {
				count++;
				if(count==3) {
					req.setAttribute("warn", "Forgot Password : Change Your Password here ");
					count=0;
				}
				req.setAttribute("msg", "Incorrect Password");
				RequestDispatcher dis = req.getRequestDispatcher("hotel_login.jsp");
				dis.include(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("msg", "User Not Found");
			RequestDispatcher dis = req.getRequestDispatcher("hotel_login.jsp");
			dis.include(req, resp);
		}
	}

}
