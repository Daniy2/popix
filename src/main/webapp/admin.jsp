<%@ page import="java.util.ArrayList" %>
<%@ page import="model.UserBean" %>
<%@ page import="model.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--
    Lascio commentato, potrebbe servirci in futuro, ma modificato, fa il retrieve sulla jsp,
    possiamo metterlo in una tabella o farlo gestire da servlet

    UserDao userDao = new UserDao();
    ArrayList<UserBean> users = userDao.retrieveAllUsers();
    System.out.println(users.size());
    for (UserBean user : users) {
       %><p> <% String s = user.toString();%>
       <%=s %>
       </p>
    <%}
--%>

</body>
</html>
