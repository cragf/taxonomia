package com.robert.sbpracticas.sbmaven.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.robert.sbpracticas.sbmaven.Models.Empleados;

import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/api")


public class EjRestContr {
    @GetMapping(path = "/detalles_info2")
    
    public Map<String, Object> detalles_info2() {    
        Empleados empleado = new Empleados("Juan", "de Austria", "calle munición", "general", 28, 000111); 

        Map<String, Object> model = new HashMap<>();
        model.put("Empleado", empleado);

        System.out.println("Ejecutando el controlador de detalles_info2");
        return model;
    }
}
