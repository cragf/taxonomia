package com.robert.sbpracticas.sbmaven.controllers;

import java.sql.Connection;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.robert.sbpracticas.sbmaven.Models.Especies;
import com.robert.sbpracticas.sbmaven.ModelsDao.EspecieDao;
import com.robert.sbpracticas.sbmaven.conection.ConectionDB;


@RestController
@RequestMapping("/api")
public class DinoRestController {
    @GetMapping(path = "/taxonomia_rest")
    public ArrayList<Especies> taxonomia_rest() {
        EspecieDao ed = new EspecieDao();
        try (Connection conn = ConectionDB.Getconexion().Conectar()) {
            @SuppressWarnings("unchecked")
            ArrayList<Especies> lEspecies = ed.Mostrar(conn);
            for (Especies e : lEspecies) {
                if (e.getFamilia().contains("i.e")) {
                    e.setFamilia("Basal");
                }
                if (e.getSuperfamilia().contains("i.e")) {
                    e.setSuperfamilia("Basal");
                }
                if (e.getInfraorden().contains("i.e")) {
                    e.setInfraorden("Basal");
                }
                if (e.getSuborden().contains("i.e")) {
                    e.setSuborden("Basal");
                }
            }
            return lEspecies;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
}
