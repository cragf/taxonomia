package com.robert.sbpracticas.sbmaven.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.robert.sbpracticas.sbmaven.Models.Empleados;


@Controller
public class EjCont {

    @GetMapping("/detalles_info")
    

    public String info(Model model) {
        Empleados empleado = new Empleados("Juan", "de Austria", "calle munición", "general", 28, 000111); 
        model.addAttribute("Empleado", empleado);

        System.out.println("Ejecutando el controlador de detalles_info");
        return "detalles_info";
    }
}
