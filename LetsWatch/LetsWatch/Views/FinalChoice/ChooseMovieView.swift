//
//  ChooseMovieView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 13.06.2024.
//

import SwiftUI

struct ChooseMovieView: View {
    @StateObject var viewModel: FilterViewModel
    let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var selectedMovieIndex: Int?
    @State private var showMovieModal = false

    var body: some View {
        VStack {
            Text("Select one movie")
                .fontWeight(.bold)
            ScrollView {
                LazyVGrid(columns: gridColumns, spacing: 8) {
                    ForEach(viewModel.finalCards.indices, id: \.self) { index in
                        MovieCell(movie: viewModel.finalCards[index].movie, isSelected: index == selectedMovieIndex)
                            .aspectRatio(contentMode: .fill)
                            .padding(8)
                            .onTapGesture {
                                selectedMovieIndex = index
                            }
                    }
                }
                .padding()
                NavigationLink {
                    HomeView().navigationBarBackButtonHidden(true)
                } label: {
                    ButtonView(title: "Lets Watch!")
                }
                
                NavigationLink {
                    RouletteView(viewModel: viewModel)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Choose one randomly for me")
                        .foregroundStyle(Color("Primary"))
                        .fontWeight(.bold)
                }
                .padding(.bottom)

            }
          
        }
    }
}

#Preview {
    ChooseMovieView(viewModel: FilterViewModel())
}
