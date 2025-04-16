//
//  CarouselRepository.swift
//  CarouselListApp
//
//  Created by Bhavin on 14/04/25.
//

import Foundation

/// Responsible for providing data (simulated here; in real cases this could be from network/db)
protocol CarouselRepositoryProtocol {
    func fetchPageItems() -> [PageItem]
}

/// Concrete implementation of repository
class CarouselRepository: CarouselRepositoryProtocol {
    func fetchPageItems() -> [PageItem] {
        return [
            PageItem(imageName: "1", listItems: ["Apple", "Avocado", "Apricot", "Almond"]),
            PageItem(imageName: "2", listItems: ["Banana", "Blueberry", "Blackberry", "Breadfruit"]),
            PageItem(imageName: "3", listItems: ["Cherry", "Cranberry", "Clementine", "Currant"]),
            PageItem(imageName: "4", listItems: ["Date", "Dragonfruit", "Durian", "Damson"])
        ]
    }
}
