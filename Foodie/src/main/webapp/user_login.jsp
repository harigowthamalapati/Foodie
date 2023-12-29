<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER LOGIN</title>

<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-image: url('./images/food.jpg');
	background-size: cover;
	background-attachment: fixed;
	background-position: center center;
	background-repeat: no-repeat;
}

.login-container {
  
  background: linear-gradient(45deg, #ffff00);
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  width: 300px;
  text-align: center;
}

form {

  background: linear-gradient(45deg, #ffff00);
  display: flex;
  flex-direction: column;
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
  border-color: #4CAF50;
}

button {
  background: linear-gradient(45deg, #E91E63, #9C27B0);
  color: #fff;
  padding: 12px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s ease;
}

button:hover {
  background: #E91E63;
}

h2 {
  color: #e74c3c;
}

a {
  color: #fff;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
  colour:green;
}

</style>
</head>
<body>
	<div class="login-container">
	<% String msg = (String)request.getAttribute("msg"); 
	if(msg!=null){%>
	
	<%= msg %>
	<%} %>
	
		<form method="post" action="user_login">
			<label for="email">Email:</label> <input type="email" id="email"
				name="email"> <label for="password">Password:</label> <input
				type="password" id="password" name="password">

			<button type="submit">Login</button> <br>
			<% String warn = (String)request.getAttribute("warn"); 
			if(warn!=null){%>
				<h2><%=warn %></h2>
			<%} %>
			<a href="./forgotpassword.jsp">Forgot Password</a>
			<a href="./user_registeration.jsp">Register Here</a>
			
		</form>
	</div>
</body>
</html>