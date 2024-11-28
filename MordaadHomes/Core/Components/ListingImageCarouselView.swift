//
//  ListingImageCarouselView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView {
                ForEach(listing.imageURLs, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            Button {
                // TODO: Implement
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }
            .foregroundStyle(.white)
            .shadow(color: .black, radius: 10)
            .padding()
        }
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
