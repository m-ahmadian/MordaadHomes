//
//  ExploreViewModel.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import CoreLocation
import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var coordinateRegion: CLLocationCoordinate2D = .losAngeles
    @Published var searchLocation = ""
    private let service: ExploreService
    // TODO: Decide if you want to keep the copy
//    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task {
            await fetchListings()
        }
    }
    
    @MainActor
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
//            self.listingsCopy = listings
        } catch {
            // TODO: Implement the error enum and description
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        configureCoordinateRegion()
        
        let filteredListings = listings.filter {
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        }
        
        self.listings = filteredListings.isEmpty ? /*listingsCopy*/ listings : filteredListings
    }
    
    private func configureCoordinateRegion() {
        switch searchLocation {
        case "Los Angeles", "LA":
            self.coordinateRegion = .losAngeles
        case "Miami":
            self.coordinateRegion = .miami
        default:
            break
        }
    }
}
