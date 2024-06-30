<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="model.PersonalInfoBean" %>
<%@ page import="model.ShippingInfoBean" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles-pers.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Panoramica</title>
</head>
<body>

<div class="container light-style flex-grow-1 container-p-y">
    <h4 class="font-weight-bold py-3 mb-4">
        Panoramica account
    </h4>
    <form action="${pageContext.request.contextPath}/infosServlet" method="post">
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                           href="#account-general">Generali</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                           href="${pageContext.request.contextPath}/getOrderDetailsServlet">Storico ordini</a>    <!--link to panoramica page-->
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">
                            <div class="card-body media align-items-center">
                                <img src="${pageContext.request.contextPath}/images/logo-noborderico.png" alt
                                     class="d-block ui-w-80">
                            </div>
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <div class="form-group">
                                    <label class="form-label">Nome</label>
                                    <input type="text" class="form-control mb-1" name="name" value="${fn:escapeXml(personalInfo.name)}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Cognome</label>
                                    <input type="text" class="form-control" name="surname" value="${fn:escapeXml(personalInfo.surname)}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Data di nascita</label>
                                    <input type="text" class="form-control mb-1" name="birthday" value="${fn:escapeXml(personalInfo.dateOfBirth)}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Numero di telefono</label>
                                    <input type="text" class="form-control" name="cellphone" value="${fn:escapeXml(personalInfo.cellphoneNumber)}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Paese</label>
                                    <input type="text" class="form-control" name="country" value="${fn:escapeXml(shippingInfo.country)}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Città</label>
                                    <input type="text" class="form-control" name="city" value="${fn:escapeXml(shippingInfo.city)}">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Indirizzo</label>
                                    <input type="text" class="form-control" name="address" value="${fn:escapeXml(shippingInfo.address)}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-right mt-3">
                <button type="submit" class="btn btn-primary" style="background-color: #333;">Salva</button>&nbsp;
                <a href="home.jsp" class="btn btn-secondary">Torna alla home</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
