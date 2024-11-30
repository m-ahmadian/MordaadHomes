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

// I’m going to add a swipe category on top of the explore view and make it like a homeadvisor app, where there are categories of the projects, like custom build, renovation, plumbing, HVAC, air duct cleaning and general contractor like swiping horizontal cells, then when you choose a category, the exploreView gets updated with relevant listings. Make necessary changes in the app, in terms of architecture, UI, models and views to apply that shift
