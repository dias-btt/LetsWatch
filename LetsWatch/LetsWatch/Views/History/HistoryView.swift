//
//  HistoryView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 12.06.2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query(sort: \MovieData.timestamp, order: .reverse) var movies: [MovieData]
    var body: some View {
        NavigationView{
            VStack{
                Text("History")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                if !movies.isEmpty{
                    ScrollView{
                        VStack(alignment: .leading){
                            ForEach(movies) { movie in
                                NavigationLink(destination: RateMovieView(movie: movie).navigationBarBackButtonHidden(true)) {
                                    HStack{
                                        Text(movie.original_title)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.white)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        VStack{
                                            Text("Watched on")
                                                .font(.headline)
                                                .foregroundStyle(Color.white)
                                            Text(movie.formattedTimestamp)
                                                .font(.headline)
                                                .foregroundStyle(Color.white)
                                        }
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color("Primary").opacity(0.6))
                                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                    )
                                }
                                .padding(.horizontal)
                            }
                            Spacer()
                        }
                    }
                } else {
                    ContentUnavailableView("No movies", systemImage: "list.bullet.rectangle.portrait", description: Text("Start finding movies to watch"))
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
