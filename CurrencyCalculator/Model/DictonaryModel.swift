//
//  DictonaryModel.swift
//  CurrencyCalculator
//
//  Created by Ferhan Akkan on 5.01.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//
struct DictonaryModel {
    
  func creatDictonary(currencyModel: CurrencyModel) -> [String : Double] {

        let dictonary = ["USD":currencyModel.USD,"AED":currencyModel.AED, "ARS":currencyModel.ARS,"AUD":currencyModel.AUD,"BGN":currencyModel.BGN,"BRL":currencyModel.BRL, "BSD":currencyModel.BSD, "CAD":currencyModel.CAD, "CHF":currencyModel.CHF, "CLP":currencyModel.CLP, "CNY":currencyModel.CNY , "COP":currencyModel.COP, "CZK":currencyModel.CZK , "DKK":currencyModel.DKK, "DOP":currencyModel.DOP, "EGP":currencyModel.EGP, "EUR":currencyModel.EUR, "FJD":currencyModel.FJD, "GBP":currencyModel.GBP, "GTQ":currencyModel.GTQ, "HKD":currencyModel.HKD, "HRK":currencyModel.HKD, "HUF":currencyModel.HUF, "IDR":currencyModel.IDR, "INR":currencyModel.INR, "ISK":currencyModel.ISK, "JPY":currencyModel.JPY, "KRW":currencyModel.KRW, "KZT":currencyModel.KZT, "MXN":currencyModel.MXN, "MYR":currencyModel.MYR, "NOK":currencyModel.NOK, "NZD":currencyModel.NZD, "PAB":currencyModel.PAB, "PEN":currencyModel.PEN, "PHP":currencyModel.PHP, "PKR":currencyModel.PKR, "PLN":currencyModel.PLN, "PYG":currencyModel.PYG, "RON":currencyModel.RON, "RUB":currencyModel.RUB, "SAR":currencyModel.SAR, "SEK":currencyModel.SEK, "SGD":currencyModel.SGD, "THB":currencyModel.THB, "TRY":currencyModel.TRY, "TWD":currencyModel.TWD,"UAH":currencyModel.UAH, "UYU":currencyModel.UYU, "ZAR":currencyModel.ZAR]
        return dictonary
    }
}
