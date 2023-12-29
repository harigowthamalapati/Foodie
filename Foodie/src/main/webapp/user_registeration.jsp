<%@page import="foodie.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER REGISTER</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-image: url('./images/reg.png');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

.registration-container {
	background: linear-gradient(45deg, #ffff00);
	padding: 50px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
}

h2 {
	text-align: center;
	color: #333;
}

form {
	margin-top: 200px;
	display: flex;
	flex-direction: column;
	background: linear-gradient(45deg, #ffff00);
}

label {
	margin-bottom: 8px;
	color: #fff;
}

input {
	padding: 10px;
	margin-bottom: 12px;
	border: 1px solid #ccc;
	border-radius: 10px;
	transition: border-color 0.3s ease;
}

input:focus {
	border-color: #3498db;
}

button {
	background: linear-gradient(45deg, #27ae60, #2ecc71);
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button:hover {
	background: #3498;
}

p {
	text-align: center;
	margin-top: 10px;
	color: #333;
}

a {
	color: #9b59b6;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="registration-container">
		<%
		String msg = (String) request.getAttribute("msg");
		if (msg != null) {
		%>
		<marquee>
			<h1 style="color: red">
				<%=msg%></h1>
		</marquee>

		<%
		}
		%>
		<h2>User Registration</h2>
		<form method="post" action="user_register">
			<label for="firstName">First Name:</label> <input type="text"
				id="firstName" name="firstName" required> <label
				for="lastName">Last Name:</label> <input type="text" id="lastName"
				name="lastName" required> <label for="email">Email:</label>
			<input type="email" id="email" name="email" required>
			 <label
				for="password">Password:</label> <input type="password"
				id="password" name="password" required> <label
				for="confirmPassword">Confirm Password:</label> <input
				type="password" id="confirmPassword" name="confirmPassword" required>

			<label for="address">Address:</label> <input type="text" id="address"
				name="address" required> <label for="phoneNumber">Phone
				Number:</label> <input type="text" id="phoneNumber" name="phoneNumber"
				required> <label for="wallet">Wallet Amount :</label> <input
				type="number" id="wallet" name="wallet" required>

			<button type="submit">Register</button>
		</form>
		<p>
			Already have an account? <a href="user_login.jsp">Login here</a>
		</p>
	</div>

</body>
</html>