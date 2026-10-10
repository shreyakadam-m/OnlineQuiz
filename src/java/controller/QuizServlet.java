package controller;

import dao.QuestionDAO;
import model.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        if (session.getAttribute("student") == null) {

            response.sendRedirect("login.jsp");

            return;
        }

        QuestionDAO dao =
                new QuestionDAO();

        List<Question> questions =
                dao.getAllQuestions();

        request.setAttribute(
                "questions",
                questions);

        request.getRequestDispatcher(
                "quiz.jsp")
                .forward(request, response);
    }
}