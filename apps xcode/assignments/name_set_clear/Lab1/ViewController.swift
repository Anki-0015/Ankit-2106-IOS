//
//  ViewController.swift
//  Lab1
//
//  Created by Ankit bansal on 16/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterText: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        enterText.layer.borderWidth = 1.0
        enterText.layer.borderColor = UIColor.black.cgColor
        enterText.layer.cornerRadius = 5.0 
        // Do any additional setup after loading the view.
    }

    @IBAction func setText(_ sender: UIButton) {
        label.text = enterText.text
    }
    
    
    @IBAction func clearText(_ sender: UIButton) {
        enterText.text = ""
        label.text = ""
    }
    
}

