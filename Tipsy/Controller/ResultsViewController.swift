//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alex on 21/07/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tips : Tips?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tip = tips {
            totalLabel.text = String(format: "%.2f", TipsBrain.calculTips(tip))
            settingsLabel.text = "Split between \(tip.peopleNumber) people, with \(Int((tip.pourcent?.rawValue ?? 0) * 100))% tip."
        }
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
