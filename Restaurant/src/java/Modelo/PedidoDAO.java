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
public class PedidoDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
   private String mensaje = "";
    public String modificarPedido(Connection con, Pedido ped) {
PreparedStatement ps = null;
        String sql = "UPDATE PEDIDO SET ESTADO = ?"
                + "where ID_PEDIDO = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, 2);
            ps.setInt(2, ped.getId_pedido());
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }
    
    public String modificarEstado(Connection con, String estado, int id) {
PreparedStatement ps = null;
        String sql = "UPDATE PEDIDO SET ESTADO = ?"
                + "where ID_PEDIDO = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, 2);
            ps.setInt(2, id);
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }
    
     public String modificarPedidoPrecio(Connection con, int precio, int id) {
PreparedStatement ps = null;
        String sql = "UPDATE PEDIDO SET PRECIO_TOTAL = ?"
                + "where ID_PEDIDO = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, precio);
            ps.setInt(2, id);
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }
    
     public String agregarPedido(Connection con, Pedido ped) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO PEDIDO (ID_PEDIDO,ESTADO,NOMBRE_CLIENTE,PRECIO_TOTAL,ID_MESA)"
                + "VALUES(PEDIDO_SEQ.NEXTVAL,?,?,?,?)";

        try {
            ps = con.prepareStatement(sql);
             ps.setString(1, ped.getEstado());
            ps.setString(2, ped.getNombre_cliente());
            ps.setInt(3, ped.getPrecio());
            ps.setInt(4, ped.getId_mesa());

            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

}
