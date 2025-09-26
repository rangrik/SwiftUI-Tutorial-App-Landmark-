//
//  LandmarkDetails.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/26/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct LandmarkDetails: View {
    @Environment(ModelData.self) var modelData

    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            MapView(coordinates: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .padding(.trailing, 8)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                

                Divider()
                Text("About the \(landmark.name)")
                    .font(.title2)
                    .padding(.top, 12)
                    .padding(.bottom, 4)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        LandmarkDetails(landmark: ModelData().landmarks[1])
            .environment(ModelData())
    } else {
        // Fallback on earlier versions
    }
}
