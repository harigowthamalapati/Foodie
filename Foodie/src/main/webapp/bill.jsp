<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 50px;
	text-align: center;
	background-image: url('./images/food.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

h1 {
	font-size: 2.5em;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

input {
	padding: 12px;
	margin: 8px 0;
	border: none;
	border-bottom: 2px solid #fff;
	outline: none;
	background: transparent;
	color: #fff;
	width: 100%;
	box-sizing: border-box;
	transition: border-bottom-color 0.3s ease;
}

input:focus {
	border-bottom-color: #3498db;
}

button {
	background: linear-gradient(45deg, #3498db, #44bd32);
	color: #fff;
	padding: 14px;
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
	<%
	String msg = (String) request.getAttribute("bill");
	String warn = (String) request.getAttribute("warn");
	if (warn != null) {
	%>
	<h1><%=warn%></h1>
	<%
	}
	%>


	<form action="payment" method="post">
		Bill Amount : <input name="amount" value="<%=msg%>" readonly>
		Enter Your Password : <input type="password" name=password>
		<button type="submit">Payment</button>
	</form>

</body>
</html>