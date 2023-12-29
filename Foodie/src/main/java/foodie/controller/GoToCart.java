package foodie.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.FoodItemsCrud;
import foodie.dto.FoodItems;
@WebServlet("/gotocart")
public class GoToCart extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FoodItemsCrud fi = new FoodItemsCrud();
		List<FoodItems> food_list = fi.fetchAll();
		req.setAttribute("cart_list", food_list);
		RequestDispatcher dis = req.getRequestDispatcher("mycart.jsp");
		dis.forward(req, resp);
	
	}

}
