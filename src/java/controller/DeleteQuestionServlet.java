package controller;

import dao.QuestionDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        if (session.getAttribute("admin") == null) {

            response.sendRedirect(
                    "adminLogin.jsp");

            return;
        }

        int id =
                Integer.parseInt(
                        request.getParameter("id"));

        new QuestionDAO().delete(id);

        response.sendRedirect(
                "questions.jsp");
    }
}