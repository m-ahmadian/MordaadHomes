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
            VStack(alignment: .leading, spacing: 32) {
               
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                
                MHPrimaryButton(title: "Log in") {
                    print("Log in")
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Whishlists")
        }
    }
}

#Preview {
    WishlistView()
}
