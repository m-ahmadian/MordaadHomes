//
//  ImageSize.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2025-03-26.
//

import Foundation

enum ImageSize: Int {
    case thumbnail = 96
    case small = 480
    case medium = 800
    case large = 1024
    case xlarge = 2048
    case source
}

extension ImageSize {
    static func resizedURL(for url: URL?, size: ImageSize = .medium) -> URL? {
        guard let url else { return url }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "w", value: String(size.rawValue))]
        return components?.url ?? url
    }
}
