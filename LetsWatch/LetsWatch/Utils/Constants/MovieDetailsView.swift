//
//  MovieDetailsView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 14.06.2024.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        VStack{
            HStack{
                Image("star")
                    .resizable()
                    .frame(width: 26, height: 26)
                Text(String(format: "%.1f", movie.vote_average))
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Text(movie.formattedReleaseDate)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
            
            Text(movie.overview)
                .font(.title3)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(movie.genre_ids, id: \.self) { genreID in
                        Text(genreName(forID: genreID))
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(Color("Primary"))
                            .foregroundStyle(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .padding(.leading)
            .ignoresSafeArea()
        }
    }
}
