//
//  View+Extensions.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-23.
//

import SwiftUI

extension View {
    func collapsibleView() -> some View {
        self
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
    
    func cardStyle(in color: Color = .foregroundAccent) -> some View {
        modifier(Card(bgColor: color))
    }

    func dropShadow() -> some View {
        modifier(DropShadow())
    }
    
    func standardTextFieldModifier() -> some View {
        modifier(StandardTextFieldModifier())
    }
    
    func standardButtonModifier() -> some View {
        modifier(StandardButtonModifier())
    }
}
