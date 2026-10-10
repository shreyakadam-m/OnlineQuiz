<%@ page import="java.util.List" %>
<%@ page import="model.Question" %>
<%@ page import="model.Student" %>
<%
Student student = (Student) session.getAttribute("student");
if (student == null) {
    response.sendRedirect("login.jsp");
    return;
}
List<Question> questions = (List<Question>) request.getAttribute("questions");
if (questions == null) {
    response.sendRedirect("QuizServlet");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Take Quiz</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav><div class="logo">Online Quiz</div>
<ul><li><a href="dashboard.jsp">Dashboard</a></li><li><a href="LogoutServlet">Logout</a></li></ul></nav>
<div class="table-container">
<h1>Online Quiz</h1>
<% if (questions.isEmpty()) { %>
<p>No questions are available yet. Please check back later.</p>
<% } else { %>
<form action="SubmitQuizServlet" method="post">
<% for (Question q : questions) { %>
<div class="dashboard-card">
<h3><%= q.getQuestionId() %>. <%= q.getQuestionText() %></h3>
<label><input type="radio" name="q<%= q.getQuestionId() %>" value="A" required> A. <%= q.getOptionA() %></label><br>
<label><input type="radio" name="q<%= q.getQuestionId() %>" value="B"> B. <%= q.getOptionB() %></label><br>
<label><input type="radio" name="q<%= q.getQuestionId() %>" value="C"> C. <%= q.getOptionC() %></label><br>
<label><input type="radio" name="q<%= q.getQuestionId() %>" value="D"> D. <%= q.getOptionD() %></label>
</div>
<% } %>
<button type="submit" class="main-button">Submit Quiz</button>
</form>
<% } %>
</div>
</body>
</html>
