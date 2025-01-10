//
//  ProfileLoginView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-29.
//

import SwiftUI

struct ProfileLoginView: View {
    @State private var showLoginSheet = false
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Log in to start planning your next trip")
                    .font(.subheadline)
            }

            MHPrimaryButton(title: "Log in") {
                showLoginSheet.toggle()
            }

            HStack {
                Text("Don't have an account?")

                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
        }
        .sheet(isPresented: $showLoginSheet) {
            LoginView()
        }
    }
}

#Preview {
    ProfileLoginView()
        .environmentObject(ContentViewModel(authService: AuthService(), userService: UserService()))
}
