/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Raul
 */
public class BebidaDAO {
    
    public List<Bebida> Listarbebidas(Connection con,Bebida bebida) {

        PreparedStatement ps=null;
        ResultSet rs=null;
        List<Bebida> bebi = new ArrayList<Bebida>();


        try{
          
            String sql ="select ID_BEBESTIBLE, DESCRIPCION, PRECIO_UNITARIO, STOCK from BEBESTIBLE";

            ps = con.prepareStatement(sql);

            rs=ps.executeQuery();

            
            while (rs.next()) {
                bebida = new Bebida();
                bebida.setId_bebestible(rs.getInt(1));
                bebida.setDescripcion(rs.getString(2));
                bebida.setPrecio_unitario(rs.getInt(3));
                bebida.setPrecio_unitario(rs.getInt(4));
                bebi.add(bebida);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            try {
               if (rs != null) rs.close();
               if (ps != null) ps.close();
            } catch (SQLException ex) {
            }
        }

        return bebi;
        }
}
