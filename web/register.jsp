<!DOCTYPE html>

<html>

<head>

<title>Student Registration</title>

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>

<nav>

<div class="logo">
Online Quiz
</div>

<a href="index.jsp">
Home
</a>

</nav>


<div class="form-container">

<h2>
Student Registration
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


<form action="RegisterServlet"
      method="post">


<label>
Full Name
</label>

<input type="text"
       name="name"
       required>


<label>
Email
</label>

<input type="email"
       name="email"
       required>


<label>
Password
</label>

<input type="password"
       name="password"
       required>


<button type="submit">
Register
</button>


</form>


<p class="center">

Already registered?

<a href="login.jsp">
Login
</a>

</p>


</div>

</body>

</html>
