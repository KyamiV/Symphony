/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony;

/**
 *
 * @author camiv
 */
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/EstudianteServlet")
public class EstudianteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        EstudianteDao dao = new EstudianteDao();

        if ("insertar".equals(accion)) {
            Estudiante est = new Estudiante();
            est.setNombre(request.getParameter("nombre"));
            est.setApellido(request.getParameter("apellido"));
            est.setTelefono(request.getParameter("telefono"));
            est.setDireccion(request.getParameter("direccion"));
            est.setCorreo(request.getParameter("correo"));
            est.setGenero(request.getParameter("genero"));

            if (dao.CorreoExiste(est.getCorreo())) {
                response.sendRedirect("GuardarEstudiantes.jsp?mensaje=correo_duplicado");
            } else {
                dao.InsertarEstudiante(est);
                response.sendRedirect("GuardarEstudiantes.jsp?mensaje=ok");
            }

        } else if ("actualizar".equals(accion)) {
            Estudiante est = new Estudiante();
            est.setId(Integer.parseInt(request.getParameter("id")));
            est.setNombre(request.getParameter("nombre"));
            est.setApellido(request.getParameter("apellido"));
            est.setTelefono(request.getParameter("telefono"));
            est.setDireccion(request.getParameter("direccion"));
            est.setCorreo(request.getParameter("correo"));
            est.setGenero(request.getParameter("genero"));

            if (dao.CorreoExiste(est.getCorreo()) && !dao.CorreoPerteneceA(est.getCorreo(), est.getId())) {
                response.sendRedirect("GuardarEstudiantes.jsp?id=" + est.getId() + "&mensaje=correo_duplicado");
            } else {
                dao.ActualizarEstudiante(est);
                response.sendRedirect("GestionEstudiantes.jsp?mensaje=actualizado");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        EstudianteDao dao = new EstudianteDao();

        if ("eliminar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.EliminarEstudiante(id);
            response.sendRedirect("GestionEstudiantes.jsp?mensaje=eliminado");

        } else if ("editar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Estudiante estudiante = dao.obtenerPorId(id);

            if (estudiante != null) {
                request.setAttribute("estudiante", estudiante);
                request.getRequestDispatcher("GuardarEstudiantes.jsp").forward(request, response);
            } else {
                response.sendRedirect("GestionEstudiantes.jsp?mensaje=no_encontrado");
            }
        }
    }
}