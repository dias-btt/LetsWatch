//
//  MovieInfoView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import SwiftUI

struct MovieInfoView: View {
    let movie: Movie
    @Binding var showMovieModal: Bool
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text(movie.original_title)
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(String(format: "%.1f", movie.vote_average))
                        .font(.title)
                        .fontWeight(.semibold)
                }
                HStack{
                    Text(formattedDate(from: movie.release_date))
                        .font(.headline)
                        .fontWeight(.regular)
                }
            }
            Spacer()
            
            Button(action: {
                showMovieModal.toggle()
            }, label: {
                Image(systemName: "arrow.up.circle")
                    .fontWeight(.bold)
                    .imageScale(.large)
            })
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

extension MovieInfoView {
    func formattedDate(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-dd-MM"
        guard let date = dateFormatter.date(from: dateString) else {
            return ""
        }
        
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}
