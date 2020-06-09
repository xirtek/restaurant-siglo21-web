/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Raul
 */
public class MesaDAO {
    
     private String mensaje = "";
     
  
    
    public String modificarMesa(Connection con,  int id,char DISPONIBILIDAD) {
PreparedStatement ps = null;
        String sql = "UPDATE mesa SET DISPONIBILIDAD = ?"
                + "where id_mesa = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, DISPONIBILIDAD+"");
            ps.setInt(2, id);
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }
}
