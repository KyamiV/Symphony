<%-- 
    Document   : index
    Created on : 6/08/2025, 12:43:44 p. m.
    Author     : camiv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de información Académica</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body style= "background-color: #40E0D0;"> 
  <div class="container">
    <div class="row M_4">
      <div class="card" style="display: flex; margin: 0px auto; margin-top: 6px;">
        <div class="card-body">
          <div class="col" style="padding: 5px; text-align: center;">
            <a href="ServletEstudiantes?action=mostrar" class="btn btn-outline-info" target="_blank">Gestion de Estudiantes</a>
            <a href="" class="btn btn-outline-info">Gestion de Materias</a>
            <a href="" class="btn btn-outline-info">Gestion de Docentes</a>
            <a href="" class="btn btn-outline-info">Gestion de Programas</a>
            <hr>
            <h2>
              <center>
                <font color="#23AE69"><b>SISTEMA DE INFORMACION ACADEMICA Symphony- SIA</b></font>
              </center>
            </h2>
            <hr>
            <div id="imagen-container"></div>
            <div class="container text-center mt-4">
            <img src="${pageContext.request.contextPath}/public/imagen/musica.jpeg" width="1100" height="400" alt="Imagen de música">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>