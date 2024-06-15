//
//  Movie.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 21.05.2024.
//

import Foundation
import SwiftData

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Identifiable, Decodable, Equatable {
    let id: Int
    let original_title: String
    let overview: String
    let release_date: String
    let popularity: Double
    let poster_path: String?
    let backdrop_path: String?
    let vote_average: Double
    let vote_count: Int
    var genre_ids: [Int]
}

@Model
class MovieData {
    let id: Int
    let original_title: String
    let overview: String
    let release_date: String
    let popularity: Double
    let poster_path: String?
    let vote_average: Double
    let vote_count: Int
    let genre_ids: [Int]
    let timestamp: Date
    var rating: Int
    
    init(id: Int, original_title: String, overview: String, release_date: String, popularity: Double, poster_path: String?, vote_average: Double, vote_count: Int, genre_ids: [Int], timestamp: Date) {
        self.id = id
        self.original_title = original_title
        self.overview = overview
        self.release_date = release_date
        self.popularity = popularity
        self.poster_path = poster_path
        self.vote_average = vote_average
        self.vote_count = vote_count
        self.genre_ids = genre_ids
        self.timestamp = timestamp
        self.rating = 0
    }
    
    var formattedTimestamp: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        return dateFormatter.string(from: timestamp)
    }
}
