/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony_escuela.dao;

import com.mysymphony.symphony_escuela.modelo.Estudiante;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EstudianteDAO {
    private Connection con;

    public EstudianteDAO(Connection con) {
        this.con = con;
    }

    public void guardar(Estudiante e) throws SQLException {
        String sql = "INSERT INTO estudiantes (nombre, correo, programa) VALUES (?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getCorreo());
            ps.setString(3, e.getPrograma());
            ps.executeUpdate();
        }
    }

    public void modificar(Estudiante e) throws SQLException {
        String sql = "UPDATE estudiantes SET nombre=?, correo=?, programa=? WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getCorreo());
            ps.setString(3, e.getPrograma());
            ps.setInt(4, e.getId());
            ps.executeUpdate();
        }
    }

    public List<Estudiante> listar() throws SQLException {
        List<Estudiante> lista = new ArrayList<>();
        String sql = "SELECT * FROM estudiantes";
        try (Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
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
        String sql = "SELECT * FROM estudiantes WHERE id=?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
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