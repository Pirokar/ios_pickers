//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Владимир Рыбалка on 02/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date: Date = NSDate() as Date
        datePicker.setDate(date, animated: false)
        datePicker.locale = NSLocale(localeIdentifier: "ru_RU") as Locale!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonPressed(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy hh:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "ru_RU") as Locale!
        
        let date = dateFormatter.string(from: datePicker.date)
        let message = "Дата и время, что вы выбрали: \(date)"
        
        let alert = UIAlertController(title: "Выбранные дата и время", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Это правда!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
