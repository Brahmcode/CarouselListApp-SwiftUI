//
//  CarouselListViewModel.swift
//  CarouselListApp
//
//  Created by Bhavin on 14/04/25.
//

import Foundation

/// ViewModel connecting data from repository to view
class CarouselListViewModel: ObservableObject {
    @Published var pages: [PageItem] = []
    @Published var selectedIndex: Int = 0
    @Published var searchText: String = ""

    private let repository: CarouselRepositoryProtocol

    init(repository: CarouselRepositoryProtocol) {
        self.repository = repository
        loadPages()
    }

    /// Loads page items using the repository
    func loadPages() {
        pages = repository.fetchPageItems()
    }

    /// Filters list items based on search text
    var filteredList: [String] {
        guard !searchText.isEmpty else {
            return pages[safe: selectedIndex]?.listItems ?? []
        }
        return pages[safe: selectedIndex]?.listItems.filter {
            $0.lowercased().contains(searchText.lowercased())
        } ?? []
    }

    /// Computes statistics for the current page
    func statsForCurrentPage() -> [String: Int] {
        let list = pages[safe: selectedIndex]?.listItems ?? []
        var charCount: [Character: Int] = [:]

        list.joined().lowercased().forEach { char in
            if char.isLetter {
                charCount[char, default: 0] += 1
            }
        }

        var result: [String: Int] = ["Total Items": list.count]
        let topChars = charCount.sorted { $0.value > $1.value }.prefix(3)
        topChars.forEach { result[String($0.key)] = $0.value }

        return result
    }
}
