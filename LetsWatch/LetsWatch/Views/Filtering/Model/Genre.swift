//
//  Genre.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import Foundation

struct Genre: Identifiable, Hashable {
    let id: Int
    let name: String
}

let genres = [
    Genre(id: 28, name: "Action"),
    Genre(id: 12, name: "Adventure"),
    Genre(id: 16, name: "Animation"),
    Genre(id: 35, name: "Comedy"),
    Genre(id: 80, name: "Crime"),
    Genre(id: 18, name: "Drama"),
    Genre(id: 10751, name: "Family"),
    Genre(id: 14, name: "Fantasy"),
    Genre(id: 36, name: "History"),
    Genre(id: 27, name: "Horror"),
    Genre(id: 10402, name: "Music"),
    Genre(id: 9648, name: "Mystery"),
    Genre(id: 10749, name: "Romance"),
    Genre(id: 878, name: "Sci-Fi"),
    Genre(id: 10770, name: "TV Movie"),
    Genre(id: 53, name: "Thriller"),
    Genre(id: 10752, name: "War"),
    Genre(id: 37, name: "Western"),
]

func genreName(forID genreID: Int) -> String {
    if let genre = genres.first(where: { $0.id == genreID }) {
        return genre.name
    } else {
        return "Unknown"
    }
}
