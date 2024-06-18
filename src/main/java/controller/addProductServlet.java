package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
@MultipartConfig
@WebServlet(name = "addProductServlet", value = "/addProductServlet")
public class addProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


//        System.out.println(request.getParameter("idProduct")+
//                request.getParameter("name")+
//                request.getParameter("description")+
//                request.getParameter("price")+
//                request.getParameter("qty")+
//                request.getParameter("brand")+
//                request.getParameter("figure")+
//                request.getParameter("image_src"));


        String idProduct = request.getParameter("idProduct");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        //String price =request.getParameter("price").trim();
        double cost = Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        InputStream image=null;
        for(Part part : request.getParts()){
            String file = part.getSubmittedFileName();
            if(file!=null && !file.isEmpty()){
                image = part.getInputStream();
            }

        }
        String brand = request.getParameter("brand");
        String figure = request.getParameter("figure");

        ProductBean productBean = new ProductBean(idProduct,name,cost,description,brand,qty,image,figure);
        ProductDao productDao = new ProductDao();

        try{
            productDao.doSave(productBean);
            System.out.println(productBean);
        }catch (Exception e){
            throw new RuntimeException(e);
        }


    }
}