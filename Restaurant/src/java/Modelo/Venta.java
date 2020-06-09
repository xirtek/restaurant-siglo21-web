/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Date;


/**
 *
 * @author Raul
 */
public class Venta {
    
    int id_venta, total_pagar, id_pedido, id_trabajador;
    String detalle_pago, nombre_cliente, metodo_pago;
    Date fecha_venta;

    public Venta() {
    }

    public Venta(int id_venta, int total_pagar, int id_pedido, int id_trabajador, String detalle_pago, String nombre_cliente, String metodo_pago, Date fecha_venta) {
        this.id_venta = id_venta;
        this.total_pagar = total_pagar;
        this.id_pedido = id_pedido;
        this.id_trabajador = id_trabajador;
        this.detalle_pago = detalle_pago;
        this.nombre_cliente = nombre_cliente;
        this.metodo_pago = metodo_pago;
        this.fecha_venta = fecha_venta;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getTotal_pagar() {
        return total_pagar;
    }

    public void setTotal_pagar(int total_pagar) {
        this.total_pagar = total_pagar;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(int id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getDetalle_pago() {
        return detalle_pago;
    }

    public void setDetalle_pago(String detalle_pago) {
        this.detalle_pago = detalle_pago;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public String getMetodo_pago() {
        return metodo_pago;
    }

    public void setMetodo_pago(String metodo_pago) {
        this.metodo_pago = metodo_pago;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }
    
    
}
