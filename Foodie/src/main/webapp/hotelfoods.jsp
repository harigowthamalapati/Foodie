<%@page import="foodie.dto.Food"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-image: url('./images/food.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

.food-container {
	background: linear-gradient(135deg, #ffff00);
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 20px;
	padding: 20px;
	color: #fff;
}

.food-info {
	margin-bottom: 15px;
}

.food-info label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

.food-info span {
	display: block;
	color: #eee;
}

.btn-container {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
}

.update-btn, .delete-btn {
	background: linear-gradient(45deg, #E91E63, #9C27B0);
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.update-btn:hover, .delete-btn:hover {
	background: linear-gradient(135deg, #c0392b, #e08e0b);
}

.btns {
	background: green;
	margin-top: 20px;
}

.btns a {
	text-decoration: none;
	color: #fff;
}

.btns button {
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.btns button:hover {
	background: linear-gradient(135deg, #27ae60, #2980b9);
}
</style>
</head>
<body>
	<%
	List<Food> fl = (List<Food>) request.getAttribute("lists");
	if (fl != null && !fl.isEmpty()) {
		for (Food f : fl) {
	%>


	<div class="food-container">
		<div class="food-info">
			<label for="food-name">Food Name:</label> <span id="food-name"><%=f.getName()%></span>
		</div>

		<div class="food-info">
			<label for="food-type">Food Type:</label> <span id="food-type"><%=f.getType()%></span>
		</div>

		<div class="food-info">
			<label for="description">Description:</label> <span id="description"><%=f.getDescription()%></span>
		</div>

		<div class="food-info">
			<label for="price">Price:</label> <span id="price"><%=f.getPrice()%></span>
		</div>

		<div class="food-info">
			<label for="quantity">Quantity:</label> <span id="quantity"><%=f.getQuantity()%></span>
		</div>

		<div class="btn-container">
			<button class="update-btn">
				<a href="update?id=<%=f.getId()%>">Update</a>
			</button>
			<button class="delete-btn">
				<a href="delete?id=<%=f.getId()%>&htl_id=<%=f.getHotel().getId()%>">Delete</a>
			</button>
		</div>
	</div>
	<%
	}
	}
	%>

	<div>
		<button class="btns">
			<a href="food.jsp">Add Food</a>
		</button>
		<br>
		<button class="btns">
			<a href="logout">Logout</a>
		</button>
	</div>

</body>
</html>