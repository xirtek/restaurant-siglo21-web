/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import com.sun.xml.ws.tx.at.v10.types.PrepareResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JTable;

/**
 *
 * @author Raul
 */
public class TrabajadorDAO {

    private String mensaje = "";

    public String agregarTrabajador(Connection con, Trabajador tra) {
        PreparedStatement ps = null;
        String sql = "INSERT INTO TRABAJADOR (ID_TRABAJADOR,RUT_TRABAJADOR,PRIMER_NOMBRE,SEGUNDO_NOMBRE,APELL_PATERNO,APELL_MATERNO,FECHA_NACIMIENTO,SEXO,DIRECCION,NRO_DIRECCION,CIUDAD,CARGO,TELEFONO,CORREO_CONTACTO,SUELDO)"
                + "VALUES(TRABAJADOR_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, tra.getRut_trabajador());
            ps.setString(2, tra.getPrimer_nombre());
            ps.setString(3, tra.getSegundo_nombre());
            ps.setString(4, tra.getApell_paterno());
            ps.setString(5, tra.getApell_materno());
            ps.setDate(6, tra.getFecha_nacimiento());
            ps.setString(7, tra.getSexo() + "");
            ps.setString(8, tra.getDireccion());
            ps.setInt(9, tra.getNro_direccion());
            ps.setString(10, tra.getCiudad());
            ps.setString(11, tra.getCargo());
            ps.setInt(12, tra.getTelefono());
            ps.setString(13, tra.getCorreo_contacto());
            ps.setInt(14, tra.getSueldo());
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    public String modificarTrabajador(Connection con, Trabajador tra) {
PreparedStatement ps = null;
        String sql = "UPDATE EMPLEADO SET RUT_TRABAJADOR = ?,PRIMER_NOMBRE = ?,SEGUNDO_NOMBRE = ?,PELL_PATERNO = ?,APELL_MATERNO = ?,FECHA_NACIMIENTO = ?,SEXO = ?,DIRECCION = ?,NRO_DIRECCION = ?,CIUDAD = ?,CARGO = ?,TELEFONO = ?,CORREO_CONTACTO = ?,SUELDO = ?"
                + "where ID_TRABAJADOR =?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, tra.getRut_trabajador());
            ps.setString(2, tra.getPrimer_nombre());
            ps.setString(3, tra.getSegundo_nombre());
            ps.setString(4, tra.getApell_paterno());
            ps.setString(5, tra.getApell_materno());
            ps.setDate(6, tra.getFecha_nacimiento());
            ps.setString(7, tra.getSexo() + "");
            ps.setString(8, tra.getDireccion());
            ps.setInt(9, tra.getNro_direccion());
            ps.setString(10, tra.getCiudad());
            ps.setString(11, tra.getCargo());
            ps.setInt(12, tra.getTelefono());
            ps.setString(13, tra.getCorreo_contacto());
            ps.setInt(14, tra.getSueldo());
            ps.setInt(15, tra.getId_trabajador());
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    public String eliminarTrabajador(Connection con, int id_trabajador) {
        PreparedStatement ps = null;
        String sql = "DELETE FROM TRABAJADOR WHERE ID_TRABAJADOR =?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_trabajador);
            
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;

        } catch (SQLException e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    public void listarTrabajador(Connection con, JTable tabla) {
        

    }
}
