//
//  MovieRowView.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import SwiftUI

struct MovieRowView: View {
    let movieRowView : MovieEntry
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(movieRowView.movieName)
                    .bold()
                    .font(.title2)
                Text("-")
                Text(movieRowView.movieDirector)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom,1)
            HStack{
                Text(movieRowView.movieDate , style: .date)
                Text("-")
                Text(String(repeating: "⭐️", count: Int(movieRowView.movieRating)))
            }
            HStack{
                Text(movieRowView.movieComment)
                    .lineLimit(1)
                    .font(.title3)
                    .italic()
                    .scenePadding(.vertical)
            }

        }
    }
}

#Preview {
    MovieRowView(movieRowView: MovieEntry(movieName : "The Prestige", movieDirector: "Chris Nolan", movieComment: "Amazing movie !", movieRating: 5, movieDate: Date()))
}
