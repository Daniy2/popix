<%@ page import="model.ProductDao" %>
<%@ page import="model.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles-mod.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Admin - Modifica Prodotto</title>
</head>
<body>

<%@include file="../fragments/header.jsp"%>

<%
    ProductDao productDao = new ProductDao();
    String idProduct = request.getParameter("idP");
    ProductBean productBean = productDao.retrieveProduct(idProduct);
    if (productBean == null) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Prodotto non trovato");
        return;
    }
%>

<div class="container">
    <h2>Modifica prodotto</h2>
    <form class="form-horizontal" enctype="multipart/form-data" accept-charset="UTF-8" method="post" action="${pageContext.request.contextPath}/modifyServlet">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Nome</label>
                <input type="text" id="name" name="name" value="<%= productBean.getName()%>" class="form-control" required>
            </div>
            <div class="form-group col-md-6">
                <label for="idProduct">ID</label>
                <input type="text" id="idProduct" name="idProduct" value="<%= productBean.getId()%>" class="form-control" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="price">Prezzo</label>
                <input type="number" id="price" name="price" value="<%= productBean.getPrice()%>" step="0.01" class="form-control" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="brand">Brand</label>
                <input type="text" id="brand" name="brand" value="<%= productBean.getBrand()%>" class="form-control" required>
            </div>
            <div class="form-group col-md-6">
                <label for="figure">Personaggio</label>
                <input type="text" id="figure" name="figure" value="<%= productBean.getFigure()%>" class="form-control" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="qty">Quantità</label>
                <input type="number" id="qty" name="qty" value="<%= productBean.getQuantity()%>" class="form-control" required>
            </div>
            <div class="form-group col-md-6">
                <label for="img_src">Immagine</label>
                <img src="<%= request.getContextPath() %>/getPictureServlet?id=<%= productBean.getId() %>" alt="Product image" class="img-fluid mb-2">
                <input type="file" id="img_src" name="img_src" accept="image/*" class="form-control">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-12">
                <label for="description">Descrizione</label>
                <textarea id="description" name="description" rows="4" class="form-control" required><%= productBean.getDescription()%></textarea>
            </div>
        </div>
        <div class="form-row mt-3">
            <button type="submit" class="btn btn-primary">Aggiorna</button>
        </div>
    </form>
</div>

<%@include file="../fragments/footer.jsp"%>

</body>
</html>
