//
//  Regions.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-25.
//

import CoreLocation

extension CLLocationCoordinate2D {
    static var losAngeles = CLLocationCoordinate2D(latitude: 34.0549, longitude: -118.2426)
    static var miami = CLLocationCoordinate2D(latitude: 25.7602, longitude: -80.1959)
    
    // TODO: Implement for Project Locations
    func regionForCity(_ name: String) -> CLLocationCoordinate2D {
        switch name {
            case "Los Angeles": return .losAngeles
        case "Miami": return .miami
        default: return .miami
        }
    }
}
