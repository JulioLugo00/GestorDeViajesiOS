//
//  ViewController.swift
//  GestorDeViajesiOS
//
//  Created by Julio on 14/11/21.
//
import MapKit
import UIKit

class ViewController: UIViewController {
    var evento = Evento(nombre: "", tipo: "", fechaInicio: "", fechaFin: "", presupuesto: 0, ubicacion: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        print(evento.nombre)
        
    }
    @IBAction func volverAInicio(segue:UIStoryboardSegue!){
        print(evento.nombre)
    }


}

