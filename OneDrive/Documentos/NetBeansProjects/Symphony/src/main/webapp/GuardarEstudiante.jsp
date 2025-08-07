<%-- 
    Document   : GuardarEstudiante
    Created on : 7/08/2025, 2:37:21 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sistema de Informacion Academica SIA - Nuevo Estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMC">
</head>
<body style="background-color:#C1CDCD;">
    <div class="container mt-5">

        <!-- Imagen de encabezado -->
        <div class="text-center mb-4">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo del sistema" class="img-fluid" style="max-height: 120px;">
        </div>

        <h2 class="text-center">Formulario de Estudiantes</h2>

        <form action="EstudianteServlet" method="post">
            <div class="card mt-3">
                <div class="card-body">

                    <div class="col">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" placeholder="Digite el nombre estudiante" required>
                    </div>

                    <div class="col">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" placeholder="Digite el apellido del estudiante" required>
                    </div>

                    <div class="col">
                        <label>Telefono</label>
                        <input type="text" name="telefono" class="form-control" placeholder="Numero de Telefono" required>
                    </div>

                    <div class="col">
                        <label>Direccion</label>
                        <input type="text" name="direccion" class="form-control" placeholder="Digite direccion" required>
                    </div>

                    <div class="col">
                        <label>Correo</label>
                        <input type="text" name="correo" class="form-control" placeholder="Correo Electronico" required>
                    </div>

                    <div class="col">
                        <label>Genero</label>
                        <input type="text" name="genero" class="form-control" placeholder="Digite el genero" required>
                    </div>

                    <div class="col mt-3 text-center">
                        <button type="submit" name="action" value="guardar" class="btn btn-primary">Guardar</button>
                    </div>

                </div>
            </div>
        </form>
    </div>
</body>
</html>