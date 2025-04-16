//
//  ContentView.swift
//  ContentView
//
//  Created by Bhavin on 14/04/25.
//

import SwiftUI

/// Main screen with carousel, search bar, and filtered list
struct ContentView: View {
    @ObservedObject var viewModel: CarouselListViewModel
    @State private var showStats = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color(red: 0.94, green: 0.99, blue: 0.96)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Carousel
                TabView(selection: $viewModel.selectedIndex) {
                    ForEach(viewModel.pages.indices, id: \.self) { index in
                        Image(viewModel.pages[index].imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .tag(index)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .cornerRadius(15)
                .padding(.horizontal, 16)

                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("Search", text: $viewModel.searchText)
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(12)
                .padding([.horizontal, .top], 16)
                .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 1)

                // Filtered list
                List(viewModel.filteredList, id: \.self) { item in
                    HStack {
                        Image(viewModel.pages[safe: viewModel.selectedIndex]?.imageName ?? "")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(item).fontWeight(.bold)
                            Text("List item subtitle List item subtitle List item subtitle").font(.subheadline).foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(red: 0.86, green: 0.96, blue: 0.93))
                    .cornerRadius(15)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .padding(.vertical, 16)
            }
            .padding(.horizontal, 16)

            // Floating button
            Button(action: {
                showStats.toggle()
            }) {
                Image(systemName: "ellipsis")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding()
            .sheet(isPresented: $showStats) {
                StatSheet(stats: viewModel.statsForCurrentPage())
            }
        }
    }
}
