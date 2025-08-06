<%-- 
    Document   : modificarEstudiante
    Created on : 6/08/2025, 3:58:14 p. m.
    Author     : camiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Estudiante"%>
<%
    Estudiante est = (Estudiante) request.getAttribute("estudiante");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Modificar Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2>Modificar Estudiante</h2>
    <form action="ServletEstudiantes" method="post">
        <input type="hidden" name="action" value="modificar">
        <input type="hidden" name="id" value="<%= est.getId() %>">
        <div class="mb-3">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control" value="<%= est.getNombre() %>" required>
        </div>
        <div class="mb-3">
            <label>Correo:</label>
            <input type="email" name="correo" class="form-control" value="<%= est.getCorreo() %>" required>
        </div>
        <div class="mb-3">
            <label>Programa:</label>
            <input type="text" name="programa" class="form-control" value="<%= est.getPrograma() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Actualizar</button>
    </form>
</body>
</html>