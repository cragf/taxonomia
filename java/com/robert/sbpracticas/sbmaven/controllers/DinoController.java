package com.robert.sbpracticas.sbmaven.controllers;

import java.sql.Connection;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.robert.sbpracticas.sbmaven.Models.Especies;
import com.robert.sbpracticas.sbmaven.ModelsDao.EspecieDao;
import com.robert.sbpracticas.sbmaven.conection.ConectionDB;

@Controller
public class DinoController {

    @GetMapping("/taxonomia")
    public String info(Model model) {

        EspecieDao ed = new EspecieDao();
        try (Connection conn = ConectionDB.Getconexion().Conectar()) {
            @SuppressWarnings("unchecked")
            ArrayList<Especies> lEspecies = ed.Mostrar(conn);
            for (Especies e : lEspecies) {
                if (e.getFamilia().contains("i.a")) {
                    e.setFamilia("-");
                }
                if (e.getSuperfamilia().contains("i.a")) {
                    e.setSuperfamilia("-");
                }
                if (e.getInfraorden().contains("i.a")) {
                    e.setInfraorden("-");
                }
                if (e.getSuborden().contains("i.a")) {
                    e.setSuborden("-");
                }
                System.out.println(e.getUbicaciones());
                System.out.println(e.getAlimentacion());
            }
            
            model.addAttribute("especies", lEspecies);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Ejecutando el controlador de taxonomia");
        return "taxonomia";
    }
}
