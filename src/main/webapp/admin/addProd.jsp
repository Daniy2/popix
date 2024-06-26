<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles-add.css">
<script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
<title>Admin-Aggiungi</title>
</head>
<body>

<%@include file="../fragments/header.jsp"%>
<%
    if(userBean.getRole().equals(Role.user) ){
        response.sendError(HttpServletResponse.SC_FORBIDDEN);
        return;
    }
%>

<h2>Aggiungi un prodotto</h2>
<form class="form-horizontal">
    <div class="form-row">
        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" id="nome" name="nome" required>
        </div>
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div class="form-group">
            <label for="prezzo">Prezzo</label>
            <input type="number" id="prezzo" name="prezzo" required>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label for="brand">Brand</label>
            <input type="text" id="brand" name="brand" required>
        </div>
        <div class="form-group">
            <label for="personaggio">Personaggio</label>
            <input type="text" id="personaggio" name="personaggio" required>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label for="quantita">Quantità</label>
            <input type="number" id="quantita" name="quantita" required>
        </div>
        <div class="form-group">
            <label for="immagine">Immagine</label>
            <input type="file" id="immagine" name="immagine" accept="image/*" required>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group full-width">
            <label for="descrizione">Descrizione</label>
            <textarea id="descrizione" name="descrizione" rows="4" required></textarea>
        </div>
    </div>
    <div class="form-row">
        <button type="submit">Submit</button>
    </div>
</form>
<%@include file="../fragments/footer.jsp"%>

</body>
</html>
