/**
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony;

import java.sql.*;
import java.util.*;

public class EstudianteDao {

    private Connection conectar() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/symphony";
        String user = "root";
        String password = "";
        return DriverManager.getConnection(url, user, password);
    }

    public boolean CorreoExiste(String correo) {
        String sql = "SELECT COUNT(*) FROM estudiantes WHERE correo = ?";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, correo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean CorreoPerteneceA(String correo, int id) {
        String sql = "SELECT COUNT(*) FROM estudiantes WHERE correo = ? AND id = ?";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, correo);
            stmt.setInt(2, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void InsertarEstudiante(Estudiante est) {
        String sql = "INSERT INTO estudiantes (nombre, apellido, telefono, direccion, correo, genero) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, est.getNombre());
            stmt.setString(2, est.getApellido());
            stmt.setString(3, est.getTelefono());
            stmt.setString(4, est.getDireccion());
            stmt.setString(5, est.getCorreo());
            stmt.setString(6, est.getGenero());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void ActualizarEstudiante(Estudiante est) {
        String sql = "UPDATE estudiantes SET nombre = ?, apellido = ?, telefono = ?, direccion = ?, correo = ?, genero = ? WHERE id = ?";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, est.getNombre());
            stmt.setString(2, est.getApellido());
            stmt.setString(3, est.getTelefono());
            stmt.setString(4, est.getDireccion());
            stmt.setString(5, est.getCorreo());
            stmt.setString(6, est.getGenero());
            stmt.setInt(7, est.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void EliminarEstudiante(int id) {
        String sql = "DELETE FROM estudiantes WHERE id = ?";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Estudiante obtenerPorId(int id) {
        Estudiante estudiante = null;
        String sql = "SELECT * FROM estudiantes WHERE id = ?";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                estudiante = new Estudiante();
                estudiante.setId(rs.getInt("id"));
                estudiante.setNombre(rs.getString("nombre"));
                estudiante.setApellido(rs.getString("apellido"));
                estudiante.setTelefono(rs.getString("telefono"));
                estudiante.setDireccion(rs.getString("direccion"));
                estudiante.setCorreo(rs.getString("correo"));
                estudiante.setGenero(rs.getString("genero"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estudiante;
    }

    public List<Estudiante> obtenerTodos() {
        List<Estudiante> lista = new ArrayList<>();
        String sql = "SELECT * FROM estudiantes";
        try (Connection conn = conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Estudiante est = new Estudiante();
                est.setId(rs.getInt("id"));
                est.setNombre(rs.getString("nombre"));
                est.setApellido(rs.getString("apellido"));
                est.setTelefono(rs.getString("telefono"));
                est.setDireccion(rs.getString("direccion"));
                est.setCorreo(rs.getString("correo"));
                est.setGenero(rs.getString("genero"));
                lista.add(est);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}