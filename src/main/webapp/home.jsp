<%@ page import="model.ProductBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-home.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Popix</title>
</head>
<body>

<!-- Header start -->
<%@include file="fragments/header.jsp"%>
<!-- Header end -->

<!-- Home start -->
<section class="home" id="home">
    <div class="content">
        <h3>Pop!X</h3>
        <span>Scopri tutte le esclusive</span>
        <p>Potrai trovare tutti i personaggi collezionabili<br>più amati del momento a prezzi incredibili!<br>Innamorati del tuo prossimo regalo!
        </p>
        <a href="#" class="btn">Shop now</a>
    </div>
</section>
<!-- Home end -->

<!-- About start -->
<section class="about" id="about">
    <h1 class="heading"><span>About</span> us</h1>
    <div class="row">
        <div class="photo-container">
            <img src="${pageContext.request.contextPath}/images/us.png" alt="Image description">
            <div class="text-overlay">
            </div>
        </div>
        <div class="content">
            <h3>Perchè sceglierci?</h3>
            <p>Ci impegniamo a fornire solo Funko Pop originali e di alta qualità,
                garantendo che ogni collezione sia autentica e ben conservata.
                La soddisfazione dei clienti è al centro di tutto ciò che facciamo. Siamo qui per assisterti in ogni fase, dall'acquisto alla consegna, per garantire
                un'esperienza di shopping serena.
                Scegli il nostro negozio per la tua prossima aggiunta alla tua collezione Funko Pop e scopri
                perché siamo la destinazione preferita per gli appassionati di tutto il mondo.</p>
        </div>

    </div>
</section>
<!-- About end -->

<!-- Products start -->
<section class="products" id="products">
    <h1 class="heading">Ultimi<span> arrivi</span></h1>
    <div class="box-container">
        <!-- Product 1 -->
        <div class="box product1">
            <span class="discount">-10%</span>
            <div class="image">
                <%
                    ProductBean productBean1 = (ProductBean) request.getAttribute("product1");
                    if (productBean1 == null) {
                        request.getRequestDispatcher("/getProductServlet?id=956&suffix=1").include(request, response);
                        productBean1 = (ProductBean) request.getAttribute("product1");
                    }
                %>
                <img src="<%= request.getContextPath() %>/getPictureServlet?id=956" alt="Product Image">
                <div class="icons">
                    <a href="#" class="fas fa-heart"></a>
                    <a href="#" class="cart-btn">Aggiungi al carrello</a>
                    <a href="#" class="fas fa-share"></a>
                </div>
            </div>
            <div class="content">
                <h3><%= productBean1.getName() %></h3>
                <h4><%= productBean1.getBrand() %></h4>
                <div class="price"><%= productBean1.getPrice() %> <span>€14.5</span></div>
            </div>
        </div>

        <!-- Product 2 -->
        <div class="box product2">
            <div class="image">
                <%
                    ProductBean productBean2 = (ProductBean) request.getAttribute("product2");
                    if (productBean2 == null) {
                        request.getRequestDispatcher("/getProductServlet?id=98&suffix=2").include(request, response);
                        productBean2 = (ProductBean) request.getAttribute("product2");
                    }
                %>
                <img src="<%= request.getContextPath() %>/getPictureServlet?id=98" alt="Product Image">
                <div class="icons">
                    <a href="#" class="fas fa-heart"></a>
                    <a href="#" class="cart-btn">Aggiungi al carrello</a>
                    <a href="#" class="fas fa-share"></a>
                </div>
            </div>
            <div class="content">
                <h3><%= productBean2.getName() %></h3>
                <h4><%= productBean2.getBrand() %></h4>
                <div class="price"><%= productBean2.getPrice() %></div>
            </div>
        </div>

        <!-- Product 3 -->
        <div class="box product3">
            <div class="image">
                <%
                    ProductBean productBean3 = (ProductBean) request.getAttribute("product3");
                    if (productBean3 == null) {
                        request.getRequestDispatcher("/getProductServlet?id=10&suffix=3").include(request, response);
                        productBean3 = (ProductBean) request.getAttribute("product3");
                    }
                %>
                <img src="<%= request.getContextPath() %>/getPictureServlet?id=10" alt="Product Image">
                <div class="icons">
                    <a href="#" class="fas fa-heart"></a>
                    <a href="#" class="cart-btn">Aggiungi al carrello</a>
                    <a href="#" class="fas fa-share"></a>
                </div>
            </div>
            <div class="content">
                <h3><%= productBean3.getName() %></h3>
                <h4><%= productBean3.getBrand() %></h4>
                <div class="price"><%= productBean3.getPrice() %></div>
            </div>
        </div>
    </div>
</section>
<!-- Products end -->

<%@include file="fragments/footer.jsp"%>

</body>
</html>
