//
//  ListingImageCarouselView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    var showFavoritetButton: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ListingImageCarousel(imageURLs: listing.imageURLs)
            
            if showFavoritetButton {
                MHFavoriteButton {
                    // TODO: Implement the logic
                }
            }
        }
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
