<%@ page import="java.util.ArrayList" %>
<%@ page import="model.OrderBean" %>
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

<div class="container">
    <h1 class="text-center mt-5 mb-4">Storico ordini</h1>

    <!-- Link per tornare alla pagina precedente (esempio) -->
    <div class="text-center mb-3">
        <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-secondary">Torna Indietro</a>
    </div>

    <div class="row">
        <div class="col-md-3">
            <!-- Sidebar di Filtraggio (può essere mantenuto come è) -->
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
            <!-- Tabella per visualizzare gli ordini -->
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Ordine</th>
                    <th>Utente</th>
                    <th>Data</th>
                    <th>Prezzo</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <!-- Iterazione attraverso la lista di ordini utilizzando JSP -->
                <%
                    ArrayList<OrderBean> orderBeans = (ArrayList<OrderBean>) request.getAttribute("orders");
                    if (orderBeans != null) {
                        for (OrderBean order : orderBeans) {
                            System.out.println(order);
                %>
                <tr>
                    <td><%= order.getIdOrd() %></td>
                    <td><%= order.getCustomer() %></td>
                    <td><%= order.getOrderDate() %></td>
                    <td><%= order.getSubtotal() %></td>
                    <td><%= order.getStatus() %></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@include file="../fragments/footer.jsp"%>
</body>
</html>
