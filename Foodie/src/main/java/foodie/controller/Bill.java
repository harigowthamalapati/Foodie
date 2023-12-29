package foodie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foodie.dao.UserCrud;
@WebServlet("/pay")
public class Bill extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bill = req.getParameter("amount");
		req.setAttribute("bill", bill);
		RequestDispatcher dis = req.getRequestDispatcher("bill.jsp");
		dis.forward(req, resp);
	}
	
}
