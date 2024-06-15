//
//  TitleView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 14.06.2024.
//

import SwiftUI

struct CustomHeaderView: View {
    let title: String
    let action: DismissAction
    
    var body: some View {
        HStack {
            Button(action: {action}) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            }
            Spacer()
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
    }
}

