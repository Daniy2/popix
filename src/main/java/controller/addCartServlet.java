package controller;

import model.ProductBean;
import model.ProductDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "addCartServlet", value = "/addCartServlet")
public class addCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        int qty = Integer.parseInt(request.getParameter("qty")); // Ottieni la quantità specificata dall'utente
        ProductDao productDao = new ProductDao();
        ProductBean productBean = productDao.retrieveProduct(id);
        System.out.println("sono in add cart servlet "+productBean.getPrice());
        ArrayList<ProductBean> beans = (ArrayList<ProductBean>) session.getAttribute("cart");
        if (beans == null) {
            beans = new ArrayList<>();
            session.setAttribute("cart", beans);
        }

        // Controlla se il prodotto è già presente nel carrello
        boolean productAlreadyInCart = false;
        for (ProductBean bean : beans) {
            if (bean.getId().equals(productBean.getId())) {
                // Se il prodotto è già nel carrello, aggiorna la quantità
                int newQuantity = bean.getQuantity() + qty;
                if (newQuantity <= productBean.getQuantity()) {
                    bean.setQuantity(newQuantity);
                } else {
                    // Gestisci il caso in cui la quantità nel carrello supera la disponibilità in magazzino
                    // Qui potresti mostrare un messaggio all'utente o limitare la quantità aggiungibile
                    // Per esempio, potresti limitare la quantità nel carrello alla disponibilità in magazzino
                    bean.setQuantity(productBean.getQuantity());
                }
                productAlreadyInCart = true;
                break;
            }
        }

        // Se il prodotto non è nel carrello, aggiungilo con la quantità specificata
        if (!productAlreadyInCart) {
            if (qty > 0 && qty <= productBean.getQuantity()) { // Assicurati che la quantità sia valida
                productBean.setQuantity(qty); // Imposta la quantità specificata dall'utente
                beans.add(productBean);
            } else {
                // Gestisci il caso in cui la quantità specificata non sia valida
                // Puoi mostrare un messaggio all'utente o fare altre operazioni necessarie
            }
        }

        session.setAttribute("cart", beans);

        // Ottieni l'URL della pagina corrente
        String referer = request.getHeader("referer");

        // Reindirizza l'utente alla pagina corrente
        response.sendRedirect(referer);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

}