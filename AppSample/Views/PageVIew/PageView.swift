//
//  PageView.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/27/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)})
    } else {
        // Fallback on earlier versions
    }
}
