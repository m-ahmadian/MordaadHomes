//
//  MHBackButton.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-29.
//

import SwiftUI

struct MHBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.black)
                .background {
                    Circle()
                        .fill(.white)
                        .frame(width: 32, height: 32)
                }
                // TODO: Check this top padding on a device
                .padding(.top, 40)
                .padding(32)
        }
    }
}

#Preview {
    MHBackButton(action: {})
}
