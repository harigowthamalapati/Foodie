<%@page import="java.util.List"%>
<%@page import="foodie.dto.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOOD ITEMS</title>
<style type="text/css">
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-image: url('./images/addfood.jpg');
	background-size:cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

h1 {
	text-align: center;
	color: #fff;
	/* Text color for better contrast on the gradient background */
}

.container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background: rgba(255, 255, 255, 0.8);
	/* Semi-transparent white background */
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
	background: linear-gradient(135deg, #44bd32, #3498db);
	/* Gradient for form */
	padding: 15px;
	border-radius: 8px;
}

label {
	font-weight: bold;
	margin-top: 15px;
	color: #fff;
}

input, textarea, button {
	width: 100%;
	padding: 10px;
	margin-top: 8px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

button {
	background: linear-gradient(45deg, #3498db, #fff);
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button:hover {
	background: linear-gradient(45deg, #2980b9, #36ad49);
}
</style>
</head>
<body>
	<h1>Food Variety</h1>
	<div class="container">
		<form method="post" id="foodForm" action="addfood">
			<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null) {
			%>

			<%=msg%>

			<%
			}
			%>
			<label for="foodName">Food Name</label> <input type="text"
				id="foodName" name="foodName" required> <label
				for="foodType">Food Type</label> <input type="text" id="foodType"
				name="foodType" required> <label for="description">Description</label>
			<textarea id="description" name="description" required></textarea>

			<label for="price">Price</label> <input type="number" id="price"
				name="price" min="0" step="0.01" required> <label
				for="quantity">Quantity</label> <input type="text" id="quantity"
				name="quantity" min="0" required> <br> <label
				for="quantity">Password </label> <input type="password"
				id="quantity" name="password" min="0" required>
			<button type="submit">Add Food</button>

		</form>


	</div>
</body>
</html>