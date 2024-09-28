<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Producto</title>
</head>
<body>
<h2>Agregar Producto</h2>
<form action="Producto" method="post">
    <input type="hidden" name="accion" value="insertar">
    <label>Nombre:</label><br>
    <input type="text" name="nombre" required><br><br>
    <label>Descripción:</label><br>
    <input type="text" name="descripcion" required><br><br>
    <label>Precio:</label><br>
    <input type="number" step="0.01" name="precio" required><br><br>
    <label>Stock:</label><br>
    <input type="number" name="stock" required><br><br>
    <input type="submit" value="Agregar">
</form>
<br>
<a href="Producto?accion=listar">Volver al Listado</a>
</body>
</html>
