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
public class OrdenBO {
     private String mensaje="";
    private OrdenDAO odao = new OrdenDAO();
    
    public String agregarOrden(Orden ord){
        Connection con = Conexion.getConexion();
        try {
            mensaje = odao.agregarOrden(con, ord);
            
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
    public String modificarOrden(Orden ord){
        Connection con = Conexion.getConexion();
        try {
            mensaje = odao.modificarOrden(con, ord);
            
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
    public String eliminarOrden(int id_orden){
        Connection con = Conexion.getConexion();
        try {
            mensaje = odao.eliminarOrden(con, id_orden);
            
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
    public void listarOrden(){
        
    }
}
