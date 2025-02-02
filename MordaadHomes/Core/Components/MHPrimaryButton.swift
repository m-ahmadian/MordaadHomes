//
//  MHPrimaryButton.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-24.
//

import SwiftUI

struct MHPrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: UIScreen.main.bounds.width - 48, height: 48)
                .background(.pink)
                .cornerRadius(8)
        }
    }
}

#Preview {
    MHPrimaryButton(title: "Log in") {
        print("Log in tapped")
    }
}
