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

@WebServlet("/search")
public class Search extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		FoodCrud fc = new FoodCrud();
		HotelCrud hc = new HotelCrud();
		try {
			List<Food> f_list = fc.fetchByFoodName(search);
			if (!f_list.isEmpty()) {
				req.setAttribute("foods", f_list);
				RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
				dis.forward(req, resp);

			} else {
				Hotel htl = hc.fetchByHotelName(search);
				System.out.println(hc.fetchByHotelName(search));
				List<Food> htl_f_list = (List<Food>) htl.getFood();
				if (!htl_f_list.isEmpty()) {
					System.out.println(htl_f_list);
					req.setAttribute("foods", htl_f_list);
					RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
					dis.forward(req, resp);
				}
				
			}

		} catch (Exception e) {
			req.setAttribute("result", "No Result Found");
			List<Food> fl = fc.fetchAll();
			req.setAttribute("foods", fl);
			RequestDispatcher dis = req.getRequestDispatcher("user_home.jsp");
			dis.include(req, resp);
			
		}

	}

}
