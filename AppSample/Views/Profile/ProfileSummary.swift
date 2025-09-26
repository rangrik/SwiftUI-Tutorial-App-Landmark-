//
//  ProfileSummary.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/27/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

@available(iOS 17.0, *)
struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData

    var profile: Profile


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)


                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)


                Divider()


                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)


                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}


#Preview {
    if #available(iOS 17.0, *) {
        ProfileSummary(profile: Profile.default)
            .environment(ModelData())
    } else {
        // Fallback on earlier versions
    }
}
