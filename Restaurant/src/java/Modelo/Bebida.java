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
public class Bebida {
    
    int id_bebestible, stock,precio_unitario;
    String descripcion;

    public Bebida() {
    }

    public Bebida(int id_bebestible, int stock, int precio_unitario, String descripcion) {
        this.id_bebestible = id_bebestible;
        this.stock = stock;
        this.precio_unitario = precio_unitario;
        this.descripcion = descripcion;
    }

    public int getId_bebestible() {
        return id_bebestible;
    }

    public void setId_bebestible(int id_bebestible) {
        this.id_bebestible = id_bebestible;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(int precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
