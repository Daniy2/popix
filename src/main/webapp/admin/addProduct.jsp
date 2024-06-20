<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/addProductServlet" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        <label for="idProduct">Insert id</label>
        <input type="text" name="idProduct" id="idProduct"><br>
        <label for="name">Insert name</label>
        <input type="text" name="name" id="name"><br>
        <label for="description">Insert description</label>
        <input type="text" name="description" id="description"><br>
        <label for="price">Insert price</label>
        <input type="number" name="price" id="price" step="0.01"><br>
        <label for="qty">Insert quantity</label>
        <input type="number" name="qty" id="qty" ><br>
        <label for="image_src">Insert image</label>
        <input type="file" name="image_src" id="image_src"><br>
        <label for="brand">Insert brand</label>
        <input type="text" name="brand" id="brand"><br>
        <label for="figure">Insert figure</label>
        <input type="text" name="figure" id="figure"><br>
        <input type="submit">
    </form>
</body>
</html>
