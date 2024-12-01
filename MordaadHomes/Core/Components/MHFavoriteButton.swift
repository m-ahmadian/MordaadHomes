//
//  FavoriteButton.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-29.
//

import SwiftUI

struct MHFavoriteButton: View {
    let action: () -> Void
    let isFavourite: Bool
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: isFavourite ? "heart.fill" : "heart")
                .imageScale(.large)
        }
        .foregroundStyle(isFavourite ? .red : .white)
        .shadow(color: .black, radius: 10)
        .padding()
    }
}

#Preview {
    MHFavoriteButton(action: {}, isFavourite: false)
}
