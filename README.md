# CarouselListApp SwiftUI

![Simulator Screenshot - iPhone](https://github.com/user-attachments/assets/9d9f800b-7233-471b-b5e2-630bbca2ce3b)

**📦 CarouselListApp Project Architecture Breakdown**

<img width="304" alt="Screenshot 2025-04-16 at 3 47 02 PM" src="https://github.com/user-attachments/assets/3d4cf972-8aef-4cfc-b7bf-924f77cf38ae" />

📘 **Explanation of Each Section**

1. ✅ @main — App Entry Point
The @main attribute marks the entry point of the app.
Only one file should contain @main. In our case, that's CarouselListApp.swift.
✅ CarouselListAppApp.swift should be commented or deleted to avoid multiple entry points.


2. ✅ sharedModelContainer

let schema = Schema([Item.self])
let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

This sets up the SwiftData container, similar to Core Data.
Item.self is the data model to persist (e.g., a carousel page).
.isStoredInMemoryOnly = false means the data will be stored on disk and persist across launches.


3. ✅ .modelContainer(...)

.modelContainer(sharedModelContainer)

This injects the SwiftData container into the SwiftUI environment.
Allows views to use @Query, @Environment(\.modelContext) and access the data model without passing the context manually.


4. ✅ Repository + ViewModel Injection

let repository = CarouselRepository()
let viewModel = CarouselListViewModel(repository: repository)

CarouselRepository: Handles the data access layer (e.g., CRUD operations).
CarouselListViewModel: Contains UI logic and state, exposed to the view.
These are injected into the root view (ContentView) as dependencies, making the app modular and testable.

5. ✅ ContentView(viewModel:)

ContentView(viewModel: viewModel)

This is the main SwiftUI view for your app.
It binds to the CarouselListViewModel and reflects data changes.
You can build additional views like StatSheet.swift to show detailed stats or overlays.

6. ✅ Optional Cleanup
🧹 Delete CarouselListAppApp.swift since your new app entry point is CarouselListApp.swift and already marked with @main.


🧠 ✅ Summary of Responsibilities

Layer       File                                    Responsibility
Model       PageItem.swift                          Defines SwiftData entities
Repository  CarouselRepository.swift                Data access, logic abstraction
ViewModel   CarouselListViewModel.swift             UI state, logic, and transformation
View        ContentView.swift, StatSheet            SwiftUI UI, bound to ViewModel
App         CarouselListApp.swift                   App bootstrap, dependency injection, setup


✅ What’s Next?

Let me know if you'd like help with:

🔢 Adding the StatSheet View logic
🧪 Unit testing ViewModel or Repository
✏️ Editing or deleting items (CRUD operations)
🎠 Image carousel with TabView + paging
I'm happy to walk you through any part—just say the word!



