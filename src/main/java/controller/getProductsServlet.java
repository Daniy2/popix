package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getProductsServlet", urlPatterns = "/getProductsServlet")
public class getProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        ArrayList<ProductBean> products = null;

        // Retrieve filter parameters
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        //String customPrice = request.getParameter("customPrice");

        // Determine the list of products to retrieve based on filters
        if(category != null && !category.isEmpty()) {
            products = productDao.retrieveAllProductsByBrand(category);

        }else if(price != null) {
            if(price.equals("low")) {
                products = productDao.retrieveAllProductsByPrice();
            }else if(price.equals("high")) {
                products = productDao.retrieveAllProductsByPriceDec();
            }
        }else {
            products = productDao.retrieveAllProducts();
        }


        request.setAttribute("products", products);
        getServletContext().getRequestDispatcher("/products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests if needed
    }
}
