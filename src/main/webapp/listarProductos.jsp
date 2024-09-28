<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Productos</title>
</head>
<body>
<h2>Listado de Productos</h2>
<a href="Producto?accion=nuevo">Agregar Producto</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Precio</th>
        <th>Stock</th>
        <th>Acciones</th>
    </tr>
    <c:forEach var="producto" items="${productos}">
        <tr>
            <td>${producto.idProducto}</td>
            <td>${producto.nombre}</td>
            <td>${producto.descripcion}</td>
            <td>${producto.precio}</td>
            <td>${producto.stock}</td>
            <td>
                <a href="Producto?accion=editar&id=${producto.idProducto}">Editar</a>
                <a href="Producto?accion=eliminar&id=${producto.idProducto}" onclick="return confirm('¿Está seguro de eliminar este producto?');">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="index.jsp">Volver al Inicio</a>
</body>
</html>
