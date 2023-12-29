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

@WebServlet("/delete")
public class DeleteFood extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int htl_id = Integer.parseInt(req.getParameter("htl_id"));
		 FoodCrud fc = new FoodCrud();
		 fc.delete(id);
		
		 try {
			List<Food> fl = fc.fetchAllByHotelId(htl_id);
			req.setAttribute("lists", fl);
			 RequestDispatcher dis = req.getRequestDispatcher("hotelfoods.jsp");
			 dis.forward(req, resp);
		} catch (Exception e) {
			
		}
	}

}
