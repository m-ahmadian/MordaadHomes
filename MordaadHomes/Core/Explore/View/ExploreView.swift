//
//  ExploreView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @State private var showListingDetail = false
    @State private var showMapView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            VStack {
                if showDestinationSearchView {
                    DestinationSearchView(show: $showDestinationSearchView)
                        .environmentObject(viewModel)
                } else {
                    ZStack(alignment: .bottom) {
                        ScrollView {
                            LazyVStack(spacing: 32) {
                                SearchAndFilterBar(location: $viewModel.searchLocation)
                                    .onTapGesture {
                                        withAnimation(.snappy) {
                                            showDestinationSearchView.toggle()
                                        }
                                    }
                                
                                ForEach(viewModel.listings) { listing in
                                    NavigationLink(value: listing) {
                                        ListingItemView(listing: listing)
                                            .frame(height: 400)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                            }
                        }
                        
                        Button {
                            showMapView.toggle()
                        } label: {
                            HStack {
                                Text("Map")
                                
                                Image(systemName: "paperlane")
                            }
                            .foregroundStyle(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .padding()
                        }
                    }
                }
            }
            .sheet(isPresented: $showMapView) {
                ListingMapView(
                    listings: viewModel.listings,
                    coordinateRegion: viewModel.coordinateRegion
                )
            }
            .navigationDestination(for: Listing.self) { listing in
                ListingDetailView(listing: listing)
                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    ExploreView()
}
