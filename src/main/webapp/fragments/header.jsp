<%@ page import="model.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style-head.css">
</head>
<body>
<header>
    <%
        UserBean userBean = (UserBean) request.getSession().getAttribute("user");
        boolean isLoggedIn = userBean != null;

    %>
    <img src="${pageContext.request.contextPath}/images/logo-noborderico.png" alt="Logo" class="header-photo">
    <input type="checkbox" id="toggler">
    <label for="toggler" class="fas fa-bars"></label>
    <a href="#" class="logo">Pop<span>!</span>x</a>
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/home.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/products.jsp">Prodotti</a>
        <a href="#">Saldi</a>
    </nav>
    <div class="icons">
        <a href="#" class="fas fa-shopping-cart"></a>
        <% if (isLoggedIn) { %>
        <a href="#" class="fas fa-user"> <span><%= userBean.getUsername() %></span></a>
        <a href="${pageContext.request.contextPath}/logout?l-out=yes" class="fas fa-sign-out-alt"></a>
        <% } else { %>
        <a href="${pageContext.request.contextPath}/login.jsp" class="fas fa-sign-in-alt"></a>
        <% } %>
    </div>
</header>

</body>
</html>
