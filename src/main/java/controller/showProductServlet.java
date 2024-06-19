package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;

@WebServlet(name = "showProductServlet", urlPatterns = "/showProductServlet")
public class showProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("id = "+id);

        if (id == null || id.isEmpty()) {
            System.out.println("ooooooooooooo");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is missing");
            return;
        }

        ProductDao productDao = new ProductDao();
        ProductBean productBean = productDao.retrieveProduct(id);

        System.out.println("Product retrieved: "+productBean);

        if(productBean!=null && productBean.getImage()!=null){
            Blob img_blob = productBean.getImage();
            try{
                response.setContentType("image/png");
                byte[] imageBytes = img_blob.getBytes(1,(int) img_blob.length());
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(imageBytes);
                outputStream.flush();
                outputStream.close();

            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            // Gestione caso in cui il prodotto o l'immagine non siano disponibili
            response.setContentType("text/html");
            response.getWriter().println("<html><body><h1>Product or Image not found</h1></body></html>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}