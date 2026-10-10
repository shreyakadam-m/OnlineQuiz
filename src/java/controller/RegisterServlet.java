package controller;

import dao.StudentDAO;
import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Student student = new Student();

            student.setName(
                    request.getParameter("name"));

            student.setEmail(
                    request.getParameter("email"));

            student.setPassword(
                    request.getParameter("password"));

            new StudentDAO().save(student);

            response.sendRedirect(
                    "login.jsp");

        } catch (Exception e) {

            request.setAttribute(
                    "error",
                    "Registration failed. Email may already exist.");

            request.getRequestDispatcher(
                    "register.jsp")
                    .forward(request, response);
        }
    }
}