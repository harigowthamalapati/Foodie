<%@page import="foodie.dto.Food"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Food</title>
<style type="text/css">
body {
	font-family: 'Open Sans', sans-serif;
	margin: 0;
	padding: 0;
	background: #87CEEB;
	background-image: url('./images/addfood.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: #3498db;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	display: block;
	margin-top: 15px;
	color: #fff;
}

input, textarea {
	width: 100%;
	padding: 10px;
	margin-top: 8px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}
a{
	color:#fff;
}
button {
	background: linear-gradient(45deg, #3498db, #44bd32);
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	width: 100%;
	box-sizing: border-box;
	margin-top: 20px;
	transition: background 0.3s ease;
}

button:hover {
	background: linear-gradient(45deg, #2980b9, #36ad49);
}
</style>
</head>
<body>
	<div class="container">
		<h1>Food Variety</h1>
		<form method="post" id="foodForm" action="updatefood">
			<%
			Food f = (Food) request.getAttribute("food");
			if (f != null) {
			%>

			<label for="foodName">Food Name</label> <input type="text"
				id="name" name="name" value="<%=f.getName()%>"> <label
				for="foodType">Food Type</label> <input type="text" id="type"
				name="type" value="<%=f.getType()%>"> <label
				for="description">Description</label>
			<textarea id="description" name="description"
				value="<%=f.getDescription()%>"></textarea>

			<label for="price">Price</label> <input type="number" id="price"
				name="price" value="<%=f.getPrice()%>"> <label
				for="quantity">Quantity</label> <input type="text" id="quantity"
				name="quantity" value="<%=f.getQuantity()%>"> <label
				for="id">Food ID</label> <input type="number" id="id" name="id"
				value="<%=f.getId()%>" readonly>
			<%
			}
			%>
			<button type="submit">Update Food</button>

		</form>


	</div>
</body>
</html>