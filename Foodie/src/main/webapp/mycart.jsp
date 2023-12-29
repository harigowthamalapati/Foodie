<%@page import="foodie.dto.FoodItems"%>
<%@page import="foodie.dto.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
	background-image: url('./images/foodlogin.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

h1, h2 {
	text-align: center;
}

.cart-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.food-container {
	color: #fff;
	margin: 20px;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 250px;
	text-align: center;
	transition: transform 0.3s ease;
}

.food-container:hover {
	transform: scale(1.05);
}

.food-info {
	margin-bottom: 10px;
}

button {
	background: linear-gradient(45deg, #e74c3c, #3498db);
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	transition: background 0.3s ease;
}

button:hover {
	background: linear-gradient(45deg, #c0392b, #2980b9);
}

span {
	font-weight: bold;
}

form {
	text-align: center;
	margin-top: 20px;
}

input[type="number"] {
	padding: 8px;
	text-align: center;
	font-weight: bold;
	color: #333;
}

button[type="submit"] {
	background: linear-gradient(45deg, #27ae60, #2ecc71);
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button[type="submit"]:hover {
	background: #27ae60;
}
#quantityInput {
            width: 30px; /* Adjust the width as needed */
        }
</style>
</head>
<body>
	<h1>Welcome to My Cart</h1>
	<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null) {
	%>
	<h1><%=msg%></h1>
	<%
	}
	%>
	<%
	double bill_Amount = 0;
	ArrayList<FoodItems> fl = (ArrayList<FoodItems>) request.getAttribute("cart_list");
	if (fl != null) {
		for (FoodItems f : fl) {
			bill_Amount += f.getPrice();	
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
		<button onclick="increaseQuantity()">+</button>
		<input type="text" id="quantityInput" value="1" readonly>
		<button onclick="decreaseQuantity()">-</button>
		<button>
			<a href="deletefromcart?id=<%=f.getId()%>">Remove</a>
		</button>
	</div>
	<%
	}
	}
	%>
	
	<div>
		<h2>Bill Amount :</h2>

	</div>
	<form action="pay" method="post">
		<input type="number" name="amount" value="<%=bill_Amount%>" readonly>
		<button type="submit">Pay</button>
	</form>
	<script>
    function increaseQuantity() {
        var quantityInput = document.getElementById("quantityInput");
        var currentQuantity = parseInt(quantityInput.value, 10);
        quantityInput.value = currentQuantity + 1;
        
    }

    function decreaseQuantity() {
        var quantityInput = document.getElementById("quantityInput");
        var currentQuantity = parseInt(quantityInput.value, 10);
        if (currentQuantity > 1) {
            quantityInput.value = currentQuantity - 1;
        }
    }
</script>
</body>
</html>