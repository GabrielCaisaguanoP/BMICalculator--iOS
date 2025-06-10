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
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weight: Float = 0
    var height: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onWeightChanged(_ sender: UIStepper) {
        weight = Float(sender.value)
        weigthtLabel.text = "\(Int(weight)) kg"
    }
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
            height = sender.value
        heightLabel.text = "\(Int(height)) cm"
    }
    
    @IBAction func calculateBotton(_ sender: Any) {
        let heightMeter: Float = height / Float (100)
        let bmi:Float = weight / pow(heightMeter, 2)
        resultLabel.text = "\(String(format: "%.2f", bmi))"
        
        var bmiColor = UIColor.black
        var showAlert = false
        
        switch bmi {
        case ..<18.5:
            descriptionLabel.text = "Underweight"
            bmiColor = UIColor(named: "bmi-underweight")!
        case 18.5..<25:
            descriptionLabel.text = "Normal weight"
            bmiColor = UIColor(named: "bmi-normal-weight")!
        case 25..<30:
            descriptionLabel.text = "Overweight"
            bmiColor = UIColor(named: "bmi-overweight")!
        case 30..<35:
            descriptionLabel.text = "Obesity"
            bmiColor = UIColor(named: "bmi-obesity")!
            showAlert = true
                                                  
        default:
            descriptionLabel.text = "Extreme obesity"
            bmiColor = UIColor(named: "bmi-extreme-obesity")!
            showAlert = true
        }
        
        resultLabel.textColor = bmiColor
        descriptionLabel.textColor = bmiColor
        
        if showAlert {
            let alert = UIAlertController(
                title: "Riesgo de salud",
                message: "Tu peso actual pone en grave riesgo de tu vida. Busca ayuda médica cuanto antes.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Mas información", style: .default, handler: { action in
                // He pulsado mas información
                let adviceSiteUrl = "https:medlineplus.gov/spain/ency/patientinstruccions/000348.htm"
                if let url = URL(string: adviceSiteUrl), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            }))
            alert.addAction(UIAlertAction(title: "Cerrar", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
