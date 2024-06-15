//
//  RateMovieView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 13.06.2024.
//

import SwiftUI

struct RateMovieView: View {
    var movie: MovieData
    @State private var rating: Int = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                ImageView(path: movie.poster_path)
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight * 0.9)
                    .padding(.bottom)
                Text("How would you rate this movie?")
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                HStack {
                    ForEach(1..<6) { index in
                        Image(systemName: index <= movie.rating ? "star.fill" : "star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(index <= movie.rating ? .yellow : .gray)
                            .onTapGesture {
                                movie.rating = index
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
        }
        .navigationTitle(movie.original_title)
    }
}



