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
            VStack(alignment: .leading, spacing: 32) {

                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to start planning your next trip")
                }

                MHPrimaryButton(title: "Log in") {
                    print("Log in")
                }

                HStack {
                    Text("Don't have an account?")

                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
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
        }
        .padding()
    }
}

#Preview {
    ProfileView(service: AuthService(), user: DeveloperPreview.shared.user)
}
