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
                Label("Your Styles", systemImage: "tshirt")
            }
            
            //example
            ContentView().tabItem {
                Label("Profile", systemImage: "person")
            }
        }.tint(Color("yellow")).onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
        .background(.white)
    }
}

struct TabViewComponents_Previews: PreviewProvider {
    static var previews: some View {
        TabViewComponents()
    }
}
