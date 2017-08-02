//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Владимир Рыбалка on 02/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var singlePicker: UIPickerView!
    private let characterNames = ["Владимир", "Елена", "Лариса", "Валерий", "Игорь", "Ольга", "Артур"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let row = singlePicker.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        let title = "Вы выбрали \(selected)!"
        
        let alert = UIAlertController(title: title, message: "Спасибо за выбор!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Спасибо за выбор", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Picker data source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }

}
