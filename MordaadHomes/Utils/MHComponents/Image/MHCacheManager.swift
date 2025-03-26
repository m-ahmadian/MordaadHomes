//
//  MHCacheManager.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2025-03-26.
//

import Foundation
import Kingfisher

final class MHCacheManager: ObservableObject {
    static let shared = MHCacheManager()
    @Published private(set) var cacheSize: Int = 0
    
    private init() {
        let cache = KingfisherManager.shared.cache
        cache.memoryStorage.config.totalCostLimit = 100 * 1024 * 1024 // 100 MB memory limit
        cache.diskStorage.config.sizeLimit = 500 * 1024 * 1024 // 500 MB disk limit
        
    }
    
    func clearCache() {
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache { [weak self] in
            self?.updateCacheSize()
        }
    }
    
    private func updateCacheSize() {
        KingfisherManager.shared.cache.calculateDiskStorageSize { [weak self] result in
            switch result {
            case .success(let size):
                DispatchQueue.main.async { self?.cacheSize = Int(size) }
            case .failure(let error):
                print("Failed to calculate cache size: \(error)")
                DispatchQueue.main.async { self?.cacheSize = 0 }
            }
        }
    }
    
    func pollCacheSize(_ completion: (() -> Void)? = nil) {
        if cacheSize > 0 {
            completion?()
            return
        }
        
        let maxAttempts = 10
        var attempts = 0
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self else {
                timer.invalidate()
                return
            }
            
            attempts += 1
            updateCacheSize()
            
            if cacheSize > 0 || attempts >= maxAttempts {
                timer.invalidate()
                completion?()
            }
        }
        
        RunLoop.main.add(timer, forMode: .common)
    }
}

// MARK: - Mock
#if DEBUG
extension MHCacheManager {
    func mockCacheSizeUpdate(_ size: Int) {
        cacheSize = size
    }
}
#endif
