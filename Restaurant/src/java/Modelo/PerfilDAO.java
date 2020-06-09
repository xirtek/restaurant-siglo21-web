/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import DBConexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Raul
 */
public class PerfilDAO {
     Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
   private String mensaje = "";

    public String agregarPerfil(Connection con, Perfil per) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO PERFIL (ID_PERFIL,NOMBRE_PERFIL,DESCRIPCION_PERFIL)"
                + "VALUES(PERFIL_SEQ.NEXTVAL,?,?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getNombre_perfil());
            ps.setString(2, per.getDescripcion_perfil());
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    
       
   
}
