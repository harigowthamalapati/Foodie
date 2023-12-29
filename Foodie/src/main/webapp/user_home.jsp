<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="foodie.dto.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	background-image: url('./images/food.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

h1 {
	text-align: center;
	color: #fff;
}

form {
	text-align: center;
	margin-bottom: 20px;
}

label {
	font-weight: bold;
	color: #fff;
}

input[type="text"] {
	border-radius: 10px;
	padding: 8px;
}

input[type="submit"] {
	padding: 8px 16px;
	color: #e74c3c, #3498db;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #27ae60;
}

.food-container {
	background: linear-gradient(45deg, #ffff00);
	padding: 20px;
	margin: 20px 0;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.food-info {
	display: flex;
	margin-bottom: 10px;
}

span {
	padding-left: 15px;
	color: #fff;
	font-family: Bold;
	font-size: 20px;
	color: #fff;
}

.btn-container {
	text-align: center;
	margin-top: 10px;
}

.addcart-btn {
	background: linear-gradient(45deg, #e74c3c, #3498db);
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
}

.addcart-btn a {
	color: #fff;
	text-decoration: none;
}

.addcart-btn:hover {
	background: linear-gradient(45deg, #c0392b, #2980b9);
}

button {
	background: linear-gradient(45deg, #e67e22, #3498db);
	
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background: linear-gradient(45deg, #d35400, #2980b9);
}
</style>
</head>
<body>
	<h1>Welcome To Foodie...</h1>
	<form action="search" method="get">
		</label> <input type="text" 
			name="search" required> <input type="submit" value="Search" id="search">
	</form>
	<% String result= (String)request.getAttribute("result"); 
	if(result!=null){
	%>
	<%=result %>
	<%} %>
	<%
	List<Food> fl = (List<Food>) request.getAttribute("foods");
	if (fl != null) {
		for (Food f : fl) {
	%>


	<div class="food-container">
		<div class="food-info">
			<label style="font-size: 40px " for="hotel-name">HOTEL NAME </label> <span style="font-size: 40px"id="hotel-name"><%=f.getHotel().getHotel_Name()%></span>
		</div>
		<div class="food-info">
			<label for="food-name">FOOD NAME</label> <span id="food-name"><%=f.getName()%></span>
		</div>

		<div class="food-info">
			<label for="food-type">FOOD TYPE </label> <span id="food-type"><%=f.getType()%></span>
		</div>

		<div class="food-info">
			<label for="description">DESCRIPTION</label> <span id="description"><%=f.getDescription()%></span>
		</div>

		<div class="food-info">
			<label for="price">PRICE</label> <span id="price"><%=f.getPrice()%></span>
		</div>

		<div class="food-info">
			<label for="quantity">QUANTITY</label> <span id="quantity"><%=f.getQuantity()%></span>
		</div>

		<div class="btn-container">
			<button class="addcart-btn">
				<a href="addcart?id=<%=f.getId()%>">ADD CART</a>
			</button>
		</div>
	</div>
	<%
	}
	}
	%>
	<div>
		<form action="gotocart" method="post">
			<button type="submit">CART</button>
		</form>
</body>
</html>