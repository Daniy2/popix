package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "addProductServlet", value = "/addProductServlet")
public class addProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String idProduct = request.getParameter("idProduct");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        //String price =request.getParameter("price").trim();
        double cost = Double.parseDouble(request.getParameter("price"));
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

        try{
            productDao.doSave(productBean);
            System.out.println(productBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }


    }
}