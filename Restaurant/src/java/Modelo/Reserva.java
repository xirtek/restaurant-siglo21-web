/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.Date;
/**
 *
 * @author Ulrich
 */
public class Reserva {

   int id_reserva;
   Date fecha_uso;
   String hora_uso;
   String rut;
   int id_mesa;
    
    public Reserva(int id_reserva, Date fecha_uso, String hora_uso, String rut, int id_mesa) {
        this.id_reserva = id_reserva;
        this.fecha_uso = fecha_uso;
        this.hora_uso = hora_uso;
        this.rut = rut;
        this.id_mesa = id_mesa;
    }
  
    public Reserva(){
        
    }
   
    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public Date getFecha_uso() {
        return fecha_uso;
    }

    public void setFecha_uso(Date fecha_uso) {
        this.fecha_uso = fecha_uso;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public int getId_mesa() {
        return id_mesa;
    }

    public void setId_mesa(int id_mesa) {
        this.id_mesa = id_mesa;
    }
    public String getHora_uso() {
        return hora_uso;
    }

    public void setHora_uso(String hora_uso) {
        this.hora_uso = hora_uso;
    }
  
   
  
   
   
   
   
   
   
   
   
}
