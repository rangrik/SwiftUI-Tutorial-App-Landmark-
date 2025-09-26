/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@available(iOS 17.0, *)
@main
struct MyApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
