package controller;

import model.Role;
import model.UserBean;
import model.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "loginServlet", urlPatterns = "/signIn")
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        UserBean userBean = userDao.retrieveUser(username, password);


        if (userBean == null) {
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("Nome utente o password sbagliata.");
        } else {
            // Creazione della sessione
            HttpSession session = request.getSession();
            session.setAttribute("user", userBean);
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");

            if (userBean.getRole().equals(Role.user)) {
                response.getWriter().write("user");
            } else if (userBean.getRole().equals(Role.admin)) {
                response.getWriter().write("admin");
            }
        }
    }
}