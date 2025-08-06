/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony_escuela;

import modelo.Estudiante;
import java.sql.*;
import java.util.*;

public class EstudianteDAO {
    private Connection con;

    public EstudianteDAO(Connection con) {
        this.con = con;
    }

    // Método privado para verificar la conexión
    private void verificarConexion() throws SQLException {
        if (con == null || con.isClosed()) {
            throw new SQLException("Conexión a la base de datos no disponible");
        }
    }

    public void guardar(Estudiante estudiante) throws SQLException {
        verificarConexion();
        String sql = "INSERT INTO estudiantes (nombre, correo, programa) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, estudiante.getNombre());
            stmt.setString(2, estudiante.getCorreo());
            stmt.setString(3, estudiante.getPrograma());
            stmt.executeUpdate();
        }
    }

    public void modificar(Estudiante estudiante) throws SQLException {
        verificarConexion();
        String sql = "UPDATE estudiantes SET nombre = ?, correo = ?, programa = ? WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, estudiante.getNombre());
            stmt.setString(2, estudiante.getCorreo());
            stmt.setString(3, estudiante.getPrograma());
            stmt.setInt(4, estudiante.getId());
            stmt.executeUpdate();
        }
    }

    public List<Estudiante> listar() throws SQLException {
        verificarConexion();
        List<Estudiante> lista = new ArrayList<>();
        String sql = "SELECT * FROM estudiantes";
        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Estudiante e = new Estudiante();
                e.setId(rs.getInt("id"));
                e.setNombre(rs.getString("nombre"));
                e.setCorreo(rs.getString("correo"));
                e.setPrograma(rs.getString("programa"));
                lista.add(e);
            }
        }
        return lista;
    }

    public Estudiante obtenerPorId(int id) throws SQLException {
        verificarConexion();
        String sql = "SELECT * FROM estudiantes WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Estudiante e = new Estudiante();
                    e.setId(rs.getInt("id"));
                    e.setNombre(rs.getString("nombre"));
                    e.setCorreo(rs.getString("correo"));
                    e.setPrograma(rs.getString("programa"));
                    return e;
                }
            }
        }
        return null;
    }
}