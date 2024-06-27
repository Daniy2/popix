
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-view.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Storico ordini</title>
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
    <h1 class="text-center mt-5 mb-4"> Storico ordini</h1>

    <div class="row">
        <div class="col-md-3">
            <div class="sidebar">
                <h3>Filtra per Data</h3>
                <form action="#">
                    <div class="mb-3">
                        <label for="fromDate" class="form-label">Da</label>
                        <input type="date" class="form-control" id="fromDate" placeholder="Seleziona la data">
                    </div>
                    <div class="mb-3">
                        <label for="toDate" class="form-label">A</label>
                        <input type="date" class="form-control" id="toDate" placeholder="Seleziona la data">
                    </div>
                    <button type="submit" class="btn btn-primary">Filtra</button>
                </form>
            </div>
        </div>

        <div class="col-md-9">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Ordine</th>
                    <th>Utente</th>
                    <th>Nome Prodotto</th>
                    <th>Brand</th>
                    <th>Data</th>
                    <th>Prezzo</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>User 1</td>
                    <td>Product #1</td>
                    <td>Brand #1</td>
                    <td>Character #1</td>
                    <td>€0.00</td>
                    <td>#</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>User 2</td>
                    <td>Product #2</td>
                    <td>Brand #2</td>
                    <td>Character #2</td>
                    <td>€0.00</td>
                    <td>#</td>
                </tr>
                <!-- Add more rows as needed -->
                </tbody>
            </table>
        </div>
    </div>

</div>

<nav aria-label="Page navigation example" class="pagination-container">
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

<!-- <section class="footer">
     <div class="box-container">
         <div class="box">
             <h3>Quick links</h3>
             <a href="#">Home</a>
             <a href="#">About</a>
             <a href="#">Products</a>
         </div>
         <div class="box">
             <h3>Extra links</h3>
             <a href="#">My account</a>
             <a href="#">My order</a>
             <a href="#">Favourites</a>
         </div>
         <div class="box">
             <h3>Contact info</h3>
             <a href="mailto:g.bonagura4@studenti.unisa.it">g.bonagura4@studenti.unisa.it</a>
             <a href="mailto:d.scaparra@studenti.unisa.it">d.scaparra@studenti.unisa.it</a>
             <a href="#">Fisciano, SA 84084, IT</a>
         </div>
     </div>
     <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
         © 2024 Copyright: All rights reserved
     </div>
 </section>--->
<%@include file="../fragments/footer.jsp"%>
</body>
</html>
