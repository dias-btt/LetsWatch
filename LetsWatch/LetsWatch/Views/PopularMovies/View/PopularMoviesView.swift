//
//  PopularMoviesView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 14.06.2024.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var viewModel = PopularMoviesViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 40){
                    VStack(alignment: .leading){
                        Text("Now Playing")
                            .font(.title)
                            .fontWeight(.bold)
                        if viewModel.isNowPlayingLoaded{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach(viewModel.nowPlayingMovies){ movie in
                                        NavigationLink{
                                            PopularMovieView(movie: movie).navigationBarBackButtonHidden(true)
                                        } label: {
                                            MovieVerticalCard(movie: movie)
                                                .frame(width: 250, height: 400)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Popular")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, -20)
                        if viewModel.isPopularLoaded{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach(viewModel.popularMovies){ movie in
                                        NavigationLink{
                                            PopularMovieView(movie: movie).navigationBarBackButtonHidden(true)
                                        } label: {
                                            MovieHorizontalCard(movie: movie)
                                                .frame(width: 350, height: 300)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Top Rated")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, -20)
                        if viewModel.isTopRatedLoaded{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach(viewModel.topRatedMovies){ movie in
                                        NavigationLink{
                                            PopularMovieView(movie: movie).navigationBarBackButtonHidden(true)
                                        } label: {
                                            MovieHorizontalCard(movie: movie)
                                                .frame(width: 350, height: 300)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .onAppear{
                    viewModel.loadMovies()
                }
            }
        }
    }
}
