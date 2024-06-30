package controller;

import model.OrderBean;
import model.OrderDao;
import model.Role;
import model.UserBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getOrdersServlet", urlPatterns = "/getOrdersServlet")
public class getOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");

        // Verifica se l'utente è loggato
        if (userBean == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Verifica se l'utente è un admin
        System.out.println(userBean.getRole());
        if (!userBean.getRole().equals(Role.admin)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        // Carica gli ordini solo se l'utente è un admin

        OrderDao orderDao = new OrderDao();
        ArrayList<OrderBean> orderBeans = orderDao.getOrders();
        for(OrderBean orderBean : orderBeans){
            System.out.println(orderBean);
        }
        request.setAttribute("orders", orderBeans);
        request.getRequestDispatcher("/admin/view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}