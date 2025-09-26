//
//  CircleImage.swift
//  AppSample
//
//  Created by Pranav  Kanade on 9/26/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 1)
            }
            .shadow(radius: 20)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        CircleImage(image: ModelData().landmarks[0].image)
    } else {
        // Fallback on earlier versions
    }
}
