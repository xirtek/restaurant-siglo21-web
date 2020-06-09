/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import DBConexion.Conexion;
import java.sql.Connection;

/**
 *
 * @author Raul
 */
public class UsuarioBO {
     private String mensaje="";
    private UsuarioDAO udao = new UsuarioDAO();
    
    public String agregarUsuario(Usuario usu){
        Connection con = Conexion.getConexion();
        try {
            mensaje = udao.agregarUsuario(con, usu);
            
        } catch (Exception e) {
            mensaje = mensaje + " " + e.getMessage();
            
        }finally{
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                 mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
}
