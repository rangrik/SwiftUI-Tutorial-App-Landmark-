//
//  ContentView.swift
//  macApp
//
//  Created by Pranav  Kanade on 9/27/25.
//  Copyright © 2025 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
