//
//  CapsuleTextView.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-12-01.
//

import SwiftUI

struct CapsuleTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.footnote)
            .fontWeight(.medium)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundStyle(.black) // Text color set to black
            .background(
                Capsule()
                    .fill(Color.white) // Capsule background set to white
                    .dropShadow()
            )
            .overlay(
                Capsule()
                    .stroke(lineWidth: 0.5)
                    .foregroundStyle(Color(.systemGray4))
            )
            .padding()
    }
}

#Preview {
    CapsuleTextView(text: "General Contractor")
}
