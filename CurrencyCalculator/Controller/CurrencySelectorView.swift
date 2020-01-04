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
    @IBOutlet weak var currencyToCurrencyResultLabel: UILabel!
    @IBOutlet weak var currencyToCurrencyResultCurrencyTypeLabel: UILabel!
    @IBOutlet weak var calculatedCurrentTypeLabel: UILabel!
    
    var currencyManager = CurrencyManager()
    
    var dictonary : [String : Double]?
    var firstCurrency : Double = 1.0
    var secondCurrency : Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSetter()
        currencyManagerDelegateSetter()
        currencyManager.fetchCurrency()
        hideKeyboardWhenTappedAround()
        setdelegateTextfiled()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if usersCurrencyTextfield.text != "" {
            let userAmount = Double(usersCurrencyTextfield.text!)
            var result = userAmount!*(secondCurrency/firstCurrency)
            
            calculatedCurrencyLabel.text = "\(result)"
        }
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
        return currencyManager.nameArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyManager.nameArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // selected row process
        if pickerView.accessibilityIdentifier == "fromPicker" {
            currencyToCurrencyRateLabel.text = ("1.00 \(currencyManager.nameArray[row])")
            firstCurrency = dictonary![currencyManager.nameArray[row]]!
            usersCurrencyTextfield.placeholder = "Enter amount of \((currencyManager.nameArray[row])) to calculate"
        } else if pickerView.accessibilityIdentifier == "secondPicker" {
            secondCurrency = dictonary![currencyManager.nameArray[row]]!
            currencyToCurrencyResultCurrencyTypeLabel.text = "\(currencyManager.nameArray[row])"
            calculatedCurrentTypeLabel.text = "\(currencyManager.nameArray[row])"
        } else {
            print("picker error")
        }
        currencyToCurrencyResultLabel.text = currencyManager.refreshCurrency(firstCurrency: firstCurrency, secondCurrency: secondCurrency)
    }
    
    
}

//MARK: - CurrencyManagerDelegate

extension CurrencySelectorView: CurrencyManagerDelegate {
    
    func currencyManagerDelegateSetter() {
        currencyManager.delegate = self
    }
    
    func didUpdateWeather(_ currencyManager: CurrencyManager, currency: CurrencyModel) {
        DispatchQueue.main.async {
            self.dictonary=currencyManager.creatDictonary(currencyModel: currency)
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error is \(error)")
    }
    
    
}

//MARK: - GestureRecognizer

extension CurrencySelectorView {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - TextfieldDelegate

extension CurrencySelectorView: UITextFieldDelegate {
    
    func setdelegateTextfiled() {
        usersCurrencyTextfield.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = usersCurrencyTextfield.text {
            print("do something\(city)")
        }
    }
}


