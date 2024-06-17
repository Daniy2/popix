<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 17/06/2024
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="POST" action="${pageContext.request.contextPath}/signIn">
    <label for="username">Inserisci username</label>
    <input type="text" name="username" id="username"><br>
    <label for="password">Inserisci password</label>
    <input type="password" name="password" id="password"><br>
    <input type="submit" value="SUBMIT">
</form>
</body>
</html>
