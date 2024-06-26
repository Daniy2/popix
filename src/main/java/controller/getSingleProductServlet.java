package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "getSingleProductServlet", urlPatterns = "/getSingleProductServlet")
public class getSingleProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is missing");
            return;
        }

        ProductDao productDao = new ProductDao();
        ProductBean productBean = productDao.retrieveProduct(id);
        if(productBean == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
        } else {
            request.setAttribute("prod", productBean); // Set the attribute correctly
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/product.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
