<%-- 
    Document   : GuardarEstudiante
    Created on : 7/08/2025, 2:37:21 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modelo.Estudiante" %>
<%@ page import="dao.EstudianteDao" %>

<%
    String idParam = request.getParameter("id");
    Estudiante estudiante = null;

    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        EstudianteDao dao = new EstudianteDao();
        estudiante = dao.obtenerPorId(id);
    }

    String mensaje = request.getParameter("mensaje");
%>

<html>
<head>
    <title>Sistema de Información Académica Symphony - Nuevo Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#C1CDCD;">
    <div class="container">
        <form action="EstudianteServlet" method="post">
            <div class="card mt-4">
                <div class="card-body">
                    <div class="d-flex justify-content-start">
                        <a href="GestionEstudiantes.jsp" class="btn btn-warning">Volver</a>
                    </div>
                    <hr>
                    <h4 class="text-center">Registro de Estudiante</h4>

                    <%-- Mensajes --%>
                    <% if ("correo_duplicado".equals(mensaje)) { %>
                        <div class="alert alert-danger text-center" role="alert">
                            El correo ya está registrado. Intenta con otro.
                        </div>
                    <% } else if ("ok".equals(mensaje)) { %>
                        <div class="alert alert-success text-center" role="alert">
                            ¡Estudiante guardado exitosamente!
                        </div>
                    <% } %>

                    <%-- Acción: insertar o actualizar --%>
                    <% if (estudiante != null) { %>
                        <input type="hidden" name="accion" value="actualizar">
                        <input type="hidden" name="id" value="<%= estudiante.getId() %>">
                    <% } else { %>
                        <input type="hidden" name="accion" value="insertar">
                    <% } %>

                    <div class="mb-3 mt-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control"
                               value="<%= estudiante != null ? estudiante.getNombre() : "" %>"
                               placeholder="Digite el nombre del estudiante" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" name="apellido" class="form-control"
                               value="<%= estudiante != null ? estudiante.getApellido() : "" %>"
                               placeholder="Digite el apellido del estudiante" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" name="telefono" class="form-control"
                               value="<%= estudiante != null ? estudiante.getTelefono() : "" %>"
                               placeholder="Número de Teléfono" required pattern="[0-9]+" title="Solo números">
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" name="direccion" class="form-control"
                               value="<%= estudiante != null ? estudiante.getDireccion() : "" %>"
                               placeholder="Digite dirección" required>
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" name="correo" class="form-control"
                               value="<%= estudiante != null ? estudiante.getCorreo() : "" %>"
                               placeholder="Correo Electrónico" required>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
                        <select name="genero" class="form-select" required>
                            <option value="">Seleccione género</option>
                            <option value="Masculino" <%= estudiante != null && "Masculino".equals(estudiante.getGenero()) ? "selected" : "" %>>Masculino</option>
                            <option value="Femenino" <%= estudiante != null && "Femenino".equals(estudiante.getGenero()) ? "selected" : "" %>>Femenino</option>
                            <option value="Otro" <%= estudiante != null && "Otro".equals(estudiante.getGenero()) ? "selected" : "" %>>Otro</option>
                        </select>
                    </div>
                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>