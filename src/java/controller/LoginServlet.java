package controller;

import dao.StudentDAO;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        StudentDAO dao = new StudentDAO();

        Student student =
                dao.login(email, password);

        if (student != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "student", student);

            response.sendRedirect(
                    "dashboard.jsp");

        } else {

            request.setAttribute(
                    "error",
                    "Invalid email or password.");

            request.getRequestDispatcher(
                    "login.jsp")
                    .forward(request, response);
        }
    }
}