//
//  DropShadow.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-25.
//

import Foundation
import SwiftUI

struct DropShadow: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .shadow(color: .black.opacity(0.4), radius: 2)
    }
}
