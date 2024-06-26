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
<main>
    <section class="product-container">
        <div class="product-image">
            <img src="#" alt="Product Image">
        </div>
        <div class="product-details">
            <h1 class="product-name">Product Name</h1>
            <h2 class="product-brand">Brand Name</h2>
            <p class="product-price">$99.99</p>
            <div class="quantity-selector">
                <label for="quantity" class="form-label">Quantity:</label>
                <input type="number" id="quantity" class="form-control" value="1" min="1">
            </div>
            <button class="add-to-cart">Add to Cart</button>
        </div>
    </section>
</main>
<%@include file="fragments/footer2.jsp"%>
</body>
</html>