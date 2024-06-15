//
//  Card.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import Foundation

struct Card: Equatable {
    let movie: Movie
}

extension Card: Identifiable {
    var id: Int {return movie.id}
}
