//
//  PopularMovieView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 14.06.2024.
//

import SwiftUI

struct PopularMovieView: View {
    let movie: Movie
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context

    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text(movie.original_title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                
                ZStack{
                    ImageView(path: movie.backdrop_path)
                }
                .aspectRatio(16/9, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                MovieDetailsView(movie: movie)
                
                Spacer()
                
                Button{
                    let movie = MovieData(id: movie.id, original_title: movie.original_title, overview: movie.overview, release_date: movie.release_date, popularity: movie.popularity, poster_path: movie.poster_path, vote_average: movie.vote_average, vote_count: movie.vote_count, genre_ids: movie.genre_ids, timestamp: Date())
                    context.insert(movie)
                    do{
                        try context.save()
                    } catch {
                        print("DEBUG: context saving error: \(error)")
                    }
                    dismiss()
                } label: {
                    ButtonView(title: "I'll watch this")
                }
            }
            .padding()
        }
    }
}
