package com.robert.sbpracticas.sbmaven.ModelsDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.robert.sbpracticas.sbmaven.Models.Especies;


public class EspecieDao{  // el nivel de especie se maneja diferente
    @SuppressWarnings({ "rawtypes" })
    public ArrayList Mostrar (Connection conn){

        String consulta = "SELECT\r\n" + //
                        "es.IDespecies,\r\n" + //
                        "ge.genero,\r\n" + //
                        "es.nombre,\r\n" + //
                        "fa.familia,\r\n" + //
                        "sf.superfamilia,\r\n" + //
                        "ino.infraorden,\r\n" + //
                        "so.suborden,\r\n" + //
                        "oo.orden,\r\n" + //
                        "spo.superorden,\r\n" + //
                        "er.`era geologica`,\r\n" + //
                        "di.dieta,\r\n" + //
                        "ub.ubicacion,\r\n" + //
                        "ub.especie\r\n" + //
                        "FROM\r\n" + //
                        "especies es\r\n" + //
                        "LEFT JOIN generos ge on ge.IDgeneros = es.genero\r\n" + //
                        "LEFT JOIN familia fa on fa.IDfamilia = ge.familia\r\n" + //
                        "LEFT JOIN superfamilia sf on fa.superfamilia = sf.IDsuperfamilia\r\n" + //
                        "LEFT JOIN infraorden ino on sf.infraorden = ino.IDinfraorden\r\n" + //
                        "LEFT JOIN suborden so on ino.suborden = so.IDsuborden\r\n" + //
                        "LEFT JOIN orden oo on so.orden = oo.IDorden\r\n" + //
                        "LEFT JOIN superorden spo on oo.superorden = spo.IDsuperorden\r\n" + //
                        "LEFT JOIN eras er on es.`era geologica` = er.IDeras\r\n" + //
                        "LEFT JOIN ubicaciones ub on ub.especie = es.`IDespecies`\r\n" + //
                        "LEFT JOIN dieta di on es.alimentacio = di.IDdieta Where es.habilitado = 1 ORDER BY suborden, infraorden, superfamilia, familia, genero, nombre";

        ArrayList<Especies> especies = new ArrayList<>();
        Map<String, Especies> especiesMap = new HashMap<>();
        try(PreparedStatement ps = conn.prepareStatement(consulta); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String esid = rs.getString("es.IDespecies");

                Especies es = especiesMap.get(esid);
                if (es == null) {
                    es = new Especies();
                    es.setId(String.valueOf(rs.getInt("es.idespecies")));
                    es.setAlimentacion(rs.getString("di.dieta"));
                    es.setEpoca(rs.getString("er.era geologica"));
                    es.setGenero(rs.getString("ge.genero"));   
                    es.setNombre(rs.getString("es.nombre"));
                    es.setFamilia(rs.getString("fa.familia"));
                    es.setSuperfamilia(rs.getString("sf.superfamilia"));
                    es.setInfraorden(rs.getString("ino.infraorden"));
                    es.setSuborden(rs.getString("so.suborden"));
                    es.setOrden(rs.getString("oo.orden"));
                    es.setSuperorden(rs.getString("spo.superorden"));
                    especies.add(es);
                    especiesMap.put(esid, es);
                    
                }
                
                
                String ubi = rs.getString("ub.ubicacion");

                if (ubi != null) {
                    es.AddUbicacion(ubi);
                }

            }

            

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }

        return especies;
    }
    
    public void Insertar(Connection conn, Especies filo, Integer id){
        String consulta = "INSERT INTO especies (nombre,genero,alimentacio,`era geologica`,habilitado) Values (?,?,?,?,?)";

        try(PreparedStatement ps = conn.prepareStatement(consulta)){
            ps.setString(1, filo.getNombre());
            ps.setInt(2, id);            
            ps.setInt(3, Integer.parseInt(filo.getAlimentacion()));
            ps.setInt(4, Integer.parseInt(filo.getEpoca()));
            ps.setInt(5, 1);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
    }
    public int obtenerIDporNombre(Connection conn, String nombre) throws SQLException {
        String sql = "SELECT IDespecies FROM especies WHERE nombre = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, nombre);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("IDespecies");
                } else {
                    return -1; // No encontrado
                }
            }
        }
    }
    public void Desabilitar(Connection conn, Integer id) {
        String consulta = "UPDATE especies SET habilitado = 0 WHERE idespecies = ?";

        try(PreparedStatement ps = conn.prepareStatement(consulta)){
            ps.setInt(1, id);
            int filasAfectadas = ps.executeUpdate();
            ps.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("Especie deshabilitada correctamente.");
            } else {
                System.out.println("No se encontró ninguna especie con ese ID.");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
    }
}
