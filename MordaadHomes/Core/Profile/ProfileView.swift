//
//  ProfileView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-23.
//

import SwiftUI

struct ProfileView: View {
    private let service: AuthService
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    init(service: AuthService, user: User?) {
        self.service = service
    }
    
    var body: some View {
        VStack {
            // MARK: - Profile Login View
            if !contentViewModel.isAuthenticated {
                ProfileLoginView(service: service)
            } else if let user = contentViewModel.currentUser {
                UserProfileHeaderView(user: user)
                    .padding()
            }

            // MARK: - Profile Options
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(
                    imageName: "questionmark.circle",
                    title: "Visit the help center")
            }
            .padding(.vertical)
            
            if contentViewModel.isAuthenticated {
                Button("Log Out") {
                    service.signout()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView(service: AuthService(), user: DeveloperPreview.shared.user)
}
