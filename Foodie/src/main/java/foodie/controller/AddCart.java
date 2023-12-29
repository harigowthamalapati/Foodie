package foodie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.FoodCrud;
import foodie.dao.FoodItemsCrud;
import foodie.dto.Food;
import foodie.dto.FoodItems;

@WebServlet("/addcart")
public class AddCart extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		FoodCrud fc = new FoodCrud();
		FoodItemsCrud fi = new FoodItemsCrud();
		Food food = fc.fetchById(Integer.parseInt(id));
		try {
			fi.save(new FoodItems(food.getName(), food.getType(), food.getDescription(),food.getPrice(), food.getQuantity()));
			List<Food> fl = fc.fetchAll();
			req.setAttribute("foods", fl);
			RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
			dis.include(req, resp);
		} catch (Exception e) {
			List<Food> fl = fc.fetchAll();
			req.setAttribute("foods", fl);
			RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
			dis.include(req, resp);
			e.printStackTrace();
		}
		

	}

}
