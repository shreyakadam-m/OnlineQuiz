package controller;

import dao.QuestionDAO;
import model.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        if (session.getAttribute("admin") == null) {

            response.sendRedirect(
                    "adminLogin.jsp");

            return;
        }

        Question question =
                new Question();

        question.setQuestionText(
                request.getParameter(
                        "questionText"));

        question.setOptionA(
                request.getParameter(
                        "optionA"));

        question.setOptionB(
                request.getParameter(
                        "optionB"));

        question.setOptionC(
                request.getParameter(
                        "optionC"));

        question.setOptionD(
                request.getParameter(
                        "optionD"));

        question.setCorrectAnswer(
                request.getParameter(
                        "correctAnswer"));

        question.setQuizId(1);

        new QuestionDAO().save(question);

        response.sendRedirect(
                "questions.jsp");
    }
}