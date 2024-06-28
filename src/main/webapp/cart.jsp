<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ProductBean" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-cart.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Carrello</title>
</head>
<body>

<%@include file="fragments/header.jsp"%>

<main>
    <div class="container">
        <section class="cart">
            <h2>Il tuo carrello</h2>
            <div class="cart-items">
                <%
                    List<ProductBean> cart = (List<ProductBean>) session.getAttribute("cart");
                    if (cart != null && !cart.isEmpty()) {
                        for (ProductBean product : cart) {
                %>
                <div class="cart-item">
                    <img src="<%= request.getContextPath() %>/getPictureServlet?id=<%= product.getId()%>" alt="Product image">
                    <div class="item-details">
                        <h3><%= product.getName() %></h3>
                        <p>ID <%= product.getId() %></p>
                        <p>Prezzo: $<%= product.getPrice() %></p>
                        <div class="quantity">
                            <span><%= product.getQuantity()%></span>
                        </div>
                    </div>
                    <button class="remove-item"><i class="fas fa-trash-alt"></i></button>
                </div>
                <%
                    }
                } else {
                %>
                <p>Il tuo carrello è vuoto.</p>
                <%
                    }
                %>
            </div>
            <div class="cart-summary">
                <h3>Riepilogo</h3>
                <div class="summary-details">

                    <%
                        double sum = 0;
                        String formattedSum = "0.00";
                        if(cart != null) {
                            for (ProductBean product : cart) {
                                sum += product.getPrice()*product.getQuantity();
                            }
                            formattedSum = String.format("%.2f", sum);
                        }

                    %>
                    <p>Totale: <%=formattedSum%></p>
                </div>
                <button class="checkout-btn">CHECKOUT</button>
            </div>
        </section>
    </div>
</main>

<%@include file="fragments/footer.jsp"%>

</body>
</html>
