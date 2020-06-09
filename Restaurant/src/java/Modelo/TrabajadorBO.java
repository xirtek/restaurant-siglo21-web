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
public class TrabajadorBO {
    
    private String mensaje="";
    private TrabajadorDAO tdao = new TrabajadorDAO();
    
    public String agregarTrabajador(Trabajador tra){
        Connection con = Conexion.getConexion();
        try {
            mensaje = tdao.agregarTrabajador(con, tra);
            
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
    public String modificarTrabajador(Trabajador tra){
        Connection con = Conexion.getConexion();
        try {
            mensaje = tdao.modificarTrabajador(con, tra);
            
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
    public String eliminarTrabajador(int id_trabajador){
        Connection con = Conexion.getConexion();
        try {
            mensaje = tdao.eliminarTrabajador(con, id_trabajador);
            
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
    public void listarTrabajador(){
        
    }
}
