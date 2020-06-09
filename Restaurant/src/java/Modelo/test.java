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
public class test {

    TrabajadorBO tbo = new TrabajadorBO();
    Trabajador tra = new Trabajador();

    OrdenBO obo = new OrdenBO();
    Orden ord = new Orden();
    PedidoBO pebo = new PedidoBO();
    Pedido ped = new Pedido();

    PerfilBO pbo = new PerfilBO();
    Perfil per = new Perfil();

    UsuarioBO Ubo = new UsuarioBO();
    Usuario usu = new Usuario();

    VentaBO vent = new VentaBO();
    Venta ven = new Venta();

    String mensaje = "";
    Date fecha = new Date(10 / 10 / 1997);

    public void insertar() {
        tra.setRut_trabajador("123");
        tra.setPrimer_nombre("raull");
        tra.setSegundo_nombre("ignacioo");
        tra.setApell_paterno("herreraa");
        tra.setApell_materno("fernandezz");
        tra.setFecha_nacimiento(fecha);
        tra.setSexo('H');
        tra.setDireccion("aaa");
        tra.setNro_direccion(123);
        tra.setCiudad("eee");
        tra.setCargo("jefesito");
        tra.setCorreo_contacto("raull@gmail.com");
        tra.setSueldo(100000);

        mensaje = tbo.agregarTrabajador(tra);
        System.out.println(mensaje);

        per.setNombre_perfil("asdasdasdasdas");
        per.setDescripcion_perfil("123");
        mensaje = pbo.agregarPerfil(per);
        System.out.println(mensaje);

        usu.setNombre("rau");
        usu.setPw("123");

        mensaje = Ubo.agregarUsuario(usu);
        System.out.println(mensaje);

    }

    public void agregarOrden() {

        ord.setPrecio_total(1);
        ord.setId_pedido(1);
        ord.setId_bebestible(1);
        ord.setId_postre(1);
        ord.setId_plato(1);
        ord.setEstado("listo");
        mensaje = obo.agregarOrden(ord);
        System.out.println(mensaje);
    }

    public void agregarPedido() {

        ped.setId_mesa(1);
        ped.setPrecio(1);
        ped.setNombre_cliente("raulxd");

        mensaje = pebo.agrregarPedido(ped);
        System.out.println(mensaje);
    }

    public void agregarVenta() {
        Date fecha = new Date(10 / 10 / 1997);
        ven.setFecha_venta(fecha);
        ven.setNombre_cliente("as");
        ven.setTotal_pagar(2);
        ven.setDetalle_pago("sda");
        ven.setMetodo_pago("as");
        ven.setId_pedido(222);
        ven.setId_trabajador(222);

        vent.agregarVenta(ven);

        mensaje = vent.agregarVenta(ven);
        System.out.println(mensaje);
    }

    public void ModificarMesa() {
        MesaBO mbo = new MesaBO();
        Mesa me = new Mesa();
        me.setId_mesa(1);
        me.setDisponibilidad('n');
        mbo.modificarMesa(3, 'n');
        mensaje = mbo.modificarMesa(1, 'n');
        System.out.println(mensaje);
    }

    public static void main(String[] args) {
        test est = new test();
        est.ModificarMesa();
    }
}
