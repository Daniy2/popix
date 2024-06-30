package controller;

import model.ProductBean;
import model.ProductDao;
import model.Role;
import model.UserBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteServlet", urlPatterns = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");
        if(!userBean.getRole().equals(Role.admin)){
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        }

        String id = request.getParameter("Del");
        ProductDao productDao = new ProductDao();
        productDao.DeleteProduct(id);
        response.sendRedirect("admin/admin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}