<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Visualizza Immagine Prodotto</title>
</head>
<body>
<h1>Visualizza Immagine Prodotto</h1>
<br>
<%-- L'immagine viene visualizzata qui --%>
<%
    // Supponendo che l'ID del prodotto sia ottenuto da qualche parte
    String productId = "DRA01"; // Sostituisci con l'ID del prodotto dinamicamente ottenuto
%>
<img src="${pageContext.request.contextPath}/showProductServlet?id=<%= productId %>" alt="Immagine Prodotto" width="200" height="200">
</body>
</html>