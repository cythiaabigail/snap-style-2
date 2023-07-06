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
                Label("Style", systemImage: "tshirt")
            }
            .toolbar(.visible, for: .tabBar)
               .toolbarBackground(
                   Color("secondary"),
                   for: .tabBar)
            //example
            ProfileView().tabItem {
                Label("Profile", systemImage: "person")
            }
            .toolbar(.visible, for: .tabBar)
                .toolbarBackground(
                    Color("secondary"),
                    for: .tabBar)
        }.tint(Color("yellow"))
            .navigationBarBackButtonHidden(true)
    }
}

struct TabViewComponents_Previews: PreviewProvider {
    static var previews: some View {
        TabViewComponents()
    }
}
