/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import com.sun.xml.ws.tx.at.v10.types.PrepareResponse;
import DBConexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JTable;
/**
 *
 * @author Ulrich
 */
public class ReservaDAO {
    private String mensaje="";

   public String agregarReserva(Connection con, Reserva res) {
        PreparedStatement ps = null;
        String sql = " INSERT INTO RESERVA (ID_RESERVA, FECHA_USO, HORA_USO, RUT, ID_MESA)" + 
                " VALUES(RESERVA_SEQ.NEXTVAL,?,?,?,?)"; 
        try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, res.getFecha_uso());
            ps.setString(2, res.getHora_uso());
            ps.setString(3, res.getRut());
            ps.setInt(4, res.getId_mesa());
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;
            
        } catch (Exception e) {
            mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
        }
        return mensaje;
    }

    public String modificarReserva(Connection con, Reserva res) {
         PreparedStatement ps = null;
         String sql ="UPDATE RESERVA SET FECHA_USO = ?, HORA_USO = ?, RUT = ?, ID_MESA = ?"
                 + "WHERE ID_RESERVA = ? ";
         try {
            ps = con.prepareStatement(sql);
            ps.setDate(1, res.getFecha_uso());
            ps.setString(2, res.getHora_uso());
            ps.setString(3, res.getRut());
            ps.setInt(4, res.getId_mesa());
            ps.setInt(5, res.getId_reserva());
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;
        } catch (Exception e) {
             mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();     
        }
          return mensaje;   
    }

   public  String eliminarReserva(Connection con, int id_reserva) {
        PreparedStatement ps = null;
        String sql = "DELETE FROM RESERVA WHERE ID_RESERVA =?";
        
        try {
           ps = con.prepareStatement(sql);
           ps.setInt(1, id_reserva);
           
            mensaje = "GUARDADO CORRECTAMENTE";
            ps.execute();
            ps.close();;
           
       } catch (Exception e) {
             mensaje = "NO SE PUDO GUARDAR CORRECTAMENTE " + e.getMessage();
       }
         return mensaje;
        
    }
    
    public void listarReserva(Connection con, JTable tabla) {
        

    }
    
    
    
    
    
}
