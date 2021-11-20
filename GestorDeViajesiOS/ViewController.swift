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
    
    var arrEventos = ["Camping","Cita","Antro"]
    
    @IBOutlet weak var tablaEventos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //(evento.nombre)
        
        
    }
    @IBAction func volverAInicio(segue:UIStoryboardSegue!){
        print(evento.nombre)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue: el destino
       //posicion del renglon
        let indexPath = tablaEventos.indexPathForSelectedRow
        let indice = indexPath?.row
        
        if indice != nil {
            let nombre = arrEventos[indice!]
            //se hace un cast de clase padre a hijo
            let vc = segue.destination as! InfoEventoVC
            vc.nombreEvento=nombre
        }
        
    }

}




extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier:"celdaEvento", for: indexPath)
        
        //poner un texto
        celda.textLabel?.text=arrEventos[indexPath.row]
        return celda
    }
    
 
    
}

