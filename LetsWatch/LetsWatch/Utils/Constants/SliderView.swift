//
//  SliderView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 03.06.2024.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    var range: ClosedRange<Double>
    var step: Double
    var title: String
    var float: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(float ? "\(title): \(String(format: "%.1f", value))" : "\(title) : \(Int(value))")
                .padding()
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)

            Slider(value: $value, in: range, step: step)
                .padding(.horizontal)
                .accentColor(Color.white)

        }
    }
}
