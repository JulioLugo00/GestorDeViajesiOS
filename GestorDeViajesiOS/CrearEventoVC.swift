//
//  CrearEventoVC.swift
//  GestorDeViajesiOS
//
//  Created by Julio on 14/11/21.
//

import UIKit

class CrearEventoVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipo.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipo[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipoTextField.text = tipo[row]
        tipoTextField.resignFirstResponder()
    }

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var tipoTextField: UITextField!
    

    @IBOutlet weak var fechaInicioTextField: UITextField!
    
    var evento = Evento(nombre: "Evento Generico", tipo: "Salida", fechaInicio: "Nov 15, 2021", fechaFin: "Nov 15, 2021", presupuesto: 2000, ubicacion: "Coacalco")
    
    @IBOutlet weak var fechaFinalTextField: UITextField!
    
    @IBOutlet weak var presupuestoTextField: UITextField!
    
    @IBOutlet weak var ubicacionTextField: UITextField!
    
    let tipo = ["Viaje", "Salida", "Cita"]
    
    var pickerView = UIPickerView()
    
    let datePickerInicio = UIDatePicker()

    let datePickerFinal = UIDatePicker()
    
    
    
    @IBAction func crearEventoBoton(_ sender: Any) {
        if(nombreTextField.text != "" && tipoTextField.text != "" && fechaFinalTextField.text != "" && fechaFinalTextField.text != "" && presupuestoTextField.text != "" && ubicacionTextField.text != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            let fechaInicio = dateFormatter.date(from: fechaInicioTextField.text!)
            let fechaFin = dateFormatter.date(from: fechaFinalTextField.text!)
            if(fechaFin! < fechaInicio!){
                //Cuadro de dialogo
                let alerta = UIAlertController(title: "Aviso", message: "La fecha de inicio es mayor a la fecha final", preferredStyle: .alert)
                //Botón
                let aceptar = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
                alerta.addAction(aceptar)
                present(alerta, animated: true)
            }
            else{
                //Cuadro de dialogo
                //let alerta = UIAlertController(title: "Completado", message: "Evento creado", preferredStyle: .alert)
                //Botón
                //let aceptar = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
                //alerta.addAction(aceptar)
                //present(alerta, animated: true)
                evento = Evento(nombre: nombreTextField.text!, tipo: tipoTextField.text!, fechaInicio: fechaInicioTextField.text!, fechaFin: fechaFinalTextField.text!, presupuesto: Int(presupuestoTextField.text!)!, ubicacion: ubicacionTextField.text!)
               
            }
            
        }
        else{
            //Cuadro de dialogo
            let alerta = UIAlertController(title: "Aviso", message: "Introducir todos los datos", preferredStyle: .alert)
            //Botón
            let aceptar = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alerta.addAction(aceptar)
            present(alerta, animated: true)
        }
        
        
    }
    
    func createDatePickerInicio()  {
        if #available(iOS 13.4, *){
            datePickerInicio.preferredDatePickerStyle = .wheels
        }
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedInicio))
        doneBtn.title = "Confirmar"
        toolbar.setItems([doneBtn], animated: true)
        
        fechaInicioTextField.inputAccessoryView = toolbar
        
        fechaInicioTextField.inputView = datePickerInicio
        
        datePickerInicio.datePickerMode = .date
        
        
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if evento != nil {
            let vc = segue.destination as! ViewController
            vc.evento = evento
        }
    
    }
    
    func createDatePickerFin(){
        
        if #available(iOS 13.4, *){
            datePickerFinal.preferredDatePickerStyle = .wheels
        }
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedFin))
        doneBtn.title = "Confirmar"
        toolbar.setItems([doneBtn], animated: true)
        
        fechaFinalTextField.inputAccessoryView = toolbar
        
        fechaFinalTextField.inputView = datePickerFinal
        
        datePickerFinal.datePickerMode = .date
    }
    
    @objc func donePressedFin(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        fechaFinalTextField.text = formatter.string(from: datePickerFinal.date)
        self.view.endEditing(true)
    }
    
    @objc func donePressedInicio(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        fechaInicioTextField.text = formatter.string(from: datePickerInicio.date)
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        tipoTextField.inputView = pickerView
        tipoTextField.placeholder = "Escoger tipo de evento"
        
        
        createDatePickerFin()
        createDatePickerInicio()

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
