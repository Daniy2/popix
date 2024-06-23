<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-fav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/footer-style.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Popix</title>
</head>
<body>

<!-- Header start -->
<%@include file="fragments/header.jsp"%>
<!-- Header end -->

<!-- Home start -->
<!-- Add home section content here -->
<!-- Home end -->

<!-- About start -->
<!-- Add about section content here -->
<!-- About end -->

<!-- Products start -->
<div class="container">
    <section class="products" id="products">
        <div class="box-container">
            <div class="box product1">
                <div class="image">
                    <img src="#" alt="Product image"> <!-- Replace with actual image source -->
                    <div class="icons">
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 1</h3>
                    <h4>Description</h4>
                    <div class="price">€13.5</div>
                </div>
            </div>
            <!-- Add more product boxes as needed -->
        </div>
    </section>
</div>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">Precedente</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">Successivo</a></li>
    </ul>
</nav>
<!-- Products end -->

<%@include file="fragments/footer.jsp"%>

</body>
</html>
