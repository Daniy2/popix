package controller;

import model.ProductBean;
import model.ProductDao;
import model.Role;
import model.UserBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

@MultipartConfig
@WebServlet(name = "ModifyProductServlet", value = "/modifyServlet")
public class modifyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implementazione del doGet se necessario, ad esempio per visualizzare il form di modifica
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean userBean = (UserBean) session.getAttribute("user");

        // Verifica se l'utente è un admin
        if (!userBean.getRole().equals(Role.admin)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        request.setCharacterEncoding("UTF-8");

        // Recupero dei parametri dalla richiesta
        String idProduct = request.getParameter("idProduct");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qty"));
        String brand = request.getParameter("brand");
        String figure = request.getParameter("figure");

        // Gestione dell'immagine
        Part filePart = request.getPart("img_src");
        Blob image = null;

        if (filePart != null && filePart.getSize() > 0) {
            // Se è stato caricato un nuovo file immagine
            try (InputStream inputStream = filePart.getInputStream()) {
                byte[] bytes = inputStream.readAllBytes();
                image = new javax.sql.rowset.serial.SerialBlob(bytes);
            } catch (SQLException e) {
                throw new ServletException("Errore durante il recupero dell'immagine", e);
            }
        } else {
            // Se non è stato caricato un nuovo file immagine, mantieni l'immagine esistente
            ProductDao productDao = new ProductDao();
            ProductBean existingProduct = productDao.retrieveProduct(idProduct);
            if (existingProduct != null) {
                image = existingProduct.getImage();
            }
        }

        // Creazione del bean del prodotto con i dati aggiornati
        ProductBean productBean = new ProductBean(idProduct, name, price, description, brand, qty, image, figure);

        // Modifica del prodotto nel database
        ProductDao productDao = new ProductDao();
        try {
            productDao.ModifyProduct(productBean);
            response.sendRedirect(request.getContextPath() + "/admin/admin.jsp");
        } catch (Exception e) {
            throw new ServletException("Errore durante la modifica del prodotto", e);
        }
    }
}
