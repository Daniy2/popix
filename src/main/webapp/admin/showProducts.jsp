<%@ page import="java.util.ArrayList" %>
<%@ page import="model.ProductBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Visualizza Immagine Prodotto</title>
</head>
<body>
<h1>Visualizza Immagine Prodotto</h1>
<br>
<%-- L'immagine viene visualizzata qui --%>
<%
    ArrayList<ProductBean> productBeans = null;
    try {
        productBeans = (ArrayList<ProductBean>) request.getAttribute("products");
    } catch (ClassCastException e) {
        System.out.println("Error: products attribute is not of type ArrayList<ProductBean>");
        e.printStackTrace();
    }

    if (productBeans == null) {
        System.out.println("Products attribute is null, forwarding to getProductsServlet");
        request.getRequestDispatcher("/getProductsServlet").forward(request, response);
        return;
    }

    if (!productBeans.isEmpty()) {
        Iterator<ProductBean> iterator = productBeans.iterator();
        while (iterator.hasNext()) {
            ProductBean productBean = iterator.next();
            System.out.println("Product: " + productBean);
        }
    } else {
        System.out.println("No products found.");
    }
%>
<%-- <img src="<%= request.getContextPath() %>/showProductServlet?id=<%= productId %>" alt="Immagine Prodotto" width="200" height="200"> --%>
<%
    if(!productBeans.isEmpty()){
        Iterator<ProductBean> iterator = productBeans.iterator();
        while (iterator.hasNext()) {
            ProductBean productBean = iterator.next();
            %>
<%=productBean.getName()%>
<img src="<%= request.getContextPath() %>/getPictureServlet?id=<%= productBean.getId() %>" alt="Immagine Prodotto" width="200" height="200">
<%=productBean.getFigure()%>
<%=productBean.getBrand()%>
<%
        }
    }
%>
</body>
</html>
