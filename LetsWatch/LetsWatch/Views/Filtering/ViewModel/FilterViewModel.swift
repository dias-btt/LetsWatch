//
//  FilterViewModel.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import Foundation
import SwiftUI

class FilterViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoaded = false
    @Published var selectedGenres: [Int] = []
    @Published var releaseYear: Int = 0
    
    @Published var cards = [Card]()
    @Published var finalCards = [Card]()
    
    @Published var buttonSwipeAction: SwipeAction?
    private let movieService = MovieService()
    
    func addFinalCard(card: Card){
        finalCards.append(card)
    }
    
    func removeCard(card: Card){
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {return}
        cards.remove(at: index)
    }

    func applyFilters(minVA: Double, maxVA: Double, lang: String, releaseYearRange: [Int]) {
        movieService.fetchMovies(selectedGenres: selectedGenres, releaseYear: releaseYear, minVoteAverage: minVA, maxVoteAverage: maxVA, language: lang, releaseYearRange: releaseYearRange) { [weak self] movies, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    print("Error fetching movies: \(error)")
                } else if let movies = movies {
                    self.movies = movies
                    self.isLoaded = true
                    self.cards = self.movies.map { Card(movie: $0) }
                }
            }
        }
    }
}
