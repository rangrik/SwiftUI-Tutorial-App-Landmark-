//
//  CategoryRow.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/26/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            if #available(iOS 17.0, *) {
                                LandmarkDetails(landmark: landmark)
                            } else {
                                // Fallback on earlier versions
                            }
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 180)
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        let landmarks = ModelData().landmarks
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(5))
        )
    } else {
        // Fallback on earlier versions
    }
}
