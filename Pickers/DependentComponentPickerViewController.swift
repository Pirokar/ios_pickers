//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Владимир Рыбалка on 02/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dependentPicker: UIPickerView!
    private let stateComponent = 0
    private let zipComponent = 1
    private var statesZips: [String : [String]]!
    private var states: [String]!
    private var currentZips: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bundlePath = Bundle.main.path(forResource: "statedictionary", ofType: "plist")
        statesZips = NSDictionary(contentsOfFile: bundlePath!) as! [String : [String]]
        let allStates = statesZips.keys
        states = allStates.sorted()
            
        let selectedState = states[0]
        currentZips = statesZips[selectedState]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let stateRowIdx = dependentPicker.selectedRow(inComponent: stateComponent)
        let zipRowIdx = dependentPicker.selectedRow(inComponent: zipComponent)
        
        let stateStr = states[stateRowIdx]
        let zipStr = currentZips[zipRowIdx]
        
        let title = "Вы выбрали почтовый индекс: \"\(zipStr)\""
        let message = "\(zipStr) - это индекс штата \(stateStr)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Я тя понял", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Picker data source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == stateComponent) {
            return states.count
        } else {
            return currentZips.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == stateComponent) {
            return states[row]
        } else {
            return currentZips[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == stateComponent) {
            let selectedState = states[row]
            currentZips = statesZips[selectedState]
            dependentPicker.reloadComponent(zipComponent)
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if(component == zipComponent) {
            return pickerWidth / 3
        } else {
            return 2 * pickerWidth / 3
        }
    }

}
