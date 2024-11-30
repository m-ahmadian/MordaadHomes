//
//  ProjectCategory.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-30.
//

import Foundation

enum ProjectCategory: String, Codable, CaseIterable, Identifiable {
    case customBuild = "Custom Build"
    case renovation = "Renovation"
    case plumbing = "Plumbing"
    case hvac = "HVAC"
    case airDuctCleaning = "Duct Cleaning"
    case generalContractor = "General Contractor"
    
    var id: String { self.rawValue }
    
    var imageName: String {
        switch self {
        case .customBuild: return "custom-build"
        case .renovation: return "renovation"
        case .plumbing: return "plumbing"
        case .hvac: return "hvac"
        case .airDuctCleaning: return "air-duct-cleaning"
        case .generalContractor: return "general-contractor"
        }
    }
    
    var systemImageName: String {
            switch self {
            case .customBuild: return "house.fill"
            case .renovation: return "hammer.fill"
            case .plumbing: return "wrench.fill"
            case .hvac: return "thermometer.sun.fill"
            case .airDuctCleaning: return "wind"
            case .generalContractor: return "person.crop.rectangle.fill"
            }
        }
}
