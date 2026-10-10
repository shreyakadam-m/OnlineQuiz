<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>

<title>Student Login</title>

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>

<nav>

<div class="logo">
Online Quiz
</div>

<ul>

<li>
<a href="index.jsp">
Home
</a>
</li>

</ul>

</nav>


<div class="login-container">

<h2>
Student Login
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


<form action="LoginServlet"
      method="post">

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
Login
</button>

</form>


<p class="center">

New student?

<a href="register.jsp">
Register Here
</a>

</p>


</div>

</body>

</html>
