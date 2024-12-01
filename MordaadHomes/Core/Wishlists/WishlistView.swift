//
//  WishlistView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import SwiftUI

struct WishlistView: View {
    @EnvironmentObject var exploreViewModel: ExploreViewModel
    @State private var isUserLoggedIn = false
    @State private var selectedListing: Listing?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /*if !isUserLoggedIn {
                    // Login prompt when user is not logged in
                    VStack(alignment: .leading, spacing: 32) {
                       
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Log in to view your favorites")
                                .font(.headline)
                            
                            Text("You can create, view or edit favorites once you've logged in")
                                .font(.footnote)
                        }
                        .frame(width: 300)
                        .padding(.vertical)
                        
                        MHPrimaryButton(title: "Log in") {
                            print("Log in")
                        }
                    }
                    .padding(.top)
                } else */ if exploreViewModel.favoritesListings.isEmpty {
                    // Display message when no favorites
                    VStack(alignment: .center, spacing: 16) {
                        Text("No favorites yet")
                            .font(.headline)
                        
                        Text("Tap the heart icon on any listing to save it here")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 32)
                } else {
                    LazyVStack(spacing: 32) {
                        ForEach(exploreViewModel.listings.filter {
                            exploreViewModel.favoritesListings.contains($0)
                        }) { listing in
                            ListingView(listing: listing)
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    selectedListing = listing
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Favorites")
            .navigationDestination(item: $selectedListing) {listing in
                ListingDetailView(listing: listing)
                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
        }
    }
}

#Preview {
    WishlistView()
        .environmentObject(ExploreViewModel(service: ExploreService()))
}
