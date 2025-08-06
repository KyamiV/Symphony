/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony_escuela;

import dao.EstudianteDAO;
import modelo.Estudiante;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletEstudiantes")
public class ServletEstudiantes extends HttpServlet {
    private Connection con;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sia", "root", "");
        } catch (Exception e) {
            throw new ServletException("Error de conexión a la base de datos", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        EstudianteDAO dao = new EstudianteDAO(con);

        try {
            if ("guardar".equals(action)) {
                Estudiante e = new Estudiante();
                e.setNombre(request.getParameter("nombre"));
                e.setCorreo(request.getParameter("correo"));
                e.setPrograma(request.getParameter("programa"));
                dao.guardar(e);
                response.sendRedirect("listarEstudiantes.jsp");
            } else if ("modificar".equals(action)) {
                Estudiante e = new Estudiante();
                e.setId(Integer.parseInt(request.getParameter("id")));
                e.setNombre(request.getParameter("nombre"));
                e.setCorreo(request.getParameter("correo"));
                e.setPrograma(request.getParameter("programa"));
                dao.modificar(e);
                response.sendRedirect("listarEstudiantes.jsp");
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EstudianteDAO dao = new EstudianteDAO(con);
        String action = request.getParameter("action");

        try {
            if ("mostrar".equals(action)) {
                List<Estudiante> lista = dao.listar();
                request.setAttribute("lista", lista);
                RequestDispatcher rd = request.getRequestDispatcher("listarEstudiantes.jsp");
                rd.forward(request, response);
            } else if ("editar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Estudiante est = dao.obtenerPorId(id);
                request.setAttribute("estudiante", est);
                RequestDispatcher rd = request.getRequestDispatcher("modificarEstudiante.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Para ver el error en consola
            request.setAttribute("error", "Ocurrió un error al procesar la solicitud. Intenta de nuevo.");
            RequestDispatcher rd = request.getRequestDispatcher("listarEstudiantes.jsp");
            rd.forward(request, response);
            throw new ServletException(ex);
        }
    }
}
