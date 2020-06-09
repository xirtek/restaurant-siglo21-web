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
public class Perfil {
    int id_perfil;
    String nombre_perfil;
    String descripcion_perfil;

    public Perfil() {
    }

    public Perfil(int id_perfil, String nombre_perfil, String descripcion_perfil) {
        this.id_perfil = id_perfil;
        this.nombre_perfil = nombre_perfil;
        this.descripcion_perfil = descripcion_perfil;
    }

    public int getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public String getNombre_perfil() {
        return nombre_perfil;
    }

    public void setNombre_perfil(String nombre_perfil) {
        this.nombre_perfil = nombre_perfil;
    }

    public String getDescripcion_perfil() {
        return descripcion_perfil;
    }

    public void setDescripcion_perfil(String descripcion_perfil) {
        this.descripcion_perfil = descripcion_perfil;
    }
    

    
}
