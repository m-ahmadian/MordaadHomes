//
//  CategoryRow.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2024-11-30.
//

import SwiftUI

struct CategoryRow: View {
    @Binding var selectedCategory: ProjectCategory?
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(ProjectCategory.allCases) { category in
                        CategoryItem(category: category, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding()
            }
        }
}

#Preview {
    CategoryRow(selectedCategory: .constant(.customBuild))
}
