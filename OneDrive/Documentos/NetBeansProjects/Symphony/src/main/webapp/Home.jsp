<%-- 
    Document   : index
    Created on : 7/08/2025, 1:00:03?p. m.
    Author     : camiv
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión y Registro de Estudiantes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            text-align: center;
        }
        h1 {
            color: #007bff;
        }
        .button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button-green {
            background-color: #28a745;
            color: white;
        }
        .button-yellow {
            background-color: #ffc107;
            color: black;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Gestión y Registro de Estudiantes</h1>
    <button class="button button-green">Nuevo Estudiante</button>
    <button class="button button-yellow">Regresar</button>
    <table>
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
        <tr>
            <td colspan="8">No hay estudiantes registrados.</td>
        </tr>
    </table>
</body>
</html>