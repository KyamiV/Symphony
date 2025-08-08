<%-- 
    Document   : GuardarEstudiante
    Created on : 7/08/2025, 2:37:21 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysymphony.symphony.Estudiante" %>
<%
    Estudiante estudiante = (Estudiante) request.getAttribute("estudiante");
    boolean modoEdicion = (estudiante != null);
    String mensaje = request.getParameter("mensaje");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Sistema de Información Académica Symphony - <%= modoEdicion ? "Editar" : "Nuevo" %> Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#C1CDCD;">
    <div class="container">
        <form action="EstudianteServlet" method="post">
            <div class="card mt-4">
                <div class="card-body">

                    <!-- Botón regresar -->
                    <div class="mb-3">
                        <a href="GestionEstudiantes.jsp" class="btn btn-warning">Regresar</a>
                    </div>

                    <!-- Título -->
                    <h4 class="text-center mb-3"><%= modoEdicion ? "Editar Estudiante" : "Registro de Estudiante" %></h4>

                    <!-- Mensajes -->
                    <% if ("correo_duplicado".equals(mensaje)) { %>
                        <div class="alert alert-danger text-center">❌ El correo ya está registrado. Intenta con otro.</div>
                    <% } else if ("ok".equals(mensaje)) { %>
                        <div class="alert alert-success text-center">✅ Estudiante registrado exitosamente.</div>
                    <% } else if ("actualizado".equals(mensaje)) { %>
                        <div class="alert alert-success text-center">✅ Cambios guardados correctamente.</div>
                    <% } %>

                    <!-- Campo oculto para ID -->
                    <% if (modoEdicion) { %>
                        <input type="hidden" name="id" value="<%= estudiante.getId() %>">
                    <% } %>

                    <!-- Campos del formulario -->
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" required
                               value="<%= modoEdicion ? estudiante.getNombre() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" name="apellido" class="form-control" required
                               value="<%= modoEdicion ? estudiante.getApellido() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" name="telefono" class="form-control" pattern="[0-9]+" required
                               value="<%= modoEdicion ? estudiante.getTelefono() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" name="direccion" class="form-control" required
                               value="<%= modoEdicion ? estudiante.getDireccion() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" name="correo" class="form-control" required
                               value="<%= modoEdicion ? estudiante.getCorreo() : "" %>">
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
                        <input type="text" name="genero" class="form-control" required
                               value="<%= modoEdicion ? estudiante.getGenero() : "" %>">
                    </div>

                    <!-- Botón guardar/actualizar -->
                    <div class="d-grid mt-4">
                        <button type="submit" name="accion" value="<%= modoEdicion ? "actualizar" : "insertar" %>" class="btn btn-primary">
                            <%= modoEdicion ? "Actualizar" : "Guardar" %>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>