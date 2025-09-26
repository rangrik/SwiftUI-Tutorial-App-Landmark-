//
//  CategoryHome.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/26/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct CategoryHome: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        CategoryHome()
            .environment(ModelData())
    } else {
        // Fallback on earlier versions
    }
}
