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
    let apiURL = "https://api.exchangerate-api.com/v4/latest/USD"
            
    let nameArray = ["USD","AED", "ARS", "AUD", "BGN", "BRL", "BSD", "CAD", "CHF", "CLP", "CNY" , "COP", "CZK" , "DKK", "DOP", "EGP", "EUR", "FJD", "GBP", "GTQ", "HKD", "HRK", "HUF", "IDR", "INR", "ISK", "JPY", "KRW", "KZT", "MXN", "MYR", "NOK", "NZD", "PAB", "PEN", "PHP", "PKR", "PLN", "PYG", "RON", "RUB", "SAR", "SEK", "SGD", "THB", "TRY", "TWD","UAH", "UYU", "VND", "ZAR"]
    
    var delegate: CurrencyManagerDelegate?
    
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
            return setValue(decodedData: decodedData)

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

//MARK: - RefreshCurrency

extension CurrencyManager {
    
    func refreshCurrency(firstCurrency: Double, secondCurrency: Double) -> String{
        let result = calculateCurrency(moneyType: firstCurrency, toType: secondCurrency)
        return "=\(result)"
    }
    
    func calculateCurrency(moneyType: Double, toType: Double) -> String {
        let firstStep = 1.0/moneyType
        let secondStep = firstStep*toType
        return String(format: "%.2f", secondStep)
    }
}

//MARK: - Dictonary

extension CurrencyManager {
    
    func creatDictonary(currencyModel: CurrencyModel) -> [String : Double] {

        let dictonary = ["USD":currencyModel.USD,"AED":currencyModel.AED, "ARS":currencyModel.ARS,"AUD":currencyModel.AUD,"BGN":currencyModel.BGN,"BRL":currencyModel.BRL, "BSD":currencyModel.BSD, "CAD":currencyModel.CAD, "CHF":currencyModel.CHF, "CLP":currencyModel.CLP, "CNY":currencyModel.CNY , "COP":currencyModel.COP, "CZK":currencyModel.CZK , "DKK":currencyModel.DKK, "DOP":currencyModel.DOP, "EGP":currencyModel.EGP, "EUR":currencyModel.EUR, "FJD":currencyModel.FJD, "GBP":currencyModel.GBP, "GTQ":currencyModel.GTQ, "HKD":currencyModel.HKD, "HRK":currencyModel.HKD, "HUF":currencyModel.HUF, "IDR":currencyModel.IDR, "INR":currencyModel.INR, "ISK":currencyModel.ISK, "JPY":currencyModel.JPY, "KRW":currencyModel.KRW, "KZT":currencyModel.KZT, "MXN":currencyModel.MXN, "MYR":currencyModel.MYR, "NOK":currencyModel.NOK, "NZD":currencyModel.NZD, "PAB":currencyModel.PAB, "PEN":currencyModel.PEN, "PHP":currencyModel.PHP, "PKR":currencyModel.PKR, "PLN":currencyModel.PLN, "PYG":currencyModel.PYG, "RON":currencyModel.RON, "RUB":currencyModel.RUB, "SAR":currencyModel.SAR, "SEK":currencyModel.SEK, "SGD":currencyModel.SGD, "THB":currencyModel.THB, "TRY":currencyModel.TRY, "TWD":currencyModel.TWD,"UAH":currencyModel.UAH, "UYU":currencyModel.UYU, "VND":currencyModel.VND, "ZAR":currencyModel.ZAR]
        return dictonary
    }
}

//MARK: - setValue

extension CurrencyManager {
    
    func setValue(decodedData:CurrencyData ) -> CurrencyModel {
        let aed = decodedData.rates.AED
        let ars = decodedData.rates.ARS
        let aud = decodedData.rates.AUD
        let bgn = decodedData.rates.BGN
        let brl = decodedData.rates.BRL
        let bsd = decodedData.rates.BSD
        let cad = decodedData.rates.CAD
        let chf = decodedData.rates.CHF
        let clp = decodedData.rates.CLP
        let cny = decodedData.rates.CNY
        let cop = decodedData.rates.COP
        let czk = decodedData.rates.CZK
        let dkk = decodedData.rates.DKK
        let dop = decodedData.rates.DOP
        let egp = decodedData.rates.EGP
        let fjd = decodedData.rates.FJD
        let gbp = decodedData.rates.GBP
        let gtq = decodedData.rates.GTQ
        let hkd = decodedData.rates.HKD
        let hrk = decodedData.rates.HRK
        let huf = decodedData.rates.HUF
        let idr = decodedData.rates.IDR
        let inr = decodedData.rates.INR
        let isk = decodedData.rates.ISK
        let jpy = decodedData.rates.JPY
        let krw = decodedData.rates.KRW
        let kzt = decodedData.rates.KZT
        let mxn = decodedData.rates.MXN
        let myr = decodedData.rates.MYR
        let nok = decodedData.rates.NOK
        let nzd = decodedData.rates.NZD
        let pab = decodedData.rates.PAB
        let pen = decodedData.rates.PEN
        let php = decodedData.rates.PHP
        let pkr = decodedData.rates.PKR
        let pln = decodedData.rates.PLN
        let pyg = decodedData.rates.PYG
        let ron = decodedData.rates.RON
        let rub = decodedData.rates.RUB
        let sar = decodedData.rates.SAR
        let sek = decodedData.rates.SEK
        let sgd = decodedData.rates.SGD
        let thb = decodedData.rates.THB
        let twd = decodedData.rates.TWD
        let uah = decodedData.rates.UAH
        let uyu = decodedData.rates.UYU
        let vnd = decodedData.rates.VND
        let zar = decodedData.rates.ZAR
        let eur = decodedData.rates.EUR
        let trk = decodedData.rates.TRY
        

        let currency = CurrencyModel( USD: 1, AED: aed, ARS: ars, AUD: aud, BGN: bgn, BRL: brl, BSD: bsd, CAD: cad, CHF: chf, CLP: clp, CNY: cny, COP: cop, CZK: czk, DKK: dkk, DOP: dop, EGP: egp, EUR: eur, FJD: fjd, GBP: gbp, GTQ: gtq, HKD: hkd, HRK: hrk, HUF: huf, IDR: idr, INR: inr, ISK: isk, JPY: jpy, KRW: krw, KZT: kzt, MXN: mxn, MYR: myr, NOK: nok, NZD: nzd, PAB: pab, PEN: pen, PHP: php, PKR: pkr, PLN: pln, PYG: pyg, RON: ron, RUB: rub, SAR: sar, SEK: sek, SGD: sgd, THB: thb, TRY: trk, TWD: twd, UAH: uah, UYU: uyu, VND: vnd, ZAR: zar)
        
        
        
//        let nameArray = ["AED", "ARS", "AUD", "BGN", "BRL", "BSD", "CAD", "CHF", "CLP", "CNY" , "COP", "CZK" , "DKK", "DOP", "EGP", "EUR", "FJD", "GBP", "GTQ", "HKD", "HRK", "HUF", "IDR", "INR", "ISK", "JPY", "KRW", "KZT", "MXN", "MYR", "NOK", "NZD", "PAB", "PEN", "PHP", "PKR", "PLN", "PYG", "RON", "RUB", "SAR", "SEK", "SGD", "THB", "TRY", "TWD","UAH", "UYU", "VND", "ZAR"]
//
//        for doc in nameArray {
//            let value = decodedData.rates.doc
//        }
           
           
           return currency
       }
    
}
