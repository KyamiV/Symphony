/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony_escuela;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author cami
 */
@WebServlet(name = "ServletEstudiante", urlPatterns = {"/ServletEstudiante"})
public class ServletEstudiante extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("mostrar".equals(action)) {
            mostrarEstudiantes(request, response);
        } else if ("modificar".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            EstudianteDao estudianteDao = new EstudianteDao();
            Estudiante estudiante = estudianteDao.obtenerEstudiantePorId(id);
            request.setAttribute("estudiante", estudiante);
            request.getRequestDispatcher("ModificarEstudiantes.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("guardar".equals(action)) {
            guardarEstudiantes(request, response);
        } else if ("actualizar".equals(action)) {
            actualizarEstudiantes(request, response);
        }
    }

    private void guardarEstudiantes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");
        String genero = request.getParameter("genero");

        EstudianteDao estudianteDao = new EstudianteDao();
        estudianteDao.InsertarEstudiante(nombre, apellido, telefono, direccion, correo, genero);

        response.sendRedirect("GuardarEstudiante.jsp?mensaje=Ok");
    }

    private void mostrarEstudiantes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EstudianteDao estudianteDao = new EstudianteDao();
        List<Estudiante> estudiantes = estudianteDao.ListarEstudiantes();
        request.setAttribute("listadestudiantes", estudiantes);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void actualizarEstudiantes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");
        String genero = request.getParameter("genero");

        EstudianteDao estudianteDao = new EstudianteDao();
        estudianteDao.ActualizarEstudiante(id, nombre, apellido, telefono, direccion, correo, genero);

        response.sendRedirect("ServletEstudiante?action=mostrar");
    }
}
