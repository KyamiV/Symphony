<%-- 
    Document   : Estudiantes
    Created on : 7/08/2025, 1:44:46 p. m.
    Author     : camiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Estudiantes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#F0F8FF;">

    <div class="container mt-4">
        <div class="card-body">

            <!-- Título -->
            <h2 class="text-center text-primary fw-bold mb-4">Gestión y Registro de Estudiantes</h2>

            <!-- Mensajes -->
            <%
                String mensaje = request.getParameter("mensaje");
                if ("eliminado".equals(mensaje)) {
            %>
                <div class="alert alert-warning text-center">🗑️ Estudiante eliminado correctamente.</div>
            <%
                } else if ("actualizado".equals(mensaje)) {
            %>
                <div class="alert alert-success text-center">✅ Estudiante actualizado correctamente.</div>
            <%
                } else if ("no_encontrado".equals(mensaje)) {
            %>
                <div class="alert alert-danger text-center">⚠️ Estudiante no encontrado.</div>
            <%
                }
            %>

            <!-- Botones -->
            <div class="d-flex justify-content-between mb-3">
                <a href="GuardarEstudiante.jsp" class="btn btn-success">➕ Nuevo Estudiante</a>
                <a href="Home.jsp" class="btn btn-warning">Regresar</a>
            </div>

            <!-- Tabla -->
            <table class="table table-bordered table-hover">
                <thead class="table-light text-center">
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Correo</th>
                        <th>Género</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            try (
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/symphony", "root", "");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM estudiantes")
                            ) {
                                boolean hayDatos = false;
                                while (rs.next()) {
                                    hayDatos = true;
                    %>
                    <tr class="text-center">
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("nombre") %></td>
                        <td><%= rs.getString("apellido") %></td>
                        <td><%= rs.getString("telefono") %></td>
                        <td><%= rs.getString("direccion") %></td>
                        <td><%= rs.getString("correo") %></td>
                        <td><%= rs.getString("genero") %></td>
                        <td>
                            <a href="EstudianteServlet?accion=editar&id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary">Editar</a>
                            <a href="EstudianteServlet?accion=eliminar&id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger"
                               onclick="return confirm('¿Estás seguro de eliminar este estudiante?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                                }
                                if (!hayDatos) {
                    %>
                    <tr>
                        <td colspan="8" class="text-center text-muted">No hay estudiantes registrados.</td>
                    </tr>
                    <%
                                }
                            }
                        } catch (Exception e) {
                    %>
                    <tr>
                        <td colspan="8" class="text-danger text-center">Error: <%= e.getMessage() %></td>
                    </tr>
                    <%
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
