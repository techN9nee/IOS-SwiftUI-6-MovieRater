//
//  MovieDetailView.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import SwiftUI

struct MovieDetailView: View {
    let movieDetailView : MovieEntry
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                HStack{
                    Text("Movie By ")
                        .font(.title2)
                        .bold()
                    Text("-")
                    Text(movieDetailView.movieDirector)
                        .foregroundStyle(.secondary)
                }.padding(.bottom,2)
                HStack{
                    Text(movieDetailView.movieDate,style:.date)
                    Text("-")
                    Text(String(repeating: "⭐️", count: Int(movieDetailView.movieRating)))
                }
                .padding(.bottom,2)
                Text(movieDetailView.movieComment)
                    .font(.title3)
                    .italic()
                    .scenePadding(.vertical)
            }
            .padding()
        }
        .navigationTitle(movieDetailView.movieName)
    }
}

#Preview {
    MovieDetailView(movieDetailView: MovieEntry(movieName : "The Prestige", movieDirector: "Chris Nolan", movieComment: "Amazing movie !", movieRating: 5, movieDate: Date()))
}
