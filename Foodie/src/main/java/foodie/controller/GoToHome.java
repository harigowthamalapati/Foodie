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
import foodie.dto.Food;

@WebServlet("/gotohome")
public class GoToHome extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	FoodCrud fc = new FoodCrud();
	List<Food> list = fc.fetchAll();
	req.setAttribute("foods", list);
	RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
	dis.forward(req, resp);
	}

}
