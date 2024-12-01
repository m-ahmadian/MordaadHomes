//
//  ListingView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import SwiftUI

struct ListingView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(listing: listing, showFavoritetButton: true)
            
            // listing details
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    VStack(spacing: 0) {
                        Text("12 mi away")
                            .foregroundStyle(.gray)
                        
                        Text("Nov 3 - 10")
                            .foregroundStyle(.gray)
                    }
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        
                        Text("night")
                    }
                }
                
                Spacer()
                
                // rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                    
                    Text(listing.rating.formatRating())
                        .font(.footnote)
                }
            }
            .foregroundStyle(.black)
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingView(listing: DeveloperPreview.shared.listings[2])
        .environmentObject(ExploreViewModel(service: ExploreService()))
}
