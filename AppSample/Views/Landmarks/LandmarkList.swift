//
//  LandmarkList.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/26/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"


        var id: FilterCategory { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Show Favorites Only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        LandmarkList()
            .environment(ModelData())
    } else {
        // Fallback on earlier versions
    }
}
