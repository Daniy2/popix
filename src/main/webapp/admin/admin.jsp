<%@ page import="model.ProductBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Role" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-admin.css">
    <script>var contextPath = '<%= request.getContextPath()%>'</script>
    <script src="../scripts/adminScript.js"></script>
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Popix - Admin</title>
</head>
<body>

<%@include file="/fragments/header.jsp" %>
<%

    if(userBean.getRole().equals(Role.user) ){
        response.sendError(HttpServletResponse.SC_FORBIDDEN);
        return;
    }
    ArrayList<ProductBean> productBeans = null;
    try {
        productBeans = (ArrayList<ProductBean>) request.getAttribute("products");
    } catch (ClassCastException e) {
        //System.out.println("Error: products attribute is not of type ArrayList<ProductBean>");
        e.printStackTrace();
    }

    if (productBeans == null) {
        //System.out.println("Products attribute is null, forwarding to getProductsServlet");
        request.getRequestDispatcher("/getAdminServlet").forward(request, response);
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

<div class="container">
    <h1>Dashboard</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nome Prodotto</th>
            <th>Prezzo</th>
            <th>Quantità</th>
            <th>Azioni</th>
        </tr>
        </thead>
        <tbody>
        <!-- Esempio di riga prodotto -->
        <%
            for (ProductBean product : productsForCurrentPage) {
        %>
        <tr>
            <td><%=product.getId()%></td>
            <td><%=product.getName()%></td>
            <td><%=product.getPrice()%></td>
            <td><%=product.getQuantity()%></td>
            <td><button onclick="modificaProdotto(1)">Modifica</button>  <!--method name-->
                <button onclick="eliminaProdotto(1)">Elimina</button></td>
        </tr>

        <%
            }
        %>
        <!-- Aggiungere altre righe prodotti se necessario -->
        </tbody>
    </table>
</div>

<button class="btn-add-product" id="addProdBtn">Aggiungi Prodotto</button>
<button class="btn-add-product" id="viewOrdersBtn">Visualizza ordini</button>

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
<%@include file="/fragments/footer.jsp" %>

</body>
</html>
