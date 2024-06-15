//
//  FilterMoviesView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 21.05.2024.
//

import SwiftUI

struct FilterMoviesView: View {
    @Binding var selectedGenres: [Int]
    @Binding var releaseYear: Int
    @Binding var minVoteAverage: Double
    @Binding var maxVoteAverage: Double
    @Binding var isLoading: Bool

    var selectedGenresText: String {
        selectedGenres.map { genreID in
            genres.first { $0.id == genreID }?.name ?? ""
        }.joined(separator: ", ")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GenreSelectionView(selectedGenres: $selectedGenres).navigationBarBackButtonHidden(true)) {
                    Rectangle()
                        .fill(Color("Primary"))
                        .frame(height: 40)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Text(selectedGenres.isEmpty ? "Select Genres" : selectedGenresText)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .padding(.horizontal)
                        )
                }
                .disabled(isLoading)
            }
            .padding()
        }

    }
    
    func filterMovies() {
        // Perform filtering logic here based on selected filters
        // You can fetch movies from API or filter from local data
        print("Filtering movies...")
        print("Selected Genre: \(selectedGenres)")
        print("Release Year: \(releaseYear)")
        print("Minimum Vote Average: \(minVoteAverage)")
        print("Maximum Vote Average: \(maxVoteAverage)")
        // Update movie list with filtered results
    }
}


extension Date {
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
}
