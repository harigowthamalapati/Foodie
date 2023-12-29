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
import foodie.dao.UserCrud;
import foodie.dto.FoodItems;

@WebServlet("/payment")
public class Payment extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bill = req.getParameter("amount");
		double bill_amount = Double.parseDouble(bill);
		String password = req.getParameter("password");
		UserCrud uc = new UserCrud();
		 FoodItemsCrud fc = new FoodItemsCrud();
		double wallet;
		try {
			wallet = uc.fetchWalletByPassword(password);
			if(wallet>=bill_amount) {
				double balence =wallet-bill_amount;
				uc.updateWalletByPassword( password,balence);
				req.setAttribute("msg", "Payment Sucessful.... Order Placed... Remaing Wallet Amount : "+balence);
				List<FoodItems> fl = fc.fetchAll();
				req.setAttribute("order_list", fl);
				fc.deleteAll();
				RequestDispatcher dis = req.getRequestDispatcher("order.jsp");
				dis.forward(req, resp);
			}else {
				req.setAttribute("msg", "No Sufficient Balence....... your Wallet Amount : "+wallet);
				List<FoodItems> fl = fc.fetchAll();
				req.setAttribute("cart_list", fl);
				RequestDispatcher dis = req.getRequestDispatcher("mycart.jsp");
				dis.forward(req, resp);
			}
		} catch (Exception e) {
			req.setAttribute("bill", bill);
			req.setAttribute("warn", "Incorrect Password Re-Enter Your Password");
			RequestDispatcher dis = req.getRequestDispatcher("bill.jsp");
			dis.include(req, resp);
		}
		
		
	}

}
