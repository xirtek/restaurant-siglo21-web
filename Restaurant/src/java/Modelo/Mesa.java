/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Raul
 */
public class Mesa {
    
    int id_mesa, cant_sillas;
    char disponibilidad;
    String tipo;

    public Mesa() {
    }

    public Mesa(int id_mesa, int cant_sillas, char disponibilidad, String tipo) {
        this.id_mesa = id_mesa;
        this.cant_sillas = cant_sillas;
        this.disponibilidad = disponibilidad;
        this.tipo = tipo;
    }

    public int getId_mesa() {
        return id_mesa;
    }

    public void setId_mesa(int id_mesa) {
        this.id_mesa = id_mesa;
    }

    public int getCant_sillas() {
        return cant_sillas;
    }

    public void setCant_sillas(int cant_sillas) {
        this.cant_sillas = cant_sillas;
    }

    public char getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(char disponibilidad) {
        this.disponibilidad = disponibilidad;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
}
