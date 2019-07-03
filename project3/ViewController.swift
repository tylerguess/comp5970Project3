//
//  ViewController.swift
//  project3
//
//  Created by Tyler Guess on 7/3/19.
//  Copyright © 2019 Tyler Guess. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var strings = ["Thing 1", "Thing 2", "Thing 3"]
    var currentValue = "Thing 1"
    var currentRow = 0
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        textField.delegate = self
    }
    
    @IBAction func selectPressed(_ sender: Any) {
        let alert = UIAlertController(title: strings[currentRow], message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func replacePressed(_ sender: Any) {
        strings[currentRow] = textField.text ?? strings[currentRow]
        picker.reloadComponent(0)
    }
    
    @IBAction func insert(Pressed_ sender: Any) {
        strings.insert(textField.text ?? strings[currentRow], at: currentRow + 1)
        picker.reloadComponent(0)
        currentRow += 1
        picker.selectRow(currentRow, inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return strings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return strings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentValue = strings[row]
        currentRow = row
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

