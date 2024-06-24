package controller;

import model.Role;
import model.UserBean;
import model.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "registrationServlet", urlPatterns = "/signUp")
public class registrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Non utilizzato per la registrazione, ma necessario per la servlet
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method not supported.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("mail");

        UserDao userDao = new UserDao();

        if (userDao.retrieveEmail(email)) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Email già registrata.");
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserBean userBean = new UserBean(username, password, email, Role.user);
            try {
                userDao.doSave(userBean);
                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("Registrazione completata.");
            } catch (Exception e) {
                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("Errore durante la registrazione.");
                e.printStackTrace();
            }
        }
    }
}
