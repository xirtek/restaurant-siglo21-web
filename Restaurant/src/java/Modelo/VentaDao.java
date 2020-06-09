/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Raul
 */
public class VentaDao {
     private String mensaje = "";

    public String agregarVenta(Connection con, Venta ven) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO VENTA (ID_VENTA, FECHA_VENTA,TOTAL_PAGAR,DETALLE_PAGO,NOMBRE_CLIENTE,METODO_PAGO,ID_PEDIDO,ID_TRABAJADOR)"
                + "VALUES(VENTA_SEQ.NEXTVAL,?,?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, ven.getFecha_venta());
            ps.setInt(2, ven.getTotal_pagar());
            ps.setString(3, ven.getDetalle_pago());
            ps.setString(4, ven.getNombre_cliente());
            ps.setString(5, ven.getMetodo_pago());
            ps.setInt(6, ven.getId_pedido());
            ps.setInt(7, ven.getId_trabajador());
            
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }
}
