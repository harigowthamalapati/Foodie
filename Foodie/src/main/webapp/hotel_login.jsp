<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL LOGIN</title>
<style>
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

.login-container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background: linear-gradient(45deg, #ffff00);
	border: 1px solid #34495e;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	display: block;
	margin-bottom: 8px;
}

input {
	width: 100%;
	color:#ffff00;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #2c3e50;
	border-radius: 5px;
	box-sizing: border-box;
}

button {
	background: linear-gradient(45deg, #e74c3c, #c0392b);
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	width: 100%;
	box-sizing: border-box;
	transition: background 0.3s ease;
}

button:hover {
	background: linear-gradient(45deg, #d9534f, #b6473d);
}
</style>
</head>
<body>
	<div class="login-container">

		<form method="post" action="hotel_login">
			<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null) {
			%>
			<h3><%=msg%></h3>

			<%
			}
			%>
			<label for="email">Email:</label> <input type="email" id="email"
				name="email"> <label for="password">Password:</label> <input
				type="password" id="password" name="password">

			<button type="submit">Login</button>
			<% String warn = (String)request.getAttribute("warn"); 
			if(warn!=null){%>
				<h2><%=warn %></h2>
			<%} %>
			<a href="./forgotpassword.jsp">Forgot Password</a>
			<a href="./hotel_registration.jsp">Register Here</a>
		</form>
</body>
</html>