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
public class VentaBO {
    
     private String mensaje="";
     
    private VentaDao vent = new VentaDao();
    
    public String agregarVenta(Venta ven){
        Connection con = Conexion.getConexion();
        try {
            mensaje = vent.agregarVenta(con, ven);
            
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
