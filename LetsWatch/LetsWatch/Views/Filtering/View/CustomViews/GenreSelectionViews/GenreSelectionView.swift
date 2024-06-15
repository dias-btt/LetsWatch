//
//  GenreSelectionView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 28.05.2024.
//
import SwiftUI

struct GenreSelectionView: View {
    @Binding var selectedGenres: [Int]
    @State private var selectedGenresTemp: [Int] = []
    @Environment(\.presentationMode) var presentationMode

    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 120, maximum: 200)),
        GridItem(.flexible(minimum: 120, maximum: 200)),
        GridItem(.flexible(minimum: 120, maximum: 200)),
    ]
    
    let rows: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Select Genres")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                        columns: columns,
                        alignment: .center,
                        spacing: 4,
                        pinnedViews: [.sectionHeaders, .sectionFooters]
                    ) {
                    ForEach(genres, id: \.id) { genre in
                        BubbleButton(title: genre.name,
                                        isSelected: self.selectedGenresTemp.contains(genre.id)) {
                            if self.selectedGenresTemp.contains(genre.id) {
                                self.selectedGenresTemp.removeAll(where: { $0 == genre.id })
                            } else {
                                self.selectedGenresTemp.append(genre.id)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            Button(action: {
                selectedGenres = selectedGenresTemp
                selectedGenresTemp = []
                presentationMode.wrappedValue.dismiss()
            }) {
                ButtonView(title: "Save")
            }
            .padding(.bottom)
        }
        .onAppear {
            selectedGenresTemp = selectedGenres
        }
    }
}
