<%-- 
    Document   : listarEstudiantes
    Created on : 6/08/2025, 5:46:54 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mysymphony.symphony_esc.Estudiante" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de Estudiantes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Listado de Estudiantes</h2>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                    <th>Programa</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Estudiante> lista = (List<Estudiante>) request.getAttribute("lista");
                    if (lista != null) {
                        for (Estudiante e : lista) {
                %>
                <tr>
                    <td><%= e.getId() %></td>
                    <td><%= e.getNombre() %></td>
                    <td><%= e.getCorreo() %></td>
                    <td><%= e.getPrograma() %></td>
                    <td>
                        <a href="ServletEstudiantes?action=editar&id=<%= e.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No hay estudiantes registrados.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <a href="guardarEstudiante.jsp" class="btn btn-primary">Agregar nuevo estudiante</a>
        <a href="home.jsp" class="btn btn-default">Volver al inicio</a>
    </div>
</body>
</html>