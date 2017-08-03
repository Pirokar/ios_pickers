//
//  CutomPickerViewController.swift
//  Pickers
//
//  Created by Владимир Рыбалка on 02/08/2017.
//  Copyright © 2017 Vladimir Rybalka. All rights reserved.
//

import UIKit
import AudioToolbox

class CutomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    private var images: [UIImage]!
    private var winSoundID: SystemSoundID = 0
    private var crunchSoundID: SystemSoundID = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        winLabel.text = " "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showButton() {
        button.isHidden = false
    }
    
    func playWinSound() {
        if(winSoundID == 0) {
            let soundPath = Bundle.main.url(forResource: "win", withExtension: "wav")
            AudioServicesCreateSystemSoundID(soundPath! as CFURL, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        winLabel.text = "ПОБЕДИТЕЛЬ!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.showButton()
        }
    }

    @IBAction func spin(_ sender: Any) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            if(crunchSoundID == 0) {
                let soundPath = Bundle.main.url(forResource: "crunch", withExtension: "wav")
                AudioServicesCreateSystemSoundID(soundPath! as CFURL, &crunchSoundID)
            }
            AudioServicesPlaySystemSound(crunchSoundID)
            
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if (newValue == lastVal) {
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if(numInRow >= 3) {
                win = true
            }
        }
        
        if(win) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.playWinSound()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showButton()
            }
        }
        button.isHidden = true
        winLabel.text = " "
    }
    
    // MARK: Picker data source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    // MARK: Picker delegate methods
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }

}
