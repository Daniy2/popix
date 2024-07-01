<%@ page import="model.ProductBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
<%
    ArrayList<ProductBean> productBeans = null;
    try {
        productBeans = (ArrayList<ProductBean>) request.getAttribute("products");
    } catch (ClassCastException e) {
        e.printStackTrace();
    }

    if (productBeans == null) {
        request.getRequestDispatcher("/getProductsServlet").forward(request, response);
        return;
    }

    int totalProducts = productBeans.size();
    int productsPerPage = 6;
    int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);
    int currentPage = 1;

    String pageParam = request.getParameter("page");
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            currentPage = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            currentPage = 1;
        }
    }

    int start = (currentPage - 1) * productsPerPage;
    int end = Math.min(start + productsPerPage, totalProducts);

// Assicura che start non sia superiore a totalProducts
    start = Math.max(start, 0);

// Assicura che end sia all'interno dei limiti della lista
    end = Math.min(end, totalProducts);

    List<ProductBean> productsForCurrentPage = productBeans.subList(start, end);
%>

<div class="container">
    <aside class="sidebar">
        <form action="${pageContext.request.contextPath}/getProductsServlet" method="GET">
            <select name="category" onchange="this.form.submit()">
                <option value="" selected>Brand</option>
                <option value="one piece" <%= "one piece".equals(request.getParameter("category")) ? "selected" : "" %>>One piece</option>
                <option value="dragon ball" <%= "dragon ball".equals(request.getParameter("category")) ? "selected" : "" %>>Dragon Ball</option>
                <option value="naruto" <%= "naruto".equals(request.getParameter("category")) ? "selected" : "" %>>Naruto</option>
                <option value="disney" <%= "disney".equals(request.getParameter("category")) ? "selected" : "" %>>Disney</option>
                <option value="pokemon" <%= "pokemon".equals(request.getParameter("category")) ? "selected" : "" %>>Pokemon</option>
                <option value="my hero academia" <%= "my hero academia".equals(request.getParameter("category")) ? "selected" : "" %>>My Hero Academia</option>
            </select>
            <select name="price" id="price-filter" onchange="this.form.submit()">
                <option value="" selected>Price</option>
                <option value="low"  <%= "low".equals(request.getParameter("price")) ? "selected" : "" %>>Dal più basso al più alto</option>
                <option value="high" <%= "high".equals(request.getParameter("price")) ? "selected" : "" %>>Dal più alto al più basso</option>
            </select>
        </form>
    </aside>

    <section class="products" id="products">
        <div class="box-container">
            <%
                for (ProductBean product : productsForCurrentPage) {
            %>
            <div class="box">
                <div class="image">
                    <img src="<%= request.getContextPath() %>/getPictureServlet?id=<%= product.getId()%>" alt="Product image">
                    <div class="icons">
                        <a href="${pageContext.request.contextPath}/addCartServlet?id=<%= product.getId()%>&qty=1" class="cart-btn">Aggiungi al carrello</a>
                        <a href="${pageContext.request.contextPath}/getSingleProductServlet?id=<%= product.getId()%>" class="fas fa-share"></a>
                    </div>
                </div>
                <div class="content">
                    <h3><%= product.getName() %></h3>
                    <h4><%= product.getBrand() %></h4>
                    <div class="price">€<%= product.getPrice() %></div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </section>
</div>

<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
            <a class="page-link" href="?page=<%= currentPage - 1 %>&category=<%= request.getParameter("category") %>&price=<%= request.getParameter("price") %>">Precedente</a>
        </li>
        <%
            for (int i = 1; i <= totalPages; i++) {
        %>
        <li class="page-item <%= currentPage == i ? "active" : "" %>">
            <a class="page-link" href="?page=<%= i %>&category=<%= request.getParameter("category") %>&price=<%= request.getParameter("price") %>"><%= i %></a>
        </li>
        <%
            }
        %>
        <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
            <a class="page-link" href="?page=<%= currentPage + 1 %>&category=<%= request.getParameter("category") %>&price=<%= request.getParameter("price") %>">Successivo</a>
        </li>
    </ul>
</nav>

<%@include file="fragments/footer.jsp"%>

</body>
</html>
