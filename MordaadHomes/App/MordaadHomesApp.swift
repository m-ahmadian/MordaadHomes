//
//  MordaadHomesApp.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-20.
//

import SwiftUI

@main
struct MordaadHomesApp: App {
    let authService = AuthService()
    let userService = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(authService: authService, userService: userService)
        }
    }
}
