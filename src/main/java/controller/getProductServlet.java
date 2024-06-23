package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "getProductServlet", urlPatterns = "/getProductServlet")
public class getProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String suffix = request.getParameter("suffix");
        if (id == null) {
            System.out.println("id is null");
            getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
        }

        if (suffix == null) suffix = "";

        ProductDao productDao = new ProductDao();
        ProductBean productBean = productDao.retrieveProduct(id);
        request.setAttribute("product"+suffix, productBean);
        getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}