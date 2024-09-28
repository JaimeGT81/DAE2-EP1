<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dae2.ep1.erp.modelo.Producto" %>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }

    Producto producto = (Producto) request.getAttribute("producto");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Producto</title>
</head>
<body>
<h2>Editar Producto</h2>
<form action="Producto" method="post">
    <input type="hidden" name="accion" value="actualizar">
    <input type="hidden" name="id" value="<%= producto.getIdProducto() %>">
    <label>Nombre:</label><br>
    <input type="text" name="nombre" value="<%= producto.getNombre() %>" required><br><br>
    <label>Descripción:</label><br>
    <input type="text" name="descripcion" value="<%= producto.getDescripcion() %>" required><br><br>
    <label>Precio:</label><br>
    <input type="number" step="0.01" name="precio" value="<%= producto.getPrecio() %>" required><br><br>
    <label>Stock:</label><br>
    <input type="number" name="stock" value="<%= producto.getStock() %>" required><br><br>
    <input type="submit" value="Actualizar">
</form>
<br>
<a href="Producto?accion=listar">Volver al Listado</a>
</body>
</html>

