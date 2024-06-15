//
//  DemoView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 21.05.2024.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = FilterViewModel()
    
    @State private var releaseYearRange: [Int] = []
    @State private var minReleaseYear: Double = 1900
    @State private var maxReleaseYear: Double = 2024
    @State private var minRating: Double = 0
    @State private var maxRating: Double = 10
    @State private var selectedLanguage: String = "Any"
    
    @State private var isNextViewActive = false

    let flags = ["Any" : "worldwide", "English" : "uk", "Spanish" : "es", "French" : "fr", "German" : "de", "Italian" : "it", "Japanese" : "jp", "Korean" : "kr", "Chinese" : "cn", "Russian" : "ru"]
    
    var selectedGenresText: String {
        viewModel.selectedGenres.map { genreID in
            genres.first { $0.id == genreID }?.name ?? ""
        }.joined(separator: ", ")
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("Filters")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                ScrollView(.vertical) {
                    VStack {
                        NavigationLink(destination: CardStackView(viewModel: viewModel).navigationBarBackButtonHidden(true), isActive: $isNextViewActive) {
                            EmptyView()
                        }
                        
                        //Genre Filter
                        VStack {
                            NavigationLink(destination: GenreSelectionView(selectedGenres: $viewModel.selectedGenres).navigationBarBackButtonHidden(true)) {
                                Rectangle()
                                    .fill(Color("Primary"))
                                    .frame(height: SizeConstants.buttonHeight)
                                    .cornerRadius(15)
                                    .overlay(
                                        HStack {
                                            Text(viewModel.selectedGenres.isEmpty ? "Select Genres" : selectedGenresText)
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .tint(Color.white)
                                        }
                                        .padding(.horizontal)
                                    )
                            }
                        }
                        .padding()
                        
                        //Rating Filter
                        VStack {
                            SliderView(value: $minRating, range: 0...10, step: 0.1, title: "Minimum Rating", float: true)
                            SliderView(value: $maxRating, range: minRating...10, step: 0.1, title: "Maximum Rating", float: true)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Primary"))
                                .padding()
                                .padding(.bottom, -10)
                        )
                        
                        //Language Filter
                        VStack{
                            Text("Select language")
                                .padding()
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            LanguageSelectionView(selectedLanguage: $selectedLanguage, flags: flags)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Primary"))
                                .padding()
                        )
                        
                        //Release Year Filter
                        VStack {
                            SliderView(value: $minReleaseYear, range: 1900...maxReleaseYear, step: 1, title: "Minimum Release Year", float: false)
                            SliderView(value: $maxReleaseYear, range: minReleaseYear...2024, step: 1, title: "Maximum Release Year", float: false)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Primary"))
                                .padding()
                                .padding(.bottom, -10)
                        )
                        
                        Spacer()
                        
                        Button{
                            let selectedLang = convertLanguage(selectedLanguage)
                            viewModel.applyFilters(minVA: minRating, maxVA: maxRating, lang: selectedLang, releaseYearRange: releaseYearRange)
                            isNextViewActive = true
                        } label: {
                            ButtonView(title: "Apply Filters")
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension FilterView {
    func convertLanguage(_ language: String) -> String {
        switch language {
        case "English":
            return "en-US"
        case "Spanish":
            return "es-ES"
        case "French":
            return "fr-FR"
        case "German":
            return "de-DE"
        case "Italian":
            return "it-IT"
        case "Japanese":
            return "ja-JP"
        case "Korean":
            return "ko-KR"
        case "Chinese":
            return "zh-CN"
        case "Russian":
            return "ru-RU"
        default:
            return ""
        }
    }
}
