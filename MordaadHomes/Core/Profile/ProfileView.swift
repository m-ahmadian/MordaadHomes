//
//  ProfileView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        VStack {
            // MARK: - Profile Login View
            if !contentViewModel.isAuthenticated {
                ProfileLoginView()
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
                    contentViewModel.logout()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
