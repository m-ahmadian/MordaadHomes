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
    static var newYork = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0059)
    static var atlanta = CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880)
    static var chicago = CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298)
    static var houston = CLLocationCoordinate2D(latitude: 29.7604, longitude: -95.3698)
    static var washingtonDC = CLLocationCoordinate2D(latitude: 38.9072, longitude: -77.0369)
    static var miamiBeach = CLLocationCoordinate2D(latitude: 25.7617, longitude: -80.1918)
    static var lasVegas = CLLocationCoordinate2D(latitude: 36.1699, longitude: -115.1398)
    static var seattle = CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321)
    
    // TODO: Implement for Project Locations
    func regionForCity(_ name: String) -> CLLocationCoordinate2D {
        switch name {
            case "Los Angeles": return .losAngeles
        case "Miami": return .miami
        case "New York": return .newYork
        case "Atlanta": return .atlanta
        case "Chicago": return .chicago
        case "Houston": return .houston
        case "Washington DC": return .washingtonDC
        case "Miami Beach": return .miamiBeach
        case "Las Vegas": return .lasVegas
        case "Seattle": return .seattle
        default: return .newYork
        }
    }
}
