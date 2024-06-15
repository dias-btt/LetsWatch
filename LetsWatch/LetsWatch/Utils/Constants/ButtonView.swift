//
//  ButtonView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 03.06.2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color("Primary"))
                .clipShape(Capsule())
                .frame(width: SizeConstants.buttonWidth, height: SizeConstants.buttonHeight)
            Text(title)
                .foregroundStyle(Color.white)
                .font(.system(size: 24))
                .fontWeight(.bold)
        }
    }
}
