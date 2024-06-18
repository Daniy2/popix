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

        ProductDao productDao = new ProductDao();
        ProductBean productBean = productDao.retrieveProduct(id);

        if(productBean!=null && productBean.getImage()!=null){
            Blob img_blob = productBean.getImage();
            try{
                response.setContentType("image/jpeg");
                byte[] imageBytes = img_blob.getBytes(1,(int) img_blob.length());
                ServletOutputStream outputStream = response.getOutputStream();
                outputStream.write(imageBytes);
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