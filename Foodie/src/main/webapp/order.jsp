<%@page import="java.util.ArrayList"%>
<%@page import="foodie.dto.FoodItems"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url('./images/food.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
	color: white;
}

.order-bill {
	width: 60%;
	margin: 0 auto;
	border: 1px solid #ccc;
	padding: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.bill-header, .bill-item, .bill-total {
	display: flex;
	justify-content: space-between;
	padding: 8px 0;
	border-bottom: 1px solid #ccc;
}

.bill-item {
	color: white;
}

.bill-total {
	font-weight: bold;
	margin-top: 10px;
}
</style>

</style>
</head>
<body>
	<%
	String msg = (String) request.getAttribute("msg");
	%>
	<h1><%=msg%></h1>

	<%
	ArrayList<FoodItems> fl = (ArrayList<FoodItems>) request.getAttribute("order_list");
	if (fl != null && !fl.isEmpty()) {
	%>

	<div class="order-bill">

		<div class="bill-header">
			<div>Food Name</div>
			<div>Food Type</div>
			<div>Description</div>
			<div>Price</div>
			<div>Quantity</div>
			<div>Total</div>
		</div>

		<% for(FoodItems f :fl){ %>
			<div class="bill-item">
				<div><%=f.getName() %></div>
				<div><%=f.getType() %></div>
				<div><%=f.getDescription() %></div>
				<div><%=f.getPrice()%></div>
				<div><%= f.getQuantity()%></div>
				<div><%=f.getPrice()%></div>
			</div>
		<%} %>

		<br />

		<%
		// Calculate the total amount
		double totalAmount = 0;
		for (FoodItems f : fl) {
			totalAmount += f.getPrice();
		}
		%>

		<div class="bill-total">
			<p>
				Total Amount:
				<%=totalAmount%></p>
		</div>

	</div>

	<%
	}
	%>

	<div>
		<!-- Additional content if needed -->
	</div>


	<form action="gotohome" method="post">
		<button type="submit">Home</button>
	</form>
</body>
</html>