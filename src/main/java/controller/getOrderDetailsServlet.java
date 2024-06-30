package controller;

import model.OrderDetailsBean;
import model.OrderDetailsDao;
import model.Role;
import model.UserBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getOrderDetailsServlet", urlPatterns = "/getOrderDetailsServlet")
public class getOrderDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        if(session.getAttribute("user")==null){
            response.sendRedirect("login.jsp");
            return;
        }else{
            if(!userBean.getRole().equals(Role.user)){
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
        }

        OrderDetailsDao orderDetailsDao = new OrderDetailsDao();
        ArrayList<OrderDetailsBean> orderDetailsBeans = orderDetailsDao.retrieveOrderDetails(userBean.getEmail());
        request.setAttribute("orderDetails",orderDetailsBeans);
        request.getRequestDispatcher("/user/panoramic.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}