//
//  CategoryItem.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-30.
//

import SwiftUI

struct CategoryItem: View {
    let category: ProjectCategory
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: category.systemImageName)
                .font(.system(size: 30))
                .foregroundStyle(isSelected ? .white : .gray)
                .frame(width: 60, height: 60)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .clipShape(Circle())
            
            Text(category.rawValue)
                .font(.caption)
                .foregroundStyle(isSelected ? .blue : .gray)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 80)
            
            Spacer()
        }
    }
}

#Preview {
    CategoryItem(category: .customBuild, isSelected: true)
}
