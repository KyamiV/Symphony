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

    <div class="container mt-3">
        <div class="card-body">
            <!-- Título -->
            <h2 class="text-center text-primary fw-bold mb-4">Gestión y Registro de Estudiantes</h2>

            <!-- Botón para nuevo estudiante -->
            <div class="text-end mb-3">
                <a href="GuardarEstudiante.jsp" class="btn btn-success">Nuevo Estudiante</a>
            </div>
            <div class="d-flex justify-content-center mb-3">
                <a href="Home.jsp" class="btn btn-warning me-2">Regresar</a>
            </div>

            <!-- Formulario de búsqueda -->
            <form method="get" class="d-flex justify-content-center mb-3">
                <input type="text" name="filtro" class="form-control w-50 me-2"
                       placeholder="Buscar por nombre o correo"
                       value="<%= request.getParameter("filtro") != null ? request.getParameter("filtro") : "" %>">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </form>

            <!-- Tabla de estudiantes -->
            <table class="table table-bordered table-hover mt-4">
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
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/symphony", "root", "");
                            stmt = conn.createStatement();

                            String filtro = request.getParameter("filtro");
                            String sql = "SELECT * FROM estudiantes";

                            if (filtro != null && !filtro.trim().isEmpty()) {
                                sql += " WHERE nombre LIKE '%" + filtro + "%' OR correo LIKE '%" + filtro + "%'";
                            }

                            rs = stmt.executeQuery(sql);

                            while(rs.next()) {
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
                            <a href="GuardarEstudiante.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-info">Editar</a>
                            <a href="EstudianteServlet?accion=eliminar&id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger">Eliminar</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch(Exception e) {
                            out.println("<tr><td colspan='8' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                            e.printStackTrace();
                        } finally {
                            if(rs != null) rs.close();
                            if(stmt != null) stmt.close();
                            if(conn != null) conn.close();
                        }
                    %> 
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>