//
//  MainTabView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import SwiftUI

struct MainTabView: View {
    private let service: AuthService
    @EnvironmentObject var contentViewModel: ContentViewModel
    @StateObject private var exploreViewModel = ExploreViewModel(service: ExploreService())
    
    init(service: AuthService) {
        self.service = service
    }
    
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label("Favorites", systemImage: "heart") }
            
            ProfileView(service: service, user: contentViewModel.currentUser)
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .environmentObject(exploreViewModel)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            UITabBar.appearance().standardAppearance = appearance
        }
        .tint(.pink)
    }
}

#Preview {
    MainTabView(service: AuthService())
}
