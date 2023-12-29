<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOODIE</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-image: url('./images/hotellogin.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

.button-container {
	text-align: center;
}

.button {
	display: inline-block;
	padding: 15px 30px;
	margin: 10px;
	text-decoration: none;
	color: #fff;
	border-radius: 5px;
	font-size: 16px;
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #333;
}

/* Button Colors */
.button-blue {
	background-color: #3498db;
}

.button-green {
	background-color: #2ecc71;
}

.button-orange {
	background-color: #e67e22;
}

.button-purple {
	background-color: #9b59b6;
}
</style>
</head>
<body>

	<div class="button-container">
		<a href="./hotel_registration.jsp" class="button button-blue">Hotel Register</a> <a href="./hotel_login.jsp"
			class="button button-green">Hotel Login</a> <a href="./user_login.jsp"
			class="button button-orange">User Login</a> <a href="./user_registeration.jsp"
			class="button button-purple">User Register</a>
	</div>
</body>
</html>