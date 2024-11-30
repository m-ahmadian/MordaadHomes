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
    @State private var selectedCategory: ProjectCategory? = nil
    
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
                                        withAnimation(.spring) {
                                            showDestinationSearchView.toggle()
                                        }
                                    }
                                
                                CategoryRow(
                                    selectedCategory: Binding(
                                        get: { viewModel.selectedCategory },
                                        set: { viewModel.selectCategory($0) }
                                    )
                                )
                                
                                ForEach(viewModel.filteredListings()) { listing in
                                    NavigationLink(value: listing) {
                                        ListingView(listing: listing)
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
                    listings: viewModel.filteredListings(),
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
