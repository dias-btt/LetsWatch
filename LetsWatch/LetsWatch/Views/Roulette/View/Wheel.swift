//
//  WheelView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 10.06.2024.
//
import SwiftUI

struct Wheel: View {
    
    @Binding var rotation: CGFloat
    
    let segments: [Card]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(0..<segments.count, id: \.self) { index in
                    ZStack {
                        Circle()
                            .inset(by: proxy.size.width / 4)
                            .trim(from: CGFloat(index) * segmentSize, to: CGFloat(index + 1) * segmentSize)
                            .stroke(Color.random(), style: StrokeStyle(lineWidth: proxy.size.width / 2))
                            .rotationEffect(.radians(.pi * segmentSize))
                            .opacity(0.3)
                        label(text: segments[index].movie.original_title, index: CGFloat(index), offset: proxy.size.width / 4)
                    }
                }
            }
        }
    }
    
    var segmentSize: CGFloat {
        1 / CGFloat(segments.count)
    }
    
    func rotation(index: CGFloat) -> CGFloat {
        (.pi * (2 * segmentSize * (CGFloat(index + 1))))
    }
    
    func label(text: String, index: CGFloat, offset: CGFloat) -> some View {
        Text(text)
            .rotationEffect(.radians(rotation(index: CGFloat(index))))
            .offset(x: cos(rotation(index: index)) * offset, y: sin(rotation(index: index)) * offset)
            .font(.footnote)
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
