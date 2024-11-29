//
//  ListingDetailView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import MapKit
import SwiftUI

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: listing.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                MHBackButton { dismiss() }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 12, height: 12)
                        
                        Text(listing.rating.formatRating())
                        
                        Text(" - ")
                            
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    
                    Text("\(listing.city), \(listing.state)")
                        .font(.caption)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // host info view
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                CircularProfileImageView(
                    imageURL: listing.ownerImageUrl,
                    size: .large
                )
            }
            .padding()
            
            Divider()
            
            // listing features
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                            
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack {
                // bedrooms view
                VStack(alignment: .leading, spacing: 16) {
                    Text("Where you'll sleep")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(1...listing.numberOfBedrooms, id: \.self) { bedroom in
                                VStack(alignment: .leading, spacing: 8) {
                                    Image(systemName: "bed.double")
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Bedroom \(bedroom)")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                    }
                                }
                                .frame(width: 132, height: 100, alignment: .leading)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                    .scrollTargetBehavior(.paging)
                }
                .padding()
                
                Divider()
                
                // listing amenities
                VStack(alignment: .leading, spacing: 16) {
                    Text("What this place offers")
                        .font(.headline)
                    
                    ForEach(listing.amenities) { amenity in
                        HStack {
                            Image(systemName: amenity.imageName)
                                .frame(width: 32)
                            
                            Text(amenity.title)
                                .font(.footnote)
                            
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Divider()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .cornerRadius(12)
            }
            .padding()
        }
        .padding(.bottom, 72)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        print("DEBUG: Reserve listing here..")
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 36)
            }
            .background(.white)
        }
        .toolbarVisibility(.hidden, for: .tabBar)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
