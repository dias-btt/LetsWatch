//
//  MovieView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 08.06.2024.
//

import SwiftUI

struct MovieView: View {
    @Environment(\.dismiss) var dismiss
    let movie: Movie
    
    var body: some View {
        VStack{
            HStack{
                Text(movie.original_title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                   dismiss()
                }, label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("Primary"))
                })
            }
            .padding(.horizontal)
            
            ScrollView(showsIndicators: false){
                VStack{
                    ImageView(path: movie.poster_path)
                    MovieDetailsView(movie: movie)
                }
                .padding(.horizontal)
            }
        }
    }
}

extension Movie {
    var formattedReleaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: release_date) else {
            return "Unknown Date"
        }
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        return dateFormatter.string(from: date)
    }
}
