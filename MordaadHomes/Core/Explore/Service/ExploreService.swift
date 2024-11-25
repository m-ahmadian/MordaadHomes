//
//  ExploreService.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        // TODO: Replace the mock data with API results
        return DeveloperPreview.shared.listings
    }
}
