//
//  HomeView.swift
//  LetsWatch
//
//  Created by Диас Сайынов on 13.06.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
                VStack(alignment: .center) {
                    Spacer()
                    
                    Text("Welcome to LetsWatch!")
                        .foregroundStyle(Color("Primary"))
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                    
                    Text("Let's start with finding your preferences.")
                        .foregroundStyle(Color("Primary"))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 18))
                        .padding(.top, 5)
                                        
                    VStack{
                        NavigationLink(destination: FilterView().navigationBarBackButtonHidden(true)) {
                            ButtonView(title: "Continue")
                        }
                    }
                    .padding(.top, 40)
                    
                    Spacer()
                }
                .padding()
        }
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("Lets Watch")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
