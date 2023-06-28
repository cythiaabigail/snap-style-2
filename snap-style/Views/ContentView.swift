//
//  ContentView.swift
//  snap-style
//
//  Created by David Mahbubi on 27/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isNotOnboarding") var isNotOnboarding: Bool = false
    @AppStorage("height") var height: String = ""
    @AppStorage("weight") var weight: String = ""
    @AppStorage("name") var name: String = ""
    @AppStorage("age") var age: String = ""
    @AppStorage("gender") var gender: String = ""
    
    var body: some View {
        NavigationStack {
            if (isNotOnboarding == false) {
                OnBoardingView()
            } else {
                TabViewComponents()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
