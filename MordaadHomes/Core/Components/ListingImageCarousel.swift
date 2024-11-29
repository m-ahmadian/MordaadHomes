//
//  ListingImageCarousel.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-29.
//

import SwiftUI

struct ListingImageCarousel: View {
    let imageURLs: [String]
    
    var body: some View {
        TabView {
            ForEach(imageURLs, id: \.self) { imageURL in
                Image(imageURL)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: 320)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarousel(imageURLs: DeveloperPreview.shared.listings[0].imageURLs)
}
