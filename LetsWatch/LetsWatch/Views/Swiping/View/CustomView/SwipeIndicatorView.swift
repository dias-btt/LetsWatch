//
//  SwipeIndicatorView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import SwiftUI

struct SwipeIndicatorView: View {
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack{
            Text("WATCH")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 120, height: 40)
                )
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset / SizeConstants.screenCutoff))
            
            Spacer()
            
            Text("SKIP")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 120, height: 40)
                )
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset / SizeConstants.screenCutoff) * -1)

        }
        .padding(40)
    }
}

#Preview {
    SwipeIndicatorView(xOffset: .constant(20))
}
