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
    let category: ProjectCategory
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
    
    static var example: Listing {
            return Listing(
                id: NSUUID().uuidString,
                category: .customBuild,
                ownerUid: NSUUID().uuidString,
                ownerName: "John Smith",
                ownerImageUrl: "male-profile-photo",
                numberOfBathrooms: 3,
                numberOfBedrooms: 4,
                numberOfBeds: 4,
                numberOfGuests: 4,
                pricePerNight: 760,
                latitude: 25.7850,
                longitude: -80.1936,
                imageURLs: ["listing_1", "listing_2", "listing_3", "listing_4"],
                address: "124 Main St",
                city: "Miami",
                state: "Florida",
                title: "Miami Villa",
                rating: 4.86,
                features: [.selfCheckIn, .superHost],
                amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
                type: .villa
            )
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
