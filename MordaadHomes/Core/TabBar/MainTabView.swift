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
    @StateObject private var exploreViewModel: ExploreViewModel
    
    init(service: AuthService) {
        self.service = service
        self._exploreViewModel = StateObject(wrappedValue: ExploreViewModel(service: ExploreService()))
    }
    
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label("Favorites", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .environmentObject(exploreViewModel)
        .environmentObject(contentViewModel)
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
        .environmentObject(ContentViewModel(authService: AuthService(), userService: UserService()))
}
