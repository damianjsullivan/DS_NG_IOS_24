//
//  Netgear_BooksApp.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 03/08/2024.
//

import SwiftUI
import SwiftData

@main
struct Netgear_BooksApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Book.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            BookSearchView()
        }
        .modelContainer(sharedModelContainer)
    }
}
