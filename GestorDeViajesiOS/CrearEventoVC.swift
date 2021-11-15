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
    
    
    @IBOutlet weak var fechaFinalTextField: UITextField!
    
    @IBOutlet weak var presupuestoTextField: UITextField!
    
    @IBOutlet weak var ubicacionTextField: UITextField!
    
    let tipo = ["Viaje", "Salida", "Cita"]
    
    var pickerView = UIPickerView()
    
    let datePickerInicio = UIDatePicker()

    let datePickerFinal = UIDatePicker()
    
    
    
    @IBAction func crearEventoBoton(_ sender: Any) {
    
        
        
    }
    
    func createDatePickerInicio()  {
        if #available(iOS 13.4, *){
            datePickerInicio.preferredDatePickerStyle = .wheels
        }
        fechaInicioTextField.textAlignment = .center
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedInicio))
        doneBtn.title = "Confirmar"
        toolbar.setItems([doneBtn], animated: true)
        
        fechaInicioTextField.inputAccessoryView = toolbar
        
        fechaInicioTextField.inputView = datePickerInicio
        
        datePickerInicio.datePickerMode = .date
        
        
    }
    
    func createDatePickerFin(){
        
        if #available(iOS 13.4, *){
            datePickerFinal.preferredDatePickerStyle = .wheels
        }
        fechaFinalTextField.textAlignment = .center
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
        tipoTextField.textAlignment = .center
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
