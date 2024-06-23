<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-log.css">
    <title>Login</title>
</head>
<body>


<div class="container d-flex justify-content-center align-items-center min-vh-100">

    <div class="box-area row border rounded-5 p-4 bg-white shadow" style="max-width: 500px;">
        <h2 class="text-center mb-4">Accedi!</h2>

        <form >

            <div data-mdb-input-init class="form-outline mb-4">
                <label>
                    <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Username" name="username">
                </label>
            </div>

            <div data-mdb-input-init class="form-outline mb-4">
                <label>
                    <input type="text" class="form-control form-control-lg bg-light fs-6" placeholder="Password" name="password">
                </label>
            </div>

            <div class="input-group mb-4 d-flex justify-content-between">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="formCheck">
                    <label for="formCheck" class="form-check-label text-secondary"><small>Ricordami</small></label>
                </div>
                <p class="forgot">
                    <small><a href="#" class="fw-bold text-body text-decoration-none custom-link"><u>Password dimenticata?</u></a></small>
                </p>
            </div>

            <div class="input-group mb-4">
                <button type="submit" class="btn btn-lg w-100 fs-6" style="background-color: #9966ff; color: white;">Login</button>
            </div>

            <p class="text-center text-muted mt-5 mb-0">Non hai un account?  <a href="registration.jsp"
                                                                                class="fw-bold text-body"><u>Registrati</u></a></p>

        </form>

    </div>


</div>

</body>
</html>
