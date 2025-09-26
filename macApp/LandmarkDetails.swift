//
//  LandmarkDetails.swift
//  macApp
//
//  Created by Pranav  Kanade on 9/27/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct LandmarkDetails: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinates: landmark.locationCoordinate)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let location = CLLocation(latitude: landmark.locationCoordinate.latitude,
                                              longitude: landmark.locationCoordinate.longitude)
                    let destination = MKMapItem(location: location, address: nil)
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            
            VStack(alignment: .leading, spacing: 20){
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                    
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -60)
            
        }
        .navigationTitle(landmark.name)
    }

}


#Preview {
    let modelData = ModelData()
    return LandmarkDetails(landmark: modelData.landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
