//
//  Borrowl_ndApp.swift
//  Borrowlænd
//
//  Created by Emile Pedarros on 30/01/2021.
//

import SwiftUI

@main
struct Borrowl_ndApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
