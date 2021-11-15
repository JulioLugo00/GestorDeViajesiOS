//
//  ViewController.swift
//  GestorDeViajesiOS
//
//  Created by Julio on 14/11/21.
//

import UIKit

class ViewController: UIViewController {
    var evento = Evento(nombre: "", tipo: "", fechaInicio: "", fechaFin: "", presupuesto: 0, ubicacion: "")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(evento.nombre)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func volverAInicio(segue:UIStoryboardSegue!){
        print(evento.nombre)
    }


}

