<%-- 
    Document   : GuardarEstudiante
    Created on : 7/08/2025, 2:37:21 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

                    <div class="mb-3 mt-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" placeholder="Digite el nombre estudiante" required>
                    </div>
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" name="apellido" class="form-control" placeholder="Digite el apellido del estudiante" required>
                    </div>
                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" name="telefono" class="form-control" placeholder="Número de Teléfono" required>
                    </div>
                    <div class="mb-3">
                        <label for="direccion" class="form-label">Dirección</label>
                        <input type="text" name="direccion" class="form-control" placeholder="Digite dirección" required>
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" name="correo" class="form-control" placeholder="Correo Electrónico" required>
                    </div>
                    <div class="mb-3">
                        <label for="genero" class="form-label">Género</label>
                        <input type="text" name="genero" class="form-control" placeholder="Digite el género" required>
                    </div>
                    <div class="d-grid mt-4">
                        <button type="submit" name="action" value="guardar" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>