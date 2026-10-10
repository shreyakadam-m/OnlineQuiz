<%@ page import="model.Student" %>

<%
Student student =
        (Student) session.getAttribute("student");

if(student == null) {

    response.sendRedirect("login.jsp");

    return;
}
%>


<!DOCTYPE html>

<html>

<head>

<title>Student Dashboard</title>

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
<a href="dashboard.jsp">
Dashboard
</a>
</li>

<li>
<a href="QuizServlet">
Take Quiz
</a>
</li>

<li>
<a href="results.jsp">
My Results
</a>
</li>

<li>
<a href="LogoutServlet">
Logout
</a>
</li>

</ul>

</nav>


<div class="dashboard">

<h1>
Welcome, <%= student.getName() %>!
</h1>

<p>
Ready to test your knowledge?
</p>


<div class="dashboard-cards">


<div class="dashboard-card">

<div class="big-icon">
?
</div>

<h3>
Take Quiz
</h3>

<p>
Start the online multiple-choice quiz.
</p>

<a href="QuizServlet">
Start Quiz ?
</a>

</div>


<div class="dashboard-card">

<div class="big-icon">
?
</div>

<h3>
My Results
</h3>

<p>
View your previous quiz scores.
</p>

<a href="results.jsp">
View Results ?
</a>

</div>


<div class="dashboard-card">

<div class="big-icon">
?
</div>

<h3>
My Profile
</h3>

<p>
Name: <%= student.getName() %>
</p>

<p>
Email: <%= student.getEmail() %>
</p>

</div>


</div>

</div>


<footer>

<p>
Online Quiz Management System
</p>

</footer>

</body>

</html>
