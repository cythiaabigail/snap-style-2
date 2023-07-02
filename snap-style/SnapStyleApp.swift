//
//  snap_styleApp.swift
//  snap-style
//
//  Created by David Mahbubi on 27/06/23.
//

import SwiftUI

@main
struct SnapStyleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RecommendationView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
