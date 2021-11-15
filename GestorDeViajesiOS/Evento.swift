//
//  Evento.swift
//  GestorDeViajesiOS
//
//  Created by Julio on 14/11/21.
//

import Foundation

class Evento{
    var nombre: String
    var tipo: String
    var fechaInicio: String
    var fechaFin: String
    var presupuesto: Int
    var ubicacion: String
    
    // Constructor
    init(nombre: String, tipo: String, fechaInicio: String, fechaFin: String, presupuesto: Int, ubicacion: String){
        self.nombre = nombre
        self.tipo = tipo
        self.fechaInicio = fechaInicio
        self.fechaFin = fechaFin
        self.presupuesto = presupuesto
        self.ubicacion = ubicacion
       
    }
    
    
    
    
}
