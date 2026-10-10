<%

if(session.getAttribute("admin") == null) {

    response.sendRedirect(
            "adminLogin.jsp");

    return;
}

%>


<!DOCTYPE html>

<html>

<head>

<title>Add Question</title>

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
<a href="LogoutServlet">
Logout
</a>
</li>

</ul>

</nav>


<div class="form-container large-form">


<h2>
Add Quiz Question
</h2>


<form action="AddQuestionServlet"
      method="post">


<label>
Question
</label>

<textarea name="questionText"
          rows="4"
          required></textarea>


<label>
Option A
</label>

<input type="text"
       name="optionA"
       required>


<label>
Option B
</label>

<input type="text"
       name="optionB"
       required>


<label>
Option C
</label>

<input type="text"
       name="optionC"
       required>


<label>
Option D
</label>

<input type="text"
       name="optionD"
       required>


<label>
Correct Answer
</label>

<select name="correctAnswer"
        required>

<option value="">
Select Correct Answer
</option>

<option value="A">
A
</option>

<option value="B">
B
</option>

<option value="C">
C
</option>

<option value="D">
D
</option>

</select>


<button type="submit">

Add Question

</button>


</form>


</div>


</body>

</html>
