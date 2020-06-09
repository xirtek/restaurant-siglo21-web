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
public class UsuarioDAO implements Validar{
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
   private String mensaje = "";
    
   @Override
   public int validar(Usuario usu){
       PerfilDAO pdao= new PerfilDAO();
       Perfil p = new Perfil();
        int r=0;
       String sql ="Select * from USUARIO u join perfil p on p.id_perfil = u.id_perfil where NOMBRE_USUARIO=? and CLAVE=?";
       try {
           con = cn.getConexion();
           ps =con.prepareStatement(sql);
           ps.setString(1, usu.getNombre());
           ps.setString(2, usu.getPw());
           rs=ps.executeQuery();
           while (rs.next()) {
               r=r+1;
               usu.setNombre(rs.getString("NOMBRE_USUARIO"));
               usu.setPw(rs.getString("CLAVE"));
                usu.setId(rs.getInt("ID_USUARIO"));
                 usu.setId_perfil(rs.getInt("ID_PERFIL"));
                 
                  p.setNombre_perfil(rs.getString("NOMBRE_PERFIL"));
               
           }
           if (r==1) {
               return 1;
           }else{
               return 0;
           }
       } catch (Exception e) {
           return 0;
       }
       
   }
   public String agregarUsuario(Connection con, Usuario usu) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO USUARIO (ID_USUARIO, NOMBRE_USUARIO,CLAVE,ID_TRABAJADOR,ID_PERFIL)"
                + "VALUES(USUARIO_SEQ.NEXTVAL,?,?,USUARIO_SEQ.nextval,?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getNombre());
            ps.setString(2, usu.getPw());
            ps.setInt(3, usu.getId_perfil());
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }
     
}
   

