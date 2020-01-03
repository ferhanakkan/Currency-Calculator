//
//  CurrencyManager.swift
//  CurrencyCalculator
//
//  Created by Ferhan Akkan on 3.01.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import CoreLocation

protocol CurrencyManagerDelegate {
    func didUpdateWeather(_ currencyManager: CurrencyManager, currency: CurrencyModel)
    func didFailWithError(error: Error)
}

struct CurrencyManager {
    let apiURL = "http://www.apilayer.net/api/live?access_key=2f9e4eeebc69104c2c5d161dfb8d320f&format=1"
    
    var delegate: CurrencyManagerDelegate?
    
    func calculateCurrency(moneyType: Double, toType: Double) -> String {
        let firstStep = 1.0/moneyType
        let secondStep = firstStep*toType
        return String(format: "%.3f", secondStep)
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
//            let id = decodedData.weather[0].id
//            let name = decodedData.name
//            let temp = decodedData.main.temp

            
//
//            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, tempMin: tempMin, tempMax: tempMax, feelTemp: feelTemp, latitude: latitude, longitude: longitude, description: description, country: country)
            return

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}

