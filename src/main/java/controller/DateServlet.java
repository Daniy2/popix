package controller;

import model.OrderDao;
import model.Role;
import model.UserBean;
import model.OrderBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "DateServlet", urlPatterns = "/DateServlet")
public class DateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");

        // Verifica se l'utente è loggato
        if (userBean == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Verifica se l'utente è un admin
        if (!userBean.getRole().equals(Role.admin)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        OrderDao orderDao = new OrderDao();

        String from = request.getParameter("fromDate");
        String to = request.getParameter("toDate");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fromDate;
        Date toDate;
        try {
            fromDate = sdf.parse(from);
            toDate = sdf.parse(to);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        java.sql.Date sqlDateFrom = new java.sql.Date(fromDate.getTime());
        java.sql.Date sqlDateTo = new java.sql.Date(toDate.getTime());

        ArrayList<OrderBean> orders = orderDao.getOrdersSorted(sqlDateFrom, sqlDateTo);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/view.jsp").forward(request, response);


    }
}