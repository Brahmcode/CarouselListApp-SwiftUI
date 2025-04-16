//
//  StatSheet.swift
//  CarouselListApp
//
//  Created by Bhavin on 14/04/25.
//

import SwiftUI

/// Displays top statistics in a sheet
struct StatSheet: View {
    let stats: [String: Int]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("List \(stats["Total Items"] ?? 0) items").font(.headline)

            ForEach(stats.sorted(by: { $0.key < $1.key }).filter { $0.key != "Total Items" }, id: \.key) { key, value in
                Text("\(key) = \(value)")
            }

            Spacer()
        }
        .padding()
    }
}
