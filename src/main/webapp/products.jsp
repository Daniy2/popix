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
        //System.out.println("Error: products attribute is not of type ArrayList<ProductBean>");
        e.printStackTrace();
    }

    if (productBeans == null) {
        //System.out.println("Products attribute is null, forwarding to getProductsServlet");
        request.getRequestDispatcher("/getProductsServlet").forward(request, response);
        return;
    }

    if (!productBeans.isEmpty()) {
        /*Iterator<ProductBean> iterator = productBeans.iterator();
        while (iterator.hasNext()) {
            ProductBean productBean = iterator.next();
            System.out.println("Product: " + productBean);
        }*/
    } else {
        System.out.println("No products found.");
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

    List<ProductBean> productsForCurrentPage = productBeans.subList(start, end);

%>


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
            <%
                for (ProductBean product : productsForCurrentPage) {
            %>
            <div class="box">
                <div class="image">
                    <img src="<%= request.getContextPath() %>/getPictureServlet?id=<%= product.getId()%>" alt="Product image">
                    <div class="icons">
                        <a href="#" class="cart-btn">Aggiungi al carrello</a>
                        <a href="#" class="fas fa-share"></a>
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
            <a class="page-link" href="?page=<%= currentPage - 1 %>">Precedente</a>
        </li>
        <%
            for (int i = 1; i <= totalPages; i++) {
        %>
        <li class="page-item <%= currentPage == i ? "active" : "" %>">
            <a class="page-link" href="?page=<%= i %>"><%= i %></a>
        </li>
        <%
            }
        %>
        <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
            <a class="page-link" href="?page=<%= currentPage + 1 %>">Successivo</a>
        </li>
    </ul>
</nav>
<%@include file="fragments/footer.jsp"%>


</body>
</html>
