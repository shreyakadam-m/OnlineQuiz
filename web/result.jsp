<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Student" %>
<%
Student student = (Student) session.getAttribute("student");
if (student == null) { response.sendRedirect("login.jsp"); return; }
Object score = request.getAttribute("score");
Object total = request.getAttribute("total");
Object percentage = request.getAttribute("percentage");
if (score == null || total == null || percentage == null) { response.sendRedirect("dashboard.jsp"); return; }
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Quiz Result</title><link rel="stylesheet" href="css/style.css"></head>
<body><nav><div class="logo">Online Quiz</div><ul><li><a href="dashboard.jsp">Dashboard</a></li><li><a href="results.jsp">My Results</a></li></ul></nav>
<div class="dashboard"><h1>Quiz Result</h1><p>Your score: <strong><%= score %> / <%= total %></strong></p><p>Percentage: <strong><%= String.format("%.2f", ((Number)percentage).doubleValue()) %>%</strong></p><a class="main-button" href="QuizServlet">Try Again</a> <a class="main-button" href="results.jsp">View All Results</a></div></body></html>
