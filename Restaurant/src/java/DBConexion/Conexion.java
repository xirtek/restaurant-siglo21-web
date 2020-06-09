/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Raul
 */
import java.sql.Connection;
import javax.swing.JOptionPane;

public class Conexion {

    private static Connection con = null;

    //private static String login = "restaurante";
    private static String login = "restaurante21";
    private static String clave = "oracle";
    private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
   // private static String url = "jdbc:oracle:thin:@localhost:1522:XE";

    public static Connection getConexion() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url, login, clave);

            con.setAutoCommit(false);
            if (con != null) {
                System.out.println("Conexion exitosa");
            } else {
                System.out.println("conexion fallida");
            }
        } catch (ClassNotFoundException | SQLException e) {

            JOptionPane.showMessageDialog(null, "Conexion erronea" + e.getMessage());
        }

        return con;
    }

    public void desconexion() {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println("Error al desconectar " + e.getMessage());
        }

    }

}
