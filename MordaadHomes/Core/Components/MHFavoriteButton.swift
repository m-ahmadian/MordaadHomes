//
//  FavoriteButton.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-29.
//

import SwiftUI

struct MHFavoriteButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "heart")
                .imageScale(.large)
        }
        .foregroundStyle(.white)
        .shadow(color: .black, radius: 10)
        .padding()
    }
}

#Preview {
    MHFavoriteButton(action: {})
}
