<%@ page import="java.util.List" %>
<%@ page import="model.Result" %>
<%@ page import="dao.ResultDAO" %>
<%@ page import="model.Student" %>


<%

Student student =
        (Student) session.getAttribute(
                "student");

if(student == null) {

    response.sendRedirect(
            "login.jsp");

    return;
}


List<Result> results =
        new ResultDAO()
        .getAllResults();

%>


<!DOCTYPE html>

<html>

<head>

<title>My Results</title>

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
<a href="LogoutServlet">
Logout
</a>
</li>

</ul>

</nav>


<div class="table-container">


<h1>
My Quiz Results
</h1>


<table>


<tr>

<th>
Result ID
</th>

<th>
Score
</th>

<th>
Total
</th>

<th>
Percentage
</th>

</tr>


<%

for(Result r : results) {

if(r.getStudentId() ==
        student.getStudentId()) {

%>


<tr>

<td>
<%= r.getResultId() %>
</td>

<td>
<%= r.getScore() %>
</td>

<td>
<%= r.getTotalQuestions() %>
</td>

<td>
<%= r.getPercentage() %>%
</td>

</tr>


<%

}

}

%>


</table>


</div>


</body>

</html>
