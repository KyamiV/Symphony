<%-- 
    Document   : listarEstudiantes
    Created on : 6/08/2025, 5:46:54 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Estudiante" %>
<html>
<head>
    <title>Lista de Estudiantes</title>
</head>
<body>
    <h1>Estudiantes Registrados</h1>
    <a href="guardarEstudiante.jsp">Agregar nuevo estudiante</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Programa</th>
            <th>Acciones</th>
        </tr>
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
                <a href="ServletEstudiantes?action=editar&id=<%= e.getId() %>">Editar</a>
            </td>
        </tr>
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div style="color: red; font-weight: bold; margin-bottom: 10px;">
                <%= error %>
            </div>
<% } %>
        <% if (error != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
<% } %>
    </table>
</body>
</html>