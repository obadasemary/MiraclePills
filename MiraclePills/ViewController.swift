//
//  ViewController.swift
//  MiraclePills
//
//  Created by Abdelrahman Mohamed on 1/4/17.
//  Copyright © 2017 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    
    let states = ["Istanbul", "Ankara", "Izmir", "Bursa", "Konya", "Antalya"]
    var state = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    @IBOutlet weak var successImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.statePicker.dataSource = self
        self.statePicker.delegate = self
    }
    
    @IBAction func stateButtonPressed(_ sender: Any) {
        
        statePicker.isHidden = false
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        state = states[row]
        statePicker.isHidden = true
    }
    
    @IBAction func buyButton(_ sender: Any) {
        
        guard !state.isEmpty else {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because you must choose state. Please note state field is required.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        guard let nameText = nameTextField.text, let streetText = streetTextField.text, let cityText = cityTextField.text, let zipText = zipTextField.text, !nameText.isEmpty, !streetText.isEmpty, !cityText.isEmpty, !zipText.isEmpty else {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        successImageView.isHidden = false
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTextField.resignFirstResponder()
        streetTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        zipTextField.resignFirstResponder()
        
        return false
    }

}

