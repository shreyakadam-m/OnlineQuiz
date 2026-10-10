package controller;

import dao.QuestionDAO;
import dao.ResultDAO;
import model.Question;
import model.Result;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/SubmitQuizServlet")
public class SubmitQuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        Student student =
                (Student) session.getAttribute(
                        "student");

        if (student == null) {

            response.sendRedirect(
                    "login.jsp");

            return;
        }

        QuestionDAO questionDAO =
                new QuestionDAO();

        List<Question> questions =
                questionDAO.getAllQuestions();

        int score = 0;

        for (Question question : questions) {

            String selectedAnswer =
                    request.getParameter(
                            "q" +
                            question.getQuestionId());

            if (selectedAnswer != null &&
                    selectedAnswer.equalsIgnoreCase(
                            question.getCorrectAnswer())) {

                score++;
            }
        }

        int total =
                questions.size();

        double percentage = 0;

        if (total > 0) {

            percentage =
                    ((double) score / total) * 100;
        }

        Result result =
                new Result();

        result.setStudentId(
                student.getStudentId());

        result.setQuizId(1);

        result.setScore(score);

        result.setTotalQuestions(total);

        result.setPercentage(
                percentage);

        new ResultDAO().save(result);

        request.setAttribute(
                "score",
                score);

        request.setAttribute(
                "total",
                total);

        request.setAttribute(
                "percentage",
                percentage);

        request.getRequestDispatcher(
                "result.jsp")
                .forward(request, response);
    }
}