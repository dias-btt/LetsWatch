//
//  MovieCell.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 13.06.2024.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
    var isSelected: Bool

    var body: some View {
        VStack {
            ImageView(path: movie.poster_path)

            Text(movie.original_title)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: SizeConstants.movieCellWidth, height: SizeConstants.movieCellHeight)
        .background(isSelected ? Color("Primary") : Color.white)
        .foregroundStyle(isSelected ? .white : .black)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
