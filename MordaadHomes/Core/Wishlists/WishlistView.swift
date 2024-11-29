//
//  WishlistView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                   
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Log in to view your wishlists")
                            .font(.headline)
                        
                        Text("You can create, view or edit wishlists once you've logged in")
                            .font(.footnote)
                    }
                    .frame(width: 300)
                    .padding(.vertical)
                    
                    MHPrimaryButton(title: "Log in") {
                        print("Log in")
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Whishlists")
        }
    }
}

#Preview {
    WishlistView()
}
