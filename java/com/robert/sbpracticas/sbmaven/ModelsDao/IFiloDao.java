package com.robert.sbpracticas.sbmaven.ModelsDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.robert.sbpracticas.sbmaven.Models.Filo;


public interface IFiloDao { // la interfaz no incluye el nivel de especie
    public void Insertar(Connection conn, Filo filo, Integer id);

    public void Desabilitar(Connection conn, Integer id);
    
    public ArrayList<Filo> Mostrar(Connection conn);

    public void ColocarSuperior(Filo filo, Filo filo2);

    public int obtenerIDporNombre(Connection conn, String nombre) throws SQLException;

}
