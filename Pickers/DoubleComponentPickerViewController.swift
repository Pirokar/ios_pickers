//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by Владимир Рыбалка on 02/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = ["Ham", "Turkey", "Peanut Butter", "Tina Salad", "Chicked Salad", "Roast Beef", "Vegemite"]
    private let breadTypes = ["White", "Whole Wheat", "Rye", "Sourdough", "Seven Grain"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "Your \(filling) on \(bread) will be right up."
        
        let alert = UIAlertController(title: "Спасибо за выбор!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Отлично!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    // MARK: Picker data source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == fillingComponent) {
            return fillingTypes.count
        } else {
            return breadTypes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == fillingComponent) {
            return fillingTypes[row]
        } else {
            return breadTypes[row]
        }
    }
}
