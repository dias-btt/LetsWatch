//
//  LanguageSelectionView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 03.06.2024.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Binding var selectedLanguage: String
    let flags: [String: String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(flags.keys.sorted(), id: \.self) { language in
                    Button(action: {
                        selectedLanguage = language
                    }) {
                        Image(flags[language] ?? "")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(5)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(selectedLanguage == language ? Color.blue : Color.clear, lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
        }
    }
}

