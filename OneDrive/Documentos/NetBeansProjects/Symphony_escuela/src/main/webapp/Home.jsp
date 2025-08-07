<%-- 
    Document   : Home
    Created on : 6/08/2025, 7:01:49 p. m.
    Author     : camiv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sistema de Información Académica Symphony</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }
        .container {
            text-align: center;
        }
        h2 {
            margin-bottom: 30px;
            color: #2c3e50;
        }
        .btn-group a {
            margin: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sistema de Información Académica Symphony</h2>
        <div class="btn-group" role="group">
            <a href="ServletEstudiantes?action=mostrar" class="btn btn-primary">Gestión de Estudiantes</a>
            <a href="listarCursos.jsp" class="btn btn-success">Gestión de Asignaturas</a>
            <a href="listarDocentes.jsp" class="btn btn-info">Gestión de Docentes</a>
            <a href="listarHorarios.jsp" class="btn btn-warning">Gestión de Horarios</a>
        </div>
    </div>
        </div>
      </div>
    </div>
  </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>