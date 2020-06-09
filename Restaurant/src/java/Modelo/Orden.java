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
public class Orden {

    private int id_orden, id_pedido, precio_total, id_bebestible, id_postre, id_plato;
    private String estado;

    public Orden() {
    }

    public Orden(int id_orden, int id_pedido, int precio_total, int id_bebestible, int id_postre, int id_plato, String estado) {
        this.id_orden = id_orden;
        this.id_pedido = id_pedido;
        this.precio_total = precio_total;
        this.id_bebestible = id_bebestible;
        this.id_postre = id_postre;
        this.id_plato = id_plato;
        this.estado = estado;
    }

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(int precio_total) {
        this.precio_total = precio_total;
    }

    public int getId_bebestible() {
        return id_bebestible;
    }

    public void setId_bebestible(int id_bebestible) {
        this.id_bebestible = id_bebestible;
    }

    public int getId_postre() {
        return id_postre;
    }

    public void setId_postre(int id_postre) {
        this.id_postre = id_postre;
    }

    public int getId_plato() {
        return id_plato;
    }

    public void setId_plato(int id_plato) {
        this.id_plato = id_plato;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
