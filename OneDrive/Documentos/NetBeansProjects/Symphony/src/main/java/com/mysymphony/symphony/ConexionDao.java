/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mysymphony.symphony.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase encargada de gestionar la conexión con la base de datos Symphony.
 * @author camiv
 */
public class ConexionDao {

    // Parámetros de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/symphony";
    private static final String USUARIO = "root";
    private static final String CLAVE = "";

    /**
     * Establece la conexión con la base de datos Symphony.
     * @return objeto Connection si la conexión es exitosa, null en caso contrario.
     */
    public static Connection obtenerConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USUARIO, CLAVE);
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Driver JDBC no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("❌ Error al conectar con Symphony: " + e.getMessage());
        }
        return null;
    }

    /**
     * Cierra la conexión con la base de datos.
     * @param conn conexión activa a cerrar.
     */
    public static void cerrarConexion(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("✅ Conexión cerrada correctamente.");
            } catch (SQLException e) {
                System.err.println("⚠️ Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }

    /**
     * Método de prueba para verificar la conexión con la base de datos Symphony.
     */
    public static void main(String[] args) {
        try (Connection conn = obtenerConexion()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Conexión exitosa al sistema Symphony.");
            } else {
                System.out.println("❌ No se pudo establecer conexión con Symphony.");
            }
        } catch (SQLException e) {
            System.err.println("⚠️ Error inesperado: " + e.getMessage());
        }
    }
}