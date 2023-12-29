package foodie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.FoodCrud;
import foodie.dto.Food;

@WebServlet("/update")
public class UpdateFood extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		FoodCrud fc = new FoodCrud();
		Food food = fc.fetchById(id);
		req.setAttribute("food", food);
		RequestDispatcher dis = req.getRequestDispatcher("update_food.jsp");
		dis.forward(req, resp);
	}

}
