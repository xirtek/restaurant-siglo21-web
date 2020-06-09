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
public class PedidoBO {
private String mensaje="";
    private PedidoDAO pdao = new PedidoDAO();
    
    public String modificarPedido(Pedido ped){
        Connection con = Conexion.getConexion();
        try {
            mensaje = pdao.modificarPedido(con, ped);
            
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
     public String modificarPedidoPrecio(int precio, int id){
        Connection con = Conexion.getConexion();
        try {
            mensaje = pdao.modificarPedidoPrecio(con, precio, id);
            
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
     
      public String modificarEstado(String estado, int id){
        Connection con = Conexion.getConexion();
        try {
            mensaje = pdao.modificarEstado(con, estado, id);
            
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
      
      
     public String agrregarPedido(Pedido ped){
        Connection con = Conexion.getConexion();
        try {
            mensaje = pdao.agregarPedido(con, ped);
            
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

