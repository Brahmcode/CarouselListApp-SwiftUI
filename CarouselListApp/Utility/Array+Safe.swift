//
//  Array+Safe.swift
//  CarouselListApp
//
//  Created by Bhavin on 14/04/25.
//

import Foundation

/// Safe access to array indices
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
