<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 23/06/2024
  Time: 00:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style-head.css">
</head>
<body>
<header>
    <img src="${pageContext.request.contextPath}/images/logo-noborderico.png" alt="Logo" class="header-photo">
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
</header>

</body>
</html>
