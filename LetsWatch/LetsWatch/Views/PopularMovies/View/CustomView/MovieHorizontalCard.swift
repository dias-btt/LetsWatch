//
//  MovieVerticalCard.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 14.06.2024.
//

import SwiftUI

struct MovieHorizontalCard: View {
    let movie: Movie
    var body: some View {
        VStack{
            ZStack{
                ImageView(path: movie.backdrop_path)
            }
            .aspectRatio(16/9, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(movie.original_title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }
    }
}

