<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Peluches Personalizados</title>
</head>
<body>
<h2>Iniciar Sesión</h2>
<form action="Login" method="post">
    <label>Usuario:</label><br>
    <input type="text" name="username" required><br><br>
    <label>Contraseña:</label><br>
    <input type="password" name="password" required><br><br>
    <input type="submit" value="Ingresar">
</form>
<%
    String mensaje = (String) request.getAttribute("mensaje");
    if (mensaje != null) {
%>
<p style="color:red;"><%= mensaje %></p>
<%
    }
%>
</body>
</html>
