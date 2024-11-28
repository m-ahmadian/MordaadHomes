//
//  ListingMapView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-27.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    private let listings: [Listing]
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    @State private var selectedListing: Listing?
    @State private var showDetails = false
    @State private var showListingPreview = false
    
    init(listings: [Listing], coordinateRegion: CLLocationCoordinate2D = .losAngeles) {
        self.listings = listings
        
        let coordinateRegion = MKCoordinateRegion(
            center: coordinateRegion,
            latitudinalMeters: 50000,
            longitudinalMeters: 50000
        )
        
        self._cameraPosition = State(wrappedValue: .region(coordinateRegion))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(position: $cameraPosition, selection: $selectedListing) {
                ForEach(listings, id: \.self) { listing in
                    Marker("", coordinate: listing.coordinates)
                        .tag(listing.id)
                }
            }
            .onChange(of: selectedListing) { oldValue, newValue in
                showListingPreview = newValue != nil
            }
            .fullScreenCover(isPresented: $showDetails, onDismiss: clearSelectedListing) {
                if let selectedListing {
                    ListingDetailView(listing: selectedListing)
                }
            }
            .ignoresSafeArea()
            
            if showListingPreview, let listing = selectedListing {
                withAnimation(.snappy) {
                    MapListingView(listing: listing)
                        .onTapGesture {
                            showListingPreview.toggle()
                            showDetails.toggle()
                        }
                }
            }
        }
        .overlay(alignment: .topLeading) {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
                .background(
                    Circle()
                        .fill(.white)
                        .frame(width: 32, height: 32)
                        .shadow(radius: 4)
                )
                .onTapGesture { dismiss() }
                .padding(.top, 40)
                .padding(.leading, 32)
        }
    }
    
    // MARK: - Helper Method
    private func clearSelectedListing() {
        selectedListing = nil
    }
}

#Preview {
    ListingMapView(listings: DeveloperPreview.shared.listings)
}
