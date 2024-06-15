//
//  PopularMoviesViewModel.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 14.06.2024.
//

import Foundation

class PopularMoviesViewModel: ObservableObject {
    @Published var nowPlayingMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []

    @Published var isNowPlayingLoaded = false
    @Published var isPopularLoaded = false
    @Published var isTopRatedLoaded = false
    
    private let movieService = MovieService()
    
    func loadMovies() {
        let group = DispatchGroup()
        
        group.enter()
        movieService.loadMovies(from: .nowPlaying) { [weak self] movies, error in
            defer { group.leave() }
            guard let self = self else { return }
            if let error = error {
                print("Error fetching now playing movies: \(error)")
            } else if let movies = movies {
                DispatchQueue.main.async {
                    self.nowPlayingMovies = movies
                    self.isNowPlayingLoaded = true
                }
            }
        }
        
        group.enter()
        movieService.loadMovies(from: .popular) { [weak self] movies, error in
            defer { group.leave() }
            guard let self = self else { return }
            if let error = error {
                print("Error fetching popular movies: \(error)")
            } else if let movies = movies {
                DispatchQueue.main.async {
                    self.topRatedMovies = movies
                    self.isPopularLoaded = true
                }
            }
        }
        
        group.enter()
        movieService.loadMovies(from: .topRated) { [weak self] movies, error in
            defer { group.leave() }
            guard let self = self else { return }
            if let error = error {
                print("Error fetching top rated movies: \(error)")
            } else if let movies = movies {
                DispatchQueue.main.async {
                    self.popularMovies = movies
                    self.isTopRatedLoaded = true
                }
            }
        }
        
        group.notify(queue: .main) {
            print("All movies loaded")
        }
    }
}

