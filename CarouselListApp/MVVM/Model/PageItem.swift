//
//  PageItem.swift
//  CarouselListApp
//
//  Created by Bhavin on 14/04/25.
//

import Foundation

/// Represents a page with an image and associated list of items
struct PageItem: Identifiable {
    let id = UUID()
    let imageName: String
    let listItems: [String]
}

