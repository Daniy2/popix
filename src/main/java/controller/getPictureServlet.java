package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

@WebServlet(name = "getPictureServlet", urlPatterns = "/getPictureServlet")
public class getPictureServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ProductDao productDao = new ProductDao();
        ProductBean productBean = productDao.retrieveProduct(id);
        if(id!=null && productBean != null){
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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}