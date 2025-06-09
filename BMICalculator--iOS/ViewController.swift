//
//  ViewController.swift
//  BMICalculator--iOS
//
//  Created by Tardes on 6/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weigthtLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var weight: Float = 0
    var height: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onWeightChanged(_ sender: UIStepper) {
        weight = Float(sender.value)
        weigthtLabel.text = "\(weight) kg"
    }
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
            height = sender.value
        heightLabel.text = "\(height) cm"
    }
    
    
    @IBAction func calculateBotton(_ sender: Any) {
        let heightMeter: Float = height / Float (100)
        let bmi:Float = weight / pow(heightMeter, 2)
        //resultable.text = Your BMI is \String(format: "%2f, bmi))"
        resultLabel.text = "\(String(format: "%2f", bmi))"
    }
}

