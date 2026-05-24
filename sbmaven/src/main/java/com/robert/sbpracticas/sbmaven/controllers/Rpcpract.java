package com.robert.sbpracticas.sbmaven.controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.robert.sbpracticas.sbmaven.Models.dto.Especies;

@RestController
@RequestMapping("/api/param")
public class Rpcpract {

    @GetMapping("/saludo")
    public Especies Saludo(@RequestParam (defaultValue = "vacio") String nombre) {
        Especies especie = new Especies();
        especie.setGenero(nombre);

        System.out.println("Ejecutando el controlador de saludo");
        return especie;
    }
}
