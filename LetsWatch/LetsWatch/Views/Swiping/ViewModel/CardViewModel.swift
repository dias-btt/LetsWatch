//
//  CardViewModel.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cards = [Card]()
    
    func updateCards(with movies: [Movie]) {
        // Transform the array of movies into cards
        self.cards = movies.map { Card(movie: $0) }
        print("Cards are \(self.cards)")
    }
}
