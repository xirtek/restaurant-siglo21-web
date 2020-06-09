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
 * @author Ulrich
 */
public class ReservaBO {
     private String mensaje="";
     private ReservaDAO rdao = new ReservaDAO();
    
    public String agregarReserva(Reserva res){
        Connection con = Conexion.getConexion();
        try {
              mensaje = rdao.agregarReserva(con , res);     
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
    
     public String modificarReserva(Reserva res){
        Connection con = Conexion.getConexion();
        try {
            mensaje = rdao.modificarReserva(con, res);
            
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
      public String eliminarReserva(int id_reserva){
        Connection con = Conexion.getConexion();
        try {
            mensaje = rdao.eliminarReserva(con, id_reserva);
            
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
   
    public void listarReserva(){
        
    }
        
   
    
}
