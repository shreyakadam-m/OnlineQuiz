<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>
<%@ page import="dao.QuestionDAO" %>


<%

if(session.getAttribute("admin") == null) {

    response.sendRedirect(
            "adminLogin.jsp");

    return;
}


List<Question> questions =
        new QuestionDAO()
        .getAllQuestions();

%>


<!DOCTYPE html>

<html>

<head>

<title>Question Management</title>

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


<div class="table-container">


<h1>
Question Management
</h1>


<a class="main-button"
   href="addQuestion.jsp">

+ Add Question

</a>


<table>


<tr>

<th>
ID
</th>

<th>
Question
</th>

<th>
Option A
</th>

<th>
Option B
</th>

<th>
Option C
</th>

<th>
Option D
</th>

<th>
Answer
</th>

<th>
Action
</th>

</tr>


<%

for(Question q : questions) {

%>


<tr>

<td>
<%= q.getQuestionId() %>
</td>

<td>
<%= q.getQuestionText() %>
</td>

<td>
<%= q.getOptionA() %>
</td>

<td>
<%= q.getOptionB() %>
</td>

<td>
<%= q.getOptionC() %>
</td>

<td>
<%= q.getOptionD() %>
</td>

<td>
<strong>
<%= q.getCorrectAnswer() %>
</strong>
</td>

<td>

<a class="delete"
   href="DeleteQuestionServlet?id=<%=q.getQuestionId()%>"
   onclick="return confirm('Delete this question?');">

Delete

</a>

</td>

</tr>


<%

}

%>


</table>


</div>


</body>

</html>
