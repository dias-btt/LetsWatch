//
//  RouletteAnimationView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 10.06.2024.
//

import SwiftUI

struct RouletteAnimationView: View {
    @ObservedObject var viewModel: RouletteViewModel
    let cards: [Card]
    @State private var spin: CGFloat = 0.0
    
    private var anglePerSlice: Double {
        360.0 / Double(cards.count)
    }
    
    func offsetDegree(index: Int) -> Double {
        let indexDouble = Double(index)
        let offset = indexDouble * anglePerSlice + anglePerSlice / 2 + spin
        return offset.degreesToRadians
    }
    
    var body: some View {
        if cards.isEmpty {
            Text("No cards")
        } else {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        Wheel(rotation: $spin, segments: cards)
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .rotationEffect(.degrees(spin))
                            .animation(.easeInOut(duration: 1.5), value: spin)
                    }
                }
                .rotationEffect(.degrees(spin))
                TriangleIndicator()
                        .frame(width: 40, height: 40)
                        .offset(y: -60)
                Button {
                    let randomRotation = Double.random(in: 1080...5000)
                    let totalRotation = spin + randomRotation
                    withAnimation(.spring(response: 2, blendDuration: 1.5)) {
                        spin = totalRotation / 2
                    } completion: {
                        viewModel.spinWheel(cards: cards, currentRotation: totalRotation, spinValue: Int(totalRotation)) { topMovie in
                        }
                    }
                } label: {
                    ButtonView(title: "Spin")
                }
                Spacer()
            }
            .padding()
            .onReceive(viewModel.$selectedMovie) { selectedMovie in
                // Handle selected movie change if needed
            }
        }
    }
}

extension Double {
    var degreesToRadians: Double { self * .pi / 180 }
}
