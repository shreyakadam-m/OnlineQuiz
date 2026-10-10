<!DOCTYPE html>

<html>

<head>

<title>Admin Login</title>

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>


<nav>

<div class="logo">
Online Quiz Admin
</div>

<a href="index.jsp">
Home
</a>

</nav>


<div class="login-container">

<h2>
Admin Login
</h2>


<%

if(request.getAttribute("error") != null) {

%>

<div class="error">

<%= request.getAttribute("error") %>

</div>

<%

}

%>


<form action="AdminLoginServlet"
      method="post">


<label>
Username
</label>

<input type="text"
       name="username"
       required>


<label>
Password
</label>

<input type="password"
       name="password"
       required>


<button type="submit">
Login
</button>


</form>


</div>

</body>

</html>
