//
//  HikeBadge.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/27/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI


struct HikeBadge: View {
    var name: String


    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}


#Preview {
    HikeBadge(name: "Preview Testing")
}
