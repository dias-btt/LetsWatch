//
//  MultipleSelectionRow.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//

import SwiftUI

struct BubbleButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color("DarkGreen") : Color("Primary"))
                .cornerRadius(20)
        }
    }
}
