//
//  CardStackView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel: FilterViewModel
    
    var body: some View {
        if !viewModel.isLoaded{
            VStack {
                Text("Finding movies for you...")
                    .font(.headline)
                    .padding()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
        else if viewModel.cards.isEmpty{
            VStack(alignment: .center){
                Spacer()
                Text("You've run out of movie options...")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Press continue to select or randomly get one movie to watch.")
                    .font(.headline)
                    .foregroundStyle(Color.black.opacity(0.5))
                    .multilineTextAlignment(.center)
                Spacer()
                NavigationLink {
                    ChooseMovieView(viewModel: viewModel)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    ButtonView(title: "Continue")
                }
                .padding(.bottom)
            }
        } else {
            VStack{
                ZStack {
                    ForEach(viewModel.cards) { card in
                        CardView(viewModel: viewModel, card: card)
                    }
                }
                .padding(.bottom)
                SwipeActionButtonsView(viewModel: viewModel)
            }
        }
    }
}

#Preview{
    CardStackView(viewModel: FilterViewModel())
}
