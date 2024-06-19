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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("mail");


        UserBean userBean = new UserBean(username,password,email,Role.admin);
        UserDao userDao = new UserDao();

       try{
           userDao.doSave(userBean);
       }catch (Exception e){
          throw new RuntimeException(e);
       }


    }
}