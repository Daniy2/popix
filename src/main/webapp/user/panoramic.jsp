<%@ page import="model.OrderDetailsBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-pan.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Panoramica</title>
</head>

<body>
<%@include file="../fragments/header.jsp"%>
<!--
<header>
    <img src="/images/logo-noborderico.png" alt="Logo" class="header-photo">
    <input type="checkbox" id="toggler">
    <label for="toggler" class="fas fa-bars"></label>
    <a href="#" class="logo">Pop<span>!</span>x</a>
    <nav class="navbar">
        <a href="#">Home</a>
        <a href="#">Prodotti</a>
        <a href="#">Saldi</a>
    </nav>
    <div class="icons">
        <a href="#" class="fas fa-heart"></a>
        <a href="#" class="fas fa-shopping-cart"></a>
        <a href="#" class="fas fa-user"></a>
    </div>
</header>-->

<div class="container">
    <h1 class="text-center mt-5 mb-4">Panoramica ordini</h1>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Ordine</th>
            <th>Nome Prodotto</th>
            <th>Brand</th>
            <th>Prezzo</th>
            <th>Pezzi</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<OrderDetailsBean> orderBeans = (ArrayList<OrderDetailsBean>) request.getAttribute("orderDetails");
            if (orderBeans != null) {
                for (OrderDetailsBean order : orderBeans) {
        %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getProductBean().getName() %></td>
            <td><%= order.getProductBean().getBrand() %></td>
            <td><%= order.getPrice() %></td>
            <td><%= order.getQuantity() %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>


<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#">Precedente</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">Successivo</a></li>
    </ul>
</nav>
<%@include file="../fragments/footer.jsp"%>

</body>
</html>
