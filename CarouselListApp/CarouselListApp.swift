//
//  CarouselListApp.swift
//  CarouselListApp
//
//  Created by Bhavin on 14/04/25.
//

import SwiftUI
import SwiftData

@main
struct CarouselListApp: App {
    
    // MARK: - Create and configure the shared SwiftData model container
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self // Register the SwiftData model type here
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false // Set to true for in-memory use (e.g. testing)
        )
        
        do {
            // Try creating the model container using the configuration
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            // If anything fails, crash the app with detailed error
            fatalError("❌ Could not create ModelContainer: \(error)")
        }
    }()
    
    // MARK: - App body
    var body: some Scene {
        WindowGroup {
            // Create repository and inject into ViewModel
            let repository = CarouselRepository()
            let viewModel = CarouselListViewModel(repository: repository)

            // Inject ViewModel into the root view
            ContentView(viewModel: viewModel)
        }
        .modelContainer(sharedModelContainer) // Attach the model container here
    }
}
