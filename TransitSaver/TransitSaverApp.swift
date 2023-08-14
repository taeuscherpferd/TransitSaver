//
//  TransitSaverApp.swift
//  TransitSaver
//
//  Created by Kailean O'Keefe on 8/14/23.
//

import SwiftUI

@main
struct TransitSaverApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
