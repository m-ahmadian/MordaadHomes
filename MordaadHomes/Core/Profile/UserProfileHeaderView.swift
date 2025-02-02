//
//  UserProfileHeaderView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-29.
//

import SwiftUI

struct UserProfileHeaderView: View {
    let user: User
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 27.5)
                .fill(Color.white)
                .frame(width: 300, height: 200, alignment: .center)
                .shadow(radius: 10)
            
            VStack(spacing: 12) {
                CircularProfileImageView(
                    imageURL: user.profileImageURL,
                    size: .xLarge
                )
                
                VStack {
                    Text(user.fullName)
                        .font(.headline)
                    
                    Text(user.accountType.description)
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    UserProfileHeaderView(user: DeveloperPreview.shared.user)
}
