//
//  CurrencySetDataModel.swift
//  CurrencyCalculator
//
//  Created by Ferhan Akkan on 5.01.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

struct CurrencySetDataModel {
    
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
        let zar = decodedData.rates.ZAR
        let eur = decodedData.rates.EUR
        let trk = decodedData.rates.TRY
        
        
        let currency = CurrencyModel( USD: 1, AED: aed, ARS: ars, AUD: aud, BGN: bgn, BRL: brl, BSD: bsd, CAD: cad, CHF: chf, CLP: clp, CNY: cny, COP: cop, CZK: czk, DKK: dkk, DOP: dop, EGP: egp, EUR: eur, FJD: fjd, GBP: gbp, GTQ: gtq, HKD: hkd, HRK: hrk, HUF: huf, IDR: idr, INR: inr, ISK: isk, JPY: jpy, KRW: krw, KZT: kzt, MXN: mxn, MYR: myr, NOK: nok, NZD: nzd, PAB: pab, PEN: pen, PHP: php, PKR: pkr, PLN: pln, PYG: pyg, RON: ron, RUB: rub, SAR: sar, SEK: sek, SGD: sgd, THB: thb, TRY: trk, TWD: twd, UAH: uah, UYU: uyu, ZAR: zar)
        
        return currency
    }
}
