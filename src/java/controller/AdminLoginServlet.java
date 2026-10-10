package controller;

import dao.AdminDAO;
import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        AdminDAO dao = new AdminDAO();

        Admin admin =
                dao.login(username, password);

        if (admin != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "admin", admin);

            response.sendRedirect(
                    "adminDashboard.jsp");

        } else {

            request.setAttribute(
                    "error",
                    "Invalid admin username or password.");

            request.getRequestDispatcher(
                    "adminLogin.jsp")
                    .forward(request, response);
        }
    }
}