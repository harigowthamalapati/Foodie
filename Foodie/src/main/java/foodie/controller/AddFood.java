package foodie.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import foodie.dto.User;

@WebServlet("/addfood")
public class AddFood extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String foodName = req.getParameter("foodName");
		String foodType = req.getParameter("foodType");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		String quantity = req.getParameter("quantity");
		String password = req.getParameter("password");
		HotelCrud hc = new HotelCrud();
		FoodCrud f = new FoodCrud();
		try {
			Hotel hotel = hc.fetchByPassword(password);
			if (hotel != null) {
				f.save(new Food(foodName, foodType, description, Double.parseDouble(price),quantity),
						hotel.getId());
				List<Food> list = f.fetchAllByHotelId(hotel.getId());
				req.setAttribute("lists", list);
				RequestDispatcher dis = req.getRequestDispatcher("hotelfoods.jsp");
				dis.include(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("msg", "Food Not added");
			RequestDispatcher dis = req.getRequestDispatcher("food.jsp");
			dis.include(req, resp);
			e.printStackTrace();
		}
	}

}
