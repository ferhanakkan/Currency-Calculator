//
//  CurrencyManager.swift
//  CurrencyCalculator
//
//  Created by Ferhan Akkan on 3.01.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import CoreLocation

protocol CurrencyViewModelDelegate {
    func didUpdateWeather(_ currencyViewModel: CurrencyViewModel, currency: CurrencyModel)
    func didFailWithError(error: Error)
}

struct CurrencyViewModel {
    let apiURL = "https://api.exchangerate-api.com/v4/latest/USD"
            
    let nameArray = ["USD","AED", "ARS", "AUD", "BGN", "BRL", "BSD", "CAD", "CHF", "CLP", "CNY" , "COP", "CZK" , "DKK", "DOP", "EGP", "EUR", "FJD", "GBP", "GTQ", "HKD", "HRK", "HUF", "IDR", "INR", "ISK", "JPY", "KRW", "KZT", "MXN", "MYR", "NOK", "NZD", "PAB", "PEN", "PHP", "PKR", "PLN", "PYG", "RON", "RUB", "SAR", "SEK", "SGD", "THB", "TRY", "TWD","UAH", "UYU", "ZAR"]
    
    var delegate: CurrencyViewModelDelegate?
    
    var dictonary: [String : Double]?
    var firstCurrency: Double = 1.0
    var secondCurrency: Double = 1.0
    var firstCurrencyType: String = "USD"
    var secondCurrencyType: String = "USD"
    
    mutating func setDictonary(currencyModel: CurrencyModel) {
        dictonary = creatDictonary(currencyModel: currencyModel)
    }
    
     func fetchCurrency() {
        performRequest(with: apiURL)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let currency = self.parseJSON(safeData) {
                        
                        print("test fero : \(currency)")
                        self.delegate?.didUpdateWeather(self, currency: currency)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    
    func parseJSON(_ currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            return setValue(decodedData: decodedData)

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

//MARK: - RefreshCurrency

extension CurrencyViewModel {
    
    
    func refreshCurrency() -> String{
        let result = calculateCurrency(moneyType: firstCurrency, toType: secondCurrency)
        return "1.00 \(firstCurrencyType) = \(result) \(secondCurrencyType)"
    }
    
    func refreshPlaceholder() -> String{
        return "Enter amount of \(firstCurrencyType) to \(secondCurrencyType) calculate"
    }
    
    func calculateCurrency(moneyType: Double, toType: Double) -> String {
        let firstStep = 1.0/moneyType
        let secondStep = firstStep*toType
        return String(format: "%.2f", secondStep)
    }
    
    func userCalculation(userAmount: Double) -> String{
        let result = userAmount*(secondCurrency/firstCurrency)
        return "\(String(format: "%.2f", userAmount)) \(firstCurrencyType) is \(String(format: "%.2f", result)) \(secondCurrencyType)"
    }
    
}

//MARK: - Dictonary

extension CurrencyViewModel {
    
    func creatDictonary(currencyModel: CurrencyModel) -> [String : Double] {
        let dictonaryModel = DictonaryModel()
        let dictonary = dictonaryModel.creatDictonary(currencyModel: currencyModel)
        return dictonary
    }
}

//MARK: - setValue

extension CurrencyViewModel {
    
    func setValue(decodedData:CurrencyData ) -> CurrencyModel {
        
        let setValueDataModel = CurrencySetDataModel()
        let currency = setValueDataModel.setValue(decodedData: decodedData)
        return currency

       }
    
}
