//
//  MHCachedImage.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2025-03-26.
//

import SwiftUI

import Kingfisher

struct MHCachedImage: View {
    let url: URL?
    let size: ImageSize
    let aspectRatio: CGFloat?
    let transaction: Transaction
    var onProgress: ((Double) -> Void)?
    var onCompletion: ((Image?) -> Void)?
    
    var resizedImageURL: URL? { ImageSize.resizedURL(for: url, size: size) }
    @State private var downloadProgress: Double = 0
    
    init(
        url: URL?,
        size: ImageSize = .thumbnail,
        aspectRatio: CGFloat? = nil,
        transaction: Transaction = Transaction(animation: .bouncy())
    ) {
        self.url = url
        self.size = size
        self.aspectRatio = aspectRatio
        self.transaction = transaction
    }
    
    var body: some View {
        imageContent
    }
    
    @MainActor
    private var imageContent: some View {
        KFImage(resizedImageURL)
            .onProgress { receivedSize, totalSize in
                if totalSize > 0 {
                    downloadProgress = Double(receivedSize) / Double(totalSize)
                }
            }
            .onSuccess { result in
                onCompletion?(Image(uiImage: result.image))
                MHCacheManager.shared.pollCacheSize()
            }
            .onFailure { error in
                print("❌ Image load failed: \(error)")
                onCompletion?(nil)
            }
            .placeholder {
                ZStack {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                    
                    ProgressView(value: downloadProgress)
                        .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                        .scaleEffect(2.0, anchor: .center)
                }
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func onCompletion(_ action: @escaping ((Image?) -> Void)) -> Self {
        var view = self
        view.onCompletion = action
        return view
    }
    
    public static func clearCache() {
        MHCacheManager.shared.clearCache()
    }
}

// MARK: - Preview

struct MHCachedImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        PreviewContainer()
            .padding(.vertical)
            .previewLayout(.sizeThatFits)
    }
}

// MARK: - PreviewContainer

private struct PreviewContainer: View {
    @StateObject private var cacheManager = MHCacheManager.shared
    @State private var status = ""
    @State private var loadCount = 0
    @State private var reloadTrigger = UUID()
    @State private var isImageLoaded = false
    
    let url = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/07/Large-Sample-Image-download-for-Testing.jpg")!
    
    private enum Constants {
        static let reloadImageTitle = "Reload Image"
        static let clearCacheTitle = "Clear Cache"
        static let clearCacheMessage = "Cache cleared"
        static let completedStatus = "Completed ✅"
        static let failedStatus = "Failed ❌"
    }
    
    // MARK: - Body
    var body: some View {
        cachedImageView
        statusView
        actionButtonsView
    }
    
    // MARK: - SubViews
    private var cachedImageView: some View {
        MHCachedImage(url: url, size: .source)
            .onCompletion { image in
                if image != nil {
                    status = Constants.completedStatus
                    isImageLoaded = true
                } else {
                    status = Constants.failedStatus
                    isImageLoaded = false
                }
                loadCount += 1
            }
            .frame(width: 400, height: 400)
            .clipped()
            .id(reloadTrigger)
    }
    
    private var statusView: some View {
        VStack(spacing: 8) {
            Text("Cache size: \(cacheManager.cacheSize / 1024) KB")
            Text("Load count: \(loadCount)")
            Text("Status: \(status)")
        }
        .font(.footnote)
    }
    
    private var actionButtonsView: some View {
        HStack {
            Button(Constants.reloadImageTitle) {
                reloadTrigger = UUID()
            }
            .disabled(!isImageLoaded)
            .frame(maxWidth: .infinity)
            
            Button(Constants.clearCacheTitle) {
                cacheManager.clearCache()
                status = Constants.clearCacheMessage
                loadCount = 0
                reloadTrigger = UUID()
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
    }
}
