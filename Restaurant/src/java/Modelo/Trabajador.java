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
public class Trabajador {

    int id_trabajador;
    String rut_trabajador, primer_nombre, segundo_nombre, apell_paterno, apell_materno;
    Date fecha_nacimiento;
    char sexo;
    String direccion;
    int nro_direccion;
    String ciudad,cargo;
    int telefono;
    String correo_contacto;
    int sueldo;

    public Trabajador() {
    }

    public Trabajador(int id_trabajador, String rut_trabajador, String primer_nombre, String segundo_nombre, String apell_paterno, String apell_materno, Date fecha_nacimiento, char sexo, String direccion, int nro_direccion, String ciudad, String cargo, int telefono, String correo_contacto, int sueldo) {
        this.id_trabajador = id_trabajador;
        this.rut_trabajador = rut_trabajador;
        this.primer_nombre = primer_nombre;
        this.segundo_nombre = segundo_nombre;
        this.apell_paterno = apell_paterno;
        this.apell_materno = apell_materno;
        this.fecha_nacimiento = fecha_nacimiento;
        this.sexo = sexo;
        this.direccion = direccion;
        this.nro_direccion = nro_direccion;
        this.ciudad = ciudad;
        this.cargo = cargo;
        this.telefono = telefono;
        this.correo_contacto = correo_contacto;
        this.sueldo = sueldo;
    }

    public int getId_trabajador() {
        return id_trabajador;
    }

    public void setId_trabajador(int id_trabajador) {
        this.id_trabajador = id_trabajador;
    }

    public String getRut_trabajador() {
        return rut_trabajador;
    }

    public void setRut_trabajador(String rut_trabajador) {
        this.rut_trabajador = rut_trabajador;
    }

    public String getPrimer_nombre() {
        return primer_nombre;
    }

    public void setPrimer_nombre(String primer_nombre) {
        this.primer_nombre = primer_nombre;
    }

    public String getSegundo_nombre() {
        return segundo_nombre;
    }

    public void setSegundo_nombre(String segundo_nombre) {
        this.segundo_nombre = segundo_nombre;
    }

    public String getApell_paterno() {
        return apell_paterno;
    }

    public void setApell_paterno(String apell_paterno) {
        this.apell_paterno = apell_paterno;
    }

    public String getApell_materno() {
        return apell_materno;
    }

    public void setApell_materno(String apell_materno) {
        this.apell_materno = apell_materno;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNro_direccion() {
        return nro_direccion;
    }

    public void setNro_direccion(int nro_direccion) {
        this.nro_direccion = nro_direccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo_contacto() {
        return correo_contacto;
    }

    public void setCorreo_contacto(String correo_contacto) {
        this.correo_contacto = correo_contacto;
    }

    public int getSueldo() {
        return sueldo;
    }

    public void setSueldo(int sueldo) {
        this.sueldo = sueldo;
    }
    
    
    
}
