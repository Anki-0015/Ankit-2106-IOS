//
//  ViewController.swift
//  BMIcalculator
//
//  Created by Ankit bansal on 14/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var calculateBMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
        
    }

    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        let weightString = weightTextField.text ?? ""
        let weight = Double(weightString) ?? 0
        
        let heightString = heightTextField.text ?? ""
        let height = Double(heightString) ?? 0
        
        let bmiValue = weight / (height * height)
        
        calculateBMI.text = "BMI is :  \(bmiValue)"
        
    }
}

