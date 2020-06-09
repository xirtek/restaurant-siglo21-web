/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JTable;

/**
 *
 * @author Raul
 */
public class OrdenDAO {

    private String mensaje = "";

    public String agregarOrden(Connection con, Orden ord) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO ORDEN (ID_ORDEN,PRECIO_SUBTOTAL,ID_BEBESTIBLE,ID_POSTRE,ID_PLATO,ID_PEDIDO,ESTADO)"
                + "VALUES(ORDEN_SEQ.NEXTVAL,?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, ord.getPrecio_total());
            ps.setInt(2, ord.getId_bebestible());
            ps.setInt(3, ord.getId_postre());
            ps.setInt(4, ord.getId_plato());
            ps.setInt(5, ord.getId_pedido());
            ps.setString(6, ord.getEstado());

            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    public String modificarOrden(Connection con, Orden ord) {
        PreparedStatement ps = null;
        String sql = "UPDATE ORDEN SET ESTADO = ?"
                + "where ID_ORDEN =?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, ord.getEstado());
            ps.setInt(2, ord.getId_orden());
            
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    public String eliminarOrden(Connection con, int id_orden) {
        return null;
    }

    public void listarOrden(Connection con, JTable tabla) {

    }

}
