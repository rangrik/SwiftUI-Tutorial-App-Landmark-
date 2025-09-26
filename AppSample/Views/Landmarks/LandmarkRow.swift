//
//  LandmarkRow.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/26/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundStyle(.yellow)
            }
        }.padding(.vertical, 4)
    }
}

//#Preview ("Turtle Rock") {
//    LandmarkRow(landmark: landmarks[0])
//}
//
//#Preview ("Salomon Creek") {
//    LandmarkRow(landmark: landmarks[1])
//}

#Preview ("Together") {
    Group {
        if #available(iOS 17.0, *) {
            LandmarkRow(landmark: ModelData().landmarks[0])
            LandmarkRow(landmark: ModelData().landmarks[1])
        } else {
            // Fallback on earlier versions
        }

    }
}
