<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
  if (session == null || session.getAttribute("usuario") == null) {
    response.sendRedirect("login.jsp");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Inicio - Peluches Personalizados</title>
</head>
<body>
<h2>Bienvenido, <%= session.getAttribute("usuario") %></h2>
<nav>
  <ul>
    <li><a href="ProductoController?accion=listar">Gestionar Productos</a></li>
    <!-- Puedes agregar más opciones aquí -->
    <li><a href="LogoutController">Cerrar Sesión</a></li>
  </ul>
</nav>
</body>
</html>
