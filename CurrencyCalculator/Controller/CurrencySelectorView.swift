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
    @IBOutlet weak var usersCurrencyTextfield: UITextField!
    @IBOutlet weak var fromCurrenctPickerView: UIPickerView!
    @IBOutlet weak var toCurrencyPicker: UIPickerView!
    
    var currencyViewModel = CurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSetter()
        currencyManagerDelegateSetter()
        currencyViewModel.fetchCurrency()
        hideKeyboardWhenTappedAround()
        setdelegateTextfiled()
    }
    @IBAction func clear(_ sender: UIButton) {
        usersCurrencyTextfield.text?.removeAll()
        usersCurrencyTextfield.placeholder = currencyViewModel.refreshPlaceholder()
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
        return currencyViewModel.nameArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyViewModel.nameArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.accessibilityIdentifier == "fromPicker" {
            currencyViewModel.firstCurrencyType = currencyViewModel.nameArray[row]
            currencyViewModel.firstCurrency = currencyViewModel.dictonary![currencyViewModel.nameArray[row]]!
            currencyToCurrencyRateLabel.text = currencyViewModel.refreshCurrency()
            usersCurrencyTextfield.placeholder = currencyViewModel.refreshPlaceholder()
            
        } else if pickerView.accessibilityIdentifier == "secondPicker" {
            currencyViewModel.secondCurrencyType = currencyViewModel.nameArray[row]
            currencyViewModel.secondCurrency = currencyViewModel.dictonary![currencyViewModel.nameArray[row]]!
            currencyToCurrencyRateLabel.text = currencyViewModel.refreshCurrency()
            usersCurrencyTextfield.placeholder = currencyViewModel.refreshPlaceholder()
        } else {
            print("picker error")
        }
    }
    
    
}

//MARK: - CurrencyManagerDelegate

extension CurrencySelectorView: CurrencyViewModelDelegate {
    func didUpdateWeather(_ currencyManager: CurrencyViewModel, currency: CurrencyModel) {
        DispatchQueue.main.async {
            self.currencyViewModel.setDictonary(currencyModel: currency)
        }
    }
    
    func currencyManagerDelegateSetter() {
        currencyViewModel.delegate = self
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
        
        if usersCurrencyTextfield.text != "" {
            usersCurrencyTextfield.text = currencyViewModel.userCalculation(userAmount: Double(usersCurrencyTextfield.text!)!)
        }
    }
}


