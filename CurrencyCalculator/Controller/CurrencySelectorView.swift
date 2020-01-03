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
    @IBOutlet weak var fromCurrenctPickerView: UIPickerView!
    @IBOutlet weak var toCurrencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSetter()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}

//MARK: - PickerViewDelegate

extension CurrencySelectorView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerSetter() {
        fromCurrenctPickerView.delegate = self
        fromCurrenctPickerView.dataSource = self
        toCurrencyPicker.delegate = self
        toCurrencyPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Yusufun memesi"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // selected row process
        if pickerView.accessibilityIdentifier == "fromPicker" {
            print("first picker")
        } else {
            print("second picker")
        }
    }
    
    
}
