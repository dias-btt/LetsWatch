//
//  RouletteView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 29.05.2024.
//
import SwiftUI
import SwiftData

struct RouletteView: View {
    @Environment(\.modelContext) var context
    @StateObject var viewModel: FilterViewModel
    @StateObject var rouletteViewModel: RouletteViewModel = RouletteViewModel()
    
    @State private var isNextViewActive: Bool = false
        
    var body: some View {
        NavigationView {
            VStack {
                if rouletteViewModel.isSpinning{
                    RouletteAnimationView(viewModel: rouletteViewModel, cards: viewModel.finalCards)
                } else if let selectedMovie = rouletteViewModel.selectedMovie {
                    VStack{
                        CardView(viewModel: viewModel, card: Card(movie: selectedMovie))
                            .transition(.scale)
                            .animation(.easeInOut(duration: 0.5))
                            .padding(.bottom)
                        
                        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $isNextViewActive) { EmptyView() }
                        
                            Button {
                                let movie = MovieData(id: selectedMovie.id, original_title: selectedMovie.original_title, overview: selectedMovie.overview, release_date: selectedMovie.release_date, popularity: selectedMovie.popularity, poster_path: selectedMovie.poster_path, vote_average: selectedMovie.vote_average, vote_count: selectedMovie.vote_count, genre_ids: selectedMovie.genre_ids, timestamp: Date())
                                context.insert(movie)
                                do{
                                    try context.save()
                                } catch {
                                    print("DEBUG: context saving error: \(error)")
                                }
                                isNextViewActive = true
                            } label: {
                                ButtonView(title: "Lets Watch!")
                            }
                        .padding(.horizontal)
                    }
                } else {
                    Text("No cards available")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview{
    RouletteView(viewModel: FilterViewModel())
}
