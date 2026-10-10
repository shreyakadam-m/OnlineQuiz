<%@ page import="model.Admin" %>


<%

Admin admin =
        (Admin) session.getAttribute(
                "admin");

if(admin == null) {

    response.sendRedirect(
            "adminLogin.jsp");

    return;
}

%>


<!DOCTYPE html>

<html>

<head>

<title>Admin Dashboard</title>

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>


<nav>

<div class="logo">
Online Quiz Admin
</div>

<ul>

<li>
<a href="adminDashboard.jsp">
Dashboard
</a>
</li>

<li>
<a href="questions.jsp">
Questions
</a>
</li>

<li>
<a href="addQuestion.jsp">
Add Question
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
Admin Dashboard
</h1>


<p>
Welcome, <%= admin.getUsername() %>
</p>


<div class="dashboard-cards">


<div class="dashboard-card">

<div class="big-icon">
?
</div>

<h3>
Manage Questions
</h3>

<p>
Add and delete quiz questions.
</p>

<a href="questions.jsp">
Manage Questions ?
</a>

</div>


<div class="dashboard-card">

<div class="big-icon">
?
</div>

<h3>
Add Question
</h3>

<p>
Create a new multiple-choice question.
</p>

<a href="addQuestion.jsp">
Add Question ?
</a>

</div>


</div>


</div>


</body>

</html>
