//
//  CardView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import SwiftUI

struct CardView: View {
    @StateObject var viewModel: FilterViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    @State private var showMovieModal = false
    let card: Card
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                ImageView(path: card.movie.poster_path)
                SwipeIndicatorView(xOffset: $xOffset)
            }
                
            MovieInfoView(movie: card.movie, showMovieModal: $showMovieModal)
                .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $showMovieModal){
            MovieView(movie: card.movie)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
          onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    onDragChanged(value)
                })
                .onEnded({ value in
                    onDragEnded(value)
                })
        )
    }
}

private extension CardView{
    
    func returnToCenter(){
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight() {
        xOffset = 5000
        degrees = 12
        viewModel.addFinalCard(card: card)
        viewModel.removeCard(card: card)
    }
    
    func swipeLeft(){
        xOffset = -5000
        degrees = -12
        viewModel.removeCard(card: card)
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?) {
        guard let action else {return}
        
        let topCard = viewModel.cards.last
        
        if topCard == card{
            switch action{
            case .like:
                swipeRight()
            case .reject:
                swipeLeft()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff{
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}
