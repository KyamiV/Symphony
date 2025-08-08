/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
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
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USUARIO, CLAVE);
        } catch (Exception e) {
            System.out.println("Error al conectar con la base de datos Symphony: " + e.getMessage());
        }
        return conn;
    }

    /**
     * Cierra la conexión con la base de datos.
     * @param conn conexión activa a cerrar.
     */
    public static void cerrarConexion(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Conexión cerrada correctamente.");
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }

    /**
     * Método de prueba para verificar la conexión con la base de datos Symphony.
     */
    public static void main(String[] args) {
        Connection conn = obtenerConexion();
        if (conn != null) {
            System.out.println("Conexión exitosa al sistema Symphony.");
            cerrarConexion(conn);
        } else {
            System.out.println("No se pudo establecer conexión con Symphony.");
        }
    }
}
