package controller;

import model.ProductBean;
import model.ProductDao;
import model.Role;
import model.UserBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

@WebServlet(name = "modifyServlet", urlPatterns = "/modifyServlet")
public class modifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        if(!userBean.getRole().equals(Role.admin)){
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        }
        request.setCharacterEncoding("UTF-8");
        String idProduct = request.getParameter("idProduct");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        //String price =request.getParameter("price").trim();
        String priceParameter = request.getParameter("price");
        double cost = 0.0; // O un valore predefinito appropriato
        if (priceParameter != null && !priceParameter.isEmpty()) {
            try {
                cost = Double.parseDouble(priceParameter);
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid price format", e);
            }
        } else {
            throw new ServletException("Price parameter is missing");
        }

        int qty = Integer.parseInt(request.getParameter("qty"));
        Blob image = null;
        try {
            for (Part part : request.getParts()) {
                String file = part.getSubmittedFileName();
                if (file != null && !file.isEmpty()) {
                    // Read the input stream and convert it to a Blob
                    byte[] bytes = part.getInputStream().readAllBytes();
                    image = new javax.sql.rowset.serial.SerialBlob(bytes);
                    break; // Assuming only one image file needs to be processed
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Error processing image file", e);
        }
        String brand = request.getParameter("brand");
        String figure = request.getParameter("figure");

        ProductBean productBean = new ProductBean(idProduct,name,cost,description,brand,qty, image,figure);
        ProductDao productDao = new ProductDao();
        System.out.println(productBean);


        try{
            productDao.ModifyProduct(productBean);
            System.out.println(productBean);
            response.sendRedirect("../admin/admin.jsp");
        }catch (Exception e){
            throw new RuntimeException(e);
        }

    }
}