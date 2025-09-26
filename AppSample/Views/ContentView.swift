/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            LandmarkList()
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        ContentView()
            .environment(ModelData())
    } else {
        // Fallback on earlier versions
    }
}
