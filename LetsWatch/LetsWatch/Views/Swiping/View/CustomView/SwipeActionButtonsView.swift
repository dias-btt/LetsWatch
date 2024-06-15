//
//  SwipeActionButtonsView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 08.06.2024.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    @ObservedObject var viewModel: FilterViewModel
    
    var body: some View {
        HStack(spacing: 32){
            Button(action: {
                viewModel.buttonSwipeAction = .reject
            }, label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.red)
                    .background(
                        Circle()
                            .fill(.white)
                            .shadow(radius: 6)
                            .frame(width: 48, height: 48)
                    )
            })
            .frame(width: 48, height: 48)
            
            Button(action: {
                viewModel.buttonSwipeAction = .like
            }, label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.green)
                    .background(
                        Circle()
                            .fill(.white)
                            .shadow(radius: 6)
                            .frame(width: 48, height: 48)
                    )
            })
            .frame(width: 48, height: 48)

        }
    }
}
