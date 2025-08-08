<%-- 
    Document   : index
    Created on : 7/08/2025, 1:00:03 p. m.
    Author     : camiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>Sistema de Información Académica Symphony</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  </head>
  <body style="background-color:#E6F7FF;">

    <div class="container mt-5">
      <div class="card shadow">
        <div class="card-body text-center">

          <!-- Título -->
          <h2 class="fw-bold mb-4" style="color:#0984E3;">
            SISTEMA DE INFORMACIÓN ACADÉMICA SYMPHONY
          </h2>

          <!-- Botones -->
          <div class="d-flex flex-wrap justify-content-center gap-3 mb-4">
            <a href="<%= request.getContextPath() %>/GestionEstudiantes.jsp" class="btn" style="background-color:#00B894; color:white;">
              <i class="fas fa-user-graduate me-2"></i> Gestión de Estudiantes
            </a>
            <a href="#" class="btn" style="background-color:#FDCB6E; color:black;">
              <i class="fas fa-book me-2"></i> Gestión de Materias
            </a>
            <a href="#" class="btn" style="background-color:#00B894; color:white;">
              <i class="fas fa-chalkboard-teacher me-2"></i> Gestión de Docentes
            </a>
            <a href="#" class="btn" style="background-color:#FDCB6E; color:black;">
              <i class="fas fa-calendar-alt me-2"></i> Clases Disponibles
            </a>
          </div>

          <!-- Imagen -->
          <img src="<%= request.getContextPath() %>/public/img/5.jpeg" alt="logo" class="img-fluid rounded mx-auto d-block" width="600">
          <p class="mt-2 text-muted">Disfruta en Symphony</p>

        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>