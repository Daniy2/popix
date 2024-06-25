<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-sing.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Popix - #</title>    <!--add prod name-->
</head>
<body>

<%@include file="fragments/header.jsp"%>
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

<div class="product-container container mt-5">
    <div class="row">
        <div class="product-image col-md-6">
            <img src="#" alt="Product Image" class="img-fluid">
        </div>
        <div class="product-details col-md-6">
            <h1 class="product-name">Product Name</h1>
            <h2>Brand</h2>
            <p class="product-description">This is a great product that provides many excellent features and benefits. It's made from high-quality materials and offers great value for money.</p>
            <p class="product-price">$49.99</p>
            <div class="quantity-selector mt-3">
                <label for="quantity" class="form-label">Quantità:</label>
                <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control">
            </div>
            <button class="add-to-cart btn btn-warning">Aggiungi al carrello</button>
        </div>
    </div>
</div>
<%@include file="fragments/footer.jsp"%>
</body>
</html>
