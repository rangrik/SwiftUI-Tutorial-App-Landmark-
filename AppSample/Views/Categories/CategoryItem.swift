//
//  CategoryItem.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/27/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        CategoryItem(landmark: ModelData().landmarks[0])
    } else {
        // Fallback on earlier versions
    }
}
