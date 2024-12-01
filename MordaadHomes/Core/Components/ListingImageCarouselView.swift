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
    @EnvironmentObject var viewModel: ExploreViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ListingImageCarousel(imageURLs: listing.imageURLs)
            
            if showFavoritetButton {
                MHFavoriteButton(action: {
                    viewModel.toggleFavourite(for: listing)
                }, isFavourite: viewModel.isFavourite(for: listing))
            }
        }
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
        .environmentObject(ExploreViewModel(service: ExploreService()))
}
