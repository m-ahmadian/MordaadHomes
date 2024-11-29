//
//  ContentView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import SwiftUI

struct ContentView: View {
    private let authService: AuthService
    private let userService: UserService
    
    @StateObject var viewModel: ContentViewModel
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        self._viewModel = StateObject(
            wrappedValue: ContentViewModel(
                authService: authService,
                userService: userService
            )
        )
    }
    
    var body: some View {
        MainTabView(service: authService)
            .environmentObject(viewModel)
    }
}

#Preview {
    ContentView(authService: AuthService(), userService: UserService())
}
