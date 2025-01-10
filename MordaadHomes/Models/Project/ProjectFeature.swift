//
//  ProjectFeature.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-12-05.
//

import Foundation

enum ProjectFeature: String, Codable, CaseIterable, Identifiable {
    case ecoFriendly = "Eco-Friendly"
    case smartHome = "Smart Home"
    case energyEfficient = "Energy Efficient"
    case openFloorPlan = "Open Floor Plan"
    case customCabinetry = "Custom Cabinetry"
    case luxuryFinishes = "Luxury Finishes"
    case outdoorLiving = "Outdoor Living"
    case sustainableMaterial = "Sustainable Material"
    
    var id: String { self.rawValue }
    
//    var imageName: String {
//        switch self {
//        case .customBuild: return "custom-build"
//        case .renovation: return "renovation"
//        case .plumbing: return "plumbing"
//        case .hvac: return "hvac"
//        case .airDuctCleaning: return "air-duct-cleaning"
//        case .generalContractor: return "general-contractor"
//        }
//    }
//    
//    var systemImageName: String {
//            switch self {
//            case .customBuild: return "house.fill"
//            case .renovation: return "hammer.fill"
//            case .plumbing: return "wrench.fill"
//            case .hvac: return "thermometer.sun.fill"
//            case .airDuctCleaning: return "wind"
//            case .generalContractor: return "person.crop.rectangle.fill"
//            }
//        }
}

