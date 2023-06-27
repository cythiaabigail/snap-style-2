//
//  TabViewComponents.swift
//  snap-style
//
//  Created by dary winata nugraha djati on 24/06/23.
//

import SwiftUI

//components for tabbar
struct TabViewComponents: View {
    var body: some View {
        TabView {
            RecommendationView().tabItem {
                Label("", systemImage: "house")
            }
            
            //example
            ContentView().tabItem {
                Label("", systemImage: "person")
            }
        }.tint(Color("yellow")).onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct TabViewComponents_Previews: PreviewProvider {
    static var previews: some View {
        TabViewComponents()
    }
}
