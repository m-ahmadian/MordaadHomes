//
//  Array+Extensions.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2025-01-10.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
