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
import foodie.dao.FoodItemsCrud;
import foodie.dto.Food;
import foodie.dto.FoodItems;

@WebServlet("/deletefromcart")
public class DeleteFromCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		FoodItemsCrud fc = new FoodItemsCrud();
		if (id != null) {
			fc.delete(Integer.parseInt(id));
			List<FoodItems> fl = fc.fetchAll();
			req.setAttribute("cart_list", fl);
			RequestDispatcher dis = req.getRequestDispatcher("mycart.jsp");
			dis.forward(req, resp);
		} else {
			List<FoodItems> fl = fc.fetchAll();
			req.setAttribute("cart_list", fl);
			RequestDispatcher dis = req.getRequestDispatcher("mycart.jsp");
			dis.include(req, resp);
		}

	}

}
