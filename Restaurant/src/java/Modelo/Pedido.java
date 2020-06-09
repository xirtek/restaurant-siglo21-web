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
public class Pedido {
    
    private int id_pedido;
    private String estado;
    private String nombre_cliente;
    private int precio,id_mesa, id_orden;

    public Pedido() {
    }

    public Pedido(int id_pedido, String estado, String nombre_cliente, int precio, int id_mesa, int id_orden) {
        this.id_pedido = id_pedido;
        this.estado = estado;
        this.nombre_cliente = nombre_cliente;
        this.precio = precio;
        this.id_mesa = id_mesa;
        this.id_orden = id_orden;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getId_mesa() {
        return id_mesa;
    }

    public void setId_mesa(int id_mesa) {
        this.id_mesa = id_mesa;
    }

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }
    
    
}
