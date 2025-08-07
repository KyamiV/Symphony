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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sistema de Información Académica Symphony</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
  </head>
  <body style="background-color:#E6F7FF;">

    <div class="container mt-5">
      <div class="card shadow">
        <div class="card-body text-center">

          <!-- Título -->
          <h2 class="text-center fw-bold mb-4" style= "color:#0984E3;">SISTEMA DE INFORMACIÓN ACADÉMICA SYMPHONY</h2>

          <!-- Botones distribuidos con Bootstrap -->
          <div class="d-flex flex-wrap justify-content-center gap-3 mb-4">
            
            <a href="GestionEstudiantes.jsp" class="btn" style="background-color:#00B894; color:white;">Gestión de Usuarios</a>
            <a href="#" class="btn btn-outline-info"style="background-color:#FDCB6E; color:black;">Gestión de Materias</a>
            <a href="#" class="btn btn-outline-info"style="background-color:#00B894; color:white;">Gestión de Docentes</a>
            <a href="#" class="btn btn-outline-info"style="background-color:#FDCB6E; color:black;">Gestión de Clases Disponibles</a>
          </div>

          <!-- Imagen -->
          <img src="public/img/5.jpeg" alt="logo" class="img-fluid rounded mx-auto d-block" width="600" height="auto">
          <p class="mt-2 text-muted">Disfruta en Symphony</p>

        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
  </body>
</html>