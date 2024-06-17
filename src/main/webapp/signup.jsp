<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="POST" action="${pageContext.request.contextPath}/signUp">
    <label for="username">Inserisci username</label>
    <input type="text" name="username" id="username"><br>
    <label for="password">Inserisci password</label>
    <input type="password" name="password" id="password"><br>
    <label for="mail">Inserisci email</label>
    <input type="email" name="mail" id="mail">
    <input type="submit" value="SUBMIT">
</form>
</body>
</html>
