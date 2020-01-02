//
//  CurrencySelectorView.swift
//  CurrencyCalculator
//
//  Created by Ferhan Akkan on 2.01.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

class CurrencySelectorView: UIViewController {

    @IBOutlet weak var currencyToCurrencyRateLabel: UILabel!
    @IBOutlet weak var calculatedCurrencyLabel: UILabel!
    @IBOutlet weak var usersCurrencyTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}
