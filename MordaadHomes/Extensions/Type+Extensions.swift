//
//  Type+Extensions.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-25.
//

import Foundation

extension Double {
    func formatRating() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 1
        formatter.usesSignificantDigits = false
        return formatter.string(from: NSNumber(value: self)) ?? String(format: "%.2f", self)
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }

    func toPercentage() -> String {
        guard let numberAsString = percentFormatter.string(for: self) else {
            return "+0.00%"
        }
        return numberAsString + "%"
    }

    func printTo(_ decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self)
    }

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()

        // config
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2

        return formatter
    }

    private var percentFormatter: NumberFormatter {
        let formatter = NumberFormatter()

        // config
        formatter.positivePrefix = "+"
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        return formatter
    }
}
