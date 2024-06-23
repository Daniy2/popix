<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-prods.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Popix</title>
</head>
<body>

<!-- Header start -->
<%@include file="fragments/header.jsp"%>
<!-- Header end -->


<!-- Home start -->
<!-- Home end -->

<!-- About start -->

<!-- About end -->

<!-- Products start -->
<div class="container">
    <aside class="sidebar">
        <form action="#">
            <input type="text" placeholder="Search for products" required>
            <select name="category">
                <option value="">Brand</option>
                <option value="onepiece">One piece</option>
                <option value="dragonball">Dragon Ball</option>
                <option value="naruto">Naruto</option>
                <option value="disney">Disney</option>
                <option value="pokemon">Pokemon</option>
                <option value="myheroacademia">My Hero Academia</option>
            </select>
            <select name="price" id="price-filter">
                <option value="">Price</option>
                <option value="low">Dal più basso al più alto</option>
                <option value="high">Dal più alto al più basso</option>
                <option value="personalizzato">Personalizzato</option>
            </select>
            <div id="custom-price-range" style="display: none;">
                <label for="price-range">Select price range:</label>
                <input type="range" class="form-range" id="price-range" min="0" max="100" step="1" value="50">
                <output id="range-value">50</output>
            </div>
            <button type="submit">Cerca</button>
        </form>
    </aside>

    <section class="products" id="products">
        <div class="box-container">
            <div class="box product1">
                <div class="image">
                    <img src="#" alt="Product image">
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 1</h3>
                    <h4>description</h4>
                    <div class="price">€13.5</div>
                </div>
            </div>
            <div class="box product2">
                <div class="image">
                    <img src="#" alt="Product image">
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 2</h3>
                    <h4>description</h4>
                    <div class="price">€15</div>
                </div>
            </div>
            <div class="box product3">
                <div class="image">
                    <img src="#" alt="Product image">
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 3</h3>
                    <h4>description</h4>
                    <div class="price">€13.99</div>
                </div>
            </div>

            <div class="box product4">
                <div class="image">
                    <img src="#" alt="Product image">
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 4</h3>
                    <h4>description</h4>
                    <div class="price">€13.99</div>
                </div>
            </div>

            <div class="box product5">
                <div class="image">
                    <img src="#" alt="Product image">
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 5</h3>
                    <h4>description</h4>
                    <div class="price">€13.99</div>
                </div>
            </div>

            <div class="box product6">
                <div class="image">
                    <img src="#" alt="Product image">
                    <div class="icons">
                        <a href="#" class="fas fa-heart"></a>
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3>Product 6</h3>
                    <h4>description</h4>
                    <div class="price">€13.99</div>
                </div>
            </div>
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
<%@include file="fragments/footer.jsp"%>


</body>
</html>
