package com.robert.sbpracticas.sbmaven.Models;

import java.util.ArrayList;

public class Especies extends Filo{
    private String genero, familia, superfamilia, infraorden, suborden, orden, superorden, alimentacion, epoca;
    private ArrayList<String> ubicaciones = new ArrayList<>();

    public void AddUbicacion(String ubid) {
        this.ubicaciones.add(ubid);
    }
        //G & S 

    
    public ArrayList<String> getUbicaciones() {
        return ubicaciones;
    }
    public void setUbicaciones(ArrayList<String> ubicaciones) {
        this.ubicaciones = ubicaciones;
    }
    public String getGenero() {
        return genero;
    }
    public void setGenero(String genero) {
        this.genero = genero;
    }
    public String getFamilia() {
        return familia;
    }
    public void setFamilia(String familia) {
        this.familia = familia;
    }
    public String getSuperfamilia() {
        return superfamilia;
    }
    public void setSuperfamilia(String superfamilia) {
        this.superfamilia = superfamilia;
    }
    public String getInfraorden() {
        return infraorden;
    }
    public void setInfraorden(String infraorden) {
        this.infraorden = infraorden;
    }
    public String getSuborden() {
        return suborden;
    }
    public void setSuborden(String suborden) {
        this.suborden = suborden;
    }
    public String getOrden() {
        return orden;
    }
    public void setOrden(String orden) {
        this.orden = orden;
    }
    public String getSuperorden() {
        return superorden;
    }
    public void setSuperorden(String superorden) {
        this.superorden = superorden;
    }
    public String getAlimentacion() {
        return alimentacion;
    }
    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }
    public String getEpoca() {
        return epoca;
    }
    public void setEpoca(String epoca) {
        this.epoca = epoca;
    }
}
