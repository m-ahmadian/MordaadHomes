//
//  MHNavigationView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2025-03-26.
//

import SwiftUI

struct MHNavigationView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .textScale(.default)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.vertical, .leading], 16)
            .background(.yellow)
            .accessibilityIdentifier("Title")
    }
}

#Preview {
    MHNavigationView(title: "My Account")
        .background(.secondary)
}
