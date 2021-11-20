//
//  InfoEventoVC.swift
//  GestorDeViajesiOS
//
//  Created by user198164 on 11/20/21.
//

import UIKit

class InfoEventoVC: UIViewController {

    var nombreEvento:String = "Sin nombre"


    @IBOutlet weak var lbFecha: UILabel!
    


    @IBOutlet weak var lbPresupuesto: UILabel!
    

    @IBOutlet weak var lbRestantes: UILabel!
    
    var arrObjetos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = nombreEvento
        
        if nombreEvento == "Camping"{
            lbFecha.text="26 de agosto al 30 agosto 2021"
            lbRestantes.text="Progreso: 3/4"
            lbPresupuesto.text="$6000"
            arrObjetos=["Casa acampar - Zabdiel  - Listo","Lampara - Luis - No listo","Agua - Alan - Listo"]
        }
        else if nombreEvento == "Cita"{
            lbFecha.text="24 de Octubre al 25 Octubre 2021"
            lbRestantes.text="Progreso: 1/2"
            lbPresupuesto.text="$1000"
            arrObjetos=["Chicles - Luis  - Listo","Chocolates - Ari - No listo"]
        }
        else if nombreEvento == "Antro"{
            lbFecha.text="23 de Noviembre al 25 Noviembre 2021"
            lbRestantes.text="Progreso: 1/2"
            lbPresupuesto.text="$1500"
            arrObjetos=["Cerveza - Luis  - Listo","Globos - Alan - No listo"]
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension InfoEventoVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrObjetos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier:"objetoId", for: indexPath)
        
        //poner un texto
        celda.textLabel?.text=arrObjetos[indexPath.row]
        return celda
    }
    
 
    
}
