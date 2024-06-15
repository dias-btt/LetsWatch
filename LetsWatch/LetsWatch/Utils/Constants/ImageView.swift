//
//  ImageView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 08.06.2024.
//

import SwiftUI

struct ImageView: View {
    let path: String?
    var body: some View {
        if let posterPath = path {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image("placeholder_image")
                        .resizable()
                        .scaledToFill()
                }
            }
        } else {
            Image("placeholder_image")
                .resizable()
                .scaledToFill()
        }
    }
}
