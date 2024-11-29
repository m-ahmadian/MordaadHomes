//
//  Listing.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import Foundation
import CoreLocation

struct Listing: Identifiable, Codable {
    var id = NSUUID().uuidString
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBathrooms: Int
    let numberOfBedrooms: Int
    let numberOfBeds: Int
    let numberOfGuests: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageURLs: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
    
    var coordinates: CLLocationCoordinate2D {
        return .init(latitude: latitude, longitude: longitude)
    }
}

extension Listing: Hashable {
    static func == (lhs: Listing, rhs: Listing) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
