//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billInput: UITextField!
    @IBOutlet weak var splitInput: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var zeroPourcentBtn: UIButton!
    @IBOutlet weak var tenPourcentBtn: UIButton!
    @IBOutlet weak var twentyPourcentBtn: UIButton!
    
    var tips = Tips(pourcent: .ten, price: 0, peopleNumber: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitInput.value = Double(tips.peopleNumber)
        splitLabel.text = String("\(tips.peopleNumber)")
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func tipChange(_ sender: UIButton) {
        let currentBtnText = sender.currentTitle ?? "10%"
        
        zeroPourcentBtn.isSelected = currentBtnText == "0%"
        tenPourcentBtn.isSelected = currentBtnText == "10%"
        twentyPourcentBtn.isSelected = currentBtnText == "20%"
        
        switch currentBtnText {
        case "0%":
            tips.pourcent = .zero
        case "20%":
            tips.pourcent = .twenty
        default:
            tips.pourcent = .ten
        }
    }
    
    @IBAction func stepperChange(_ sender: UIStepper) {
        tips.peopleNumber = Int(sender.value)
        splitLabel.text = "\(tips.peopleNumber)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let price = billInput.text {
            tips.price = Float(price) ?? 0
        }
        
        self.performSegue(withIdentifier: "tipsResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "tipsResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tips = tips
        }
    }
}

