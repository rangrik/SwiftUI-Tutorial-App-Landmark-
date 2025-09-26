/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tabs = .featured

    enum Tabs {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            if #available(iOS 17.0, *) {
                CategoryHome()
                    .tabItem {
                        Label("", systemImage: "star")
                    }
                    .tag(Tabs.featured)
                
                LandmarkList()
                    .tabItem {
                        Label("", systemImage: "list.bullet")
                    }
                    .tag(Tabs.list)
            } else {
                // Fallback on earlier versions
            }
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
