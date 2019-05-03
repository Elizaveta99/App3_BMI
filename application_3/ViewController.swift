//
//  ViewController.swift
//  application_3
//
//  Created by Lizaveta Rudzko on 2/13/1398 AP.
//  Copyright © 1398 Lizaveta Rudzko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var trainingSegmentedControl: UISegmentedControl!
    
    @IBAction func calculateTapped(_ sender: Any) {
        var calories : Double
        let height = Double(heightTextField.text!)!
        let weight = Double(weightTextField.text!)!
        let age = Double(ageTextField.text!)!
        
        if sexSegmentedControl.selectedSegmentIndex == 0 {
            calories = 88.362 + 13.397 * weight + 4.799 * height - 5.677 * age
        }
        else {
            calories = 447.593 + 9.247 * weight + 3.098 * height - 4.330 * age
        }
        
        if trainingSegmentedControl.selectedSegmentIndex == 0 {
            calories *= 1.2
        }
        else
            if trainingSegmentedControl.selectedSegmentIndex == 1 {
                calories *= 1.375
            }
            else
                if trainingSegmentedControl.selectedSegmentIndex == 2 {
                    calories *= 1.55
                }
                else {
                    calories *= 1.725
                }
        
        let height_m = height / 100.0
        let index = weight / (height_m * height_m)
        
        resultLabel.text = String(format: "Вы должны потреблять %.2f килокалорий для поддержания веса. Индекс массы тела %.2f", calories, index)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

