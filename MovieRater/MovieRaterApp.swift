//
//  MovieRaterApp.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import SwiftUI
import SwiftData

@main
struct MovieRaterApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MovieEntry.self,
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
            MovieViewController()
        }
        .modelContainer(sharedModelContainer)
    }
}
