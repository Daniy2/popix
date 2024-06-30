package controller;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "infosServlet", urlPatterns = "/infosServlet")
public class infosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        String email = userBean.getEmail();

        PersonalInfoDao personalInfoDao = new PersonalInfoDao();
        PersonalInfoBean personalInfoBean = personalInfoDao.getPersonalInfo(email);

        ShippingInfoDao shippingInfoDao = new ShippingInfoDao();
        ShippingInfoBean shippingInfoBean = shippingInfoDao.retrieveShippingInfo(email);

        request.setAttribute("personalInfo", personalInfoBean);
        request.setAttribute("shippingInfo", shippingInfoBean);

        RequestDispatcher dispatcher = request.getRequestDispatcher("personalArea.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        String email = userBean.getEmail();

        // Retrieve and save personal information
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        Date birthday = Date.valueOf(request.getParameter("birthday"));
        String cell = request.getParameter("cellphone");

        PersonalInfoDao personalInfoDao = new PersonalInfoDao();
        PersonalInfoBean personalInfoBean = new PersonalInfoBean(name, surname, cell, birthday, email);
        personalInfoDao.doSave(personalInfoBean, email);

        // Retrieve and save shipping information
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String address = request.getParameter("address");

        ShippingInfoDao shippingInfoDao = new ShippingInfoDao();
        ShippingInfoBean shippingInfoBean = new ShippingInfoBean(email, country, address, city);
        shippingInfoDao.doSave(shippingInfoBean, email);

        response.sendRedirect("infosServlet");
    }
}
