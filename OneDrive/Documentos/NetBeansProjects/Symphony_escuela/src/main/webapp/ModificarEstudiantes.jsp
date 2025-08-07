<%-- 
    Document   : ModificarEstudiante
    Created on : 7/08/2025, 11:00:00 a. m.
    Author     : camiv
--%>

<%@page import="com.universidad.universidad.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Sistema de Información Académica Symphony - Modificar Estudiante</title>
</head>
<body>
    <div class="container">
        <%
            Estudiante estudiante = (Estudiante) request.getAttribute("estudiante");
            if (estudiante != null) {
        %>
        <form action="ServletEstudiante" method="POST">
            <input type="hidden" name="action" value="actualizar">
            <div class="card mt-3">
                <div class="card-body">
                    <div class="col">
                        <label>Id</label>
                        <input type="text" class="form-control" name="id" value="<%= estudiante.getId() %>" readonly>
                    </div>
                    <div class="col">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%= estudiante.getNombreAlumno() %>" required>
                    </div>
                    <div class="col">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" value="<%= estudiante.getApellidoAlumno() %>" required>
                    </div>
                    <div class="col">
                        <label>Teléfono</label>
                        <input type="text" name="telefono" class="form-control" value="<%= estudiante.getTelefono() %>" required>
                    </div>
                    <div class="col">
                        <label>Dirección</label>
                        <input type="text" name="direccion" class="form-control" value="<%= estudiante.getDireccion() %>" required>
                    </div>
                    <div class="col">
                        <label>Correo</label>
                        <input type="email" name="correo" class="form-control" value="<%= estudiante.getCorreo() %>" required>
                    </div>
                    <div class="col">
                        <label>Género</label>
                        <input type="text" name="genero" class="form-control" value="<%= estudiante.getGenero() %>" required>
                    </div>
                    <div class="col mt-3">
                        <button type="submit" class="btn btn-primary">Guardar cambios</button>
                    </div>
                </div>
            </div>
        </form>
        <% } else { %>
            <div class="alert alert-danger mt-3">No se encontró el estudiante para modificar.</div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>