package foodie.controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.FoodCrud;
import foodie.dto.Food;

@WebServlet("/updatefood")
public class Updating_Food extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		String quantity = req.getParameter("quantity");
		int id = Integer.parseInt(req.getParameter("id"));
		FoodCrud fc = new FoodCrud();
		 Food food = fc.updateById(id,new Food(name, type, description, Double.parseDouble(price),quantity));
		try {
			List<Food> fl = fc.fetchAllByHotelId(food.getHotel().getId());
			req.setAttribute("lists", fl);
			RequestDispatcher dis = req.getRequestDispatcher("hotelfoods.jsp");
			dis.forward(req, resp);
		} catch (Exception e) {
			Food food1 = fc.fetchById(id);
			req.setAttribute("food", food1);
			RequestDispatcher dis = req.getRequestDispatcher("update_foods.jsp");
			dis.include(req, resp);
			
		}
	}

}
