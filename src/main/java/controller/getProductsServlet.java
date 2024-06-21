package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

@WebServlet(name = "getProductsServlet", urlPatterns = "/getProductsServlet")
public class getProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProductDao productDao = new ProductDao();
        System.out.println("we");
        ArrayList<ProductBean> products = productDao.retrieveAllProducts();
        System.out.println("la size è : "+products.size());
        request.setAttribute("products", products);
        getServletContext().getRequestDispatcher("/admin/showProducts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}