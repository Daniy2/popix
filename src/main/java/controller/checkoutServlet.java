package controller;

import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

@WebServlet(name = "checkoutServlet", urlPatterns = "/checkoutServlet")
public class checkoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(request.getSession().getAttribute("user") != null) {
            UserBean userBean = (UserBean) request.getSession().getAttribute("user");
            if(request.getSession().getAttribute("cart") != null) {
                ArrayList<ProductBean> cartList = (ArrayList<ProductBean>) request.getSession().getAttribute("cart");
                for(ProductBean productBean : cartList) {
                    System.out.println("Stampa dei beans :"+productBean);
                }
                OrderBean orderBean = new OrderBean();
                orderBean.setCustomer(userBean.getEmail());
                orderBean.setStatus("IN_PROGRESS");
                // Retrieve current date
                orderBean.setOrderDate(new Date(System.currentTimeMillis()));

                // Get the subtotal from the request parameter and convert it to Double
                String sumString = request.getParameter("sum");
                if (sumString != null) {
                    // Replace comma with dot
                    sumString = sumString.replace(",", ".");
                    try {
                        double subtotal = Double.parseDouble(sumString);
                        orderBean.setSubtotal(subtotal);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        // Handle the error, e.g., set a default value or redirect to an error page
                        response.sendRedirect("error.jsp");
                        return;
                    }
                }

                OrderDao orderDao = new OrderDao();
                orderDao.doSave(orderBean);

                int orderId = orderDao.getOrderId();
                OrderDetailsDao orderDetailsDao = new OrderDetailsDao();
                OrderDetailsBean orderDetailsBean = new OrderDetailsBean();

                ProductDao productDao = new ProductDao();

                for (ProductBean productBean : cartList) {


                    orderDetailsBean.setOrderId(orderId);
                    orderDetailsBean.setProductBean(productBean);
                    orderDetailsBean.setPrice(productBean.getPrice());
                    System.out.println("checkout"+orderDetailsBean.getPrice());
                    orderDetailsBean.setQuantity(productBean.getQuantity());
                    orderDetailsDao.updateOrderDetails(orderDetailsBean);
                    productDao.ShoppedItem(productBean.getId(), productBean.getQuantity());

                    System.out.println("ookokoko");
                }

                session.removeAttribute("cart");

                response.sendRedirect("home.jsp");


            } else {
                // Cart is empty
                response.sendRedirect("cart.jsp");
            }
        } else {
            request.setAttribute("login_required",true);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request if needed
    }
}
