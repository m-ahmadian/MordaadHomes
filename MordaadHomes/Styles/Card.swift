//
//  Card.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-25.
//

import Foundation
import SwiftUI

struct Card: ViewModifier {
    var bgColor: Color

    func body(content: Content) -> some View {
        return content
            .padding()
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .dropShadow()
    }
}
