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
public class MesaBO {
    
    private String mensaje="";
    private MesaDAO mdao = new MesaDAO();
    
    public String modificarMesa(int id,char DISPONIBILIDAD){
        Connection con = Conexion.getConexion();
        try {
            mensaje = mdao.modificarMesa(con, id,DISPONIBILIDAD);
            
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
