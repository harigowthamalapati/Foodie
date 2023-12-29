<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOTEL REGISTER</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-image: url('./images/reg.png');
	background-size: 100%;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

form {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background: linear-gradient(45deg, #ffff00);
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	color:white;
}

label {
	display: block;
	margin-bottom: 8px;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
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
	transition: background 0.3s ease;
}

button:hover {
	background: linear-gradient(45deg, #2980b9, #36ad49);
}
</style>
</head>
<body>
	<form method="post" action="hotel_register">
	<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null) {
			%>
			<h3><%=msg%></h3>

			<%
			}
			%>
		<label for="hotelName">Hotel Name:</label> <input type="text"
			id="hotelName" name="hotelName"> <label for="contactPerson">Contact
			Person:</label> <input type="text" id="contactPerson" name="contactPerson">
		<label for="contact">Contact Number:</label> <input type="tel"
			id="contact" name="contact" minlength="10" maxlength="12"> <label for="email">Email:</label>
		<input type="email" id="email" name="email">
	
		 <label
			for="password">Password:</label> <input type="password" id="password"
			name="password" minlength="8" maxlength="16"> <label for="confirmPassword">Confirm
			Password:</label>
			 <input type="password" id="confirmPassword"
			name="confirmPassword">

		<button type="submit">Register</button>
	</form>
</body>
</html>