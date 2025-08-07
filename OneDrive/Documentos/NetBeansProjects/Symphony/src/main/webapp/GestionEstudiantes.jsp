<%-- 
    Document   : Estudiantes
    Created on : 7/08/2025, 1:44:46 p. m.
    Author     : camiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Estudiantes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#F0F8FF;">
    
    <form action ="" method=" ">
        <div class="container mt-3">
                <div class="card-body">
                    
                    <div class="col">
                    <!-- Título -->
                    <h2 class="text-center text-primary fw-bold mb-4">Gestión y Registro de Estudiantes </h2>

                    <!-- Botón para nuevo estudiante -->
                    <div class="text-end mb-3">
                        <a href="#" class="btn btn-success">Nuevo Estudiante</a>
                    </div>
                    <div class="d-flex justtify-center-safe">
                        <a href="Home.jsp" class="btn btn-warning">Regresar</a>
                    </div>
                    <form action="ServletEstudiantes" method="GET">

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
                            <!-- Aquí se mostrarán los estudiantes -->
                            <!-- Ejemplo vacío -->
                            <tr class="text-center">
                                <td colspan="8" class="text-muted">No hay estudiantes registrados.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>