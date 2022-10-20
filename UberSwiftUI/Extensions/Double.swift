//
//  Double.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/20/22.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String{
        return currencyFormatter.string(for: self) ?? ""
    }
}
