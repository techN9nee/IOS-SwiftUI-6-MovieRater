//
//  MovieEditEntry.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import SwiftUI

struct MovieEditEntry: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var movieEditEntry : MovieEntry
    @State var editMode = false
    var body: some View {
        if editMode {
            Form {
                TextField("Movie Name",text: $movieEditEntry.movieName)
                TextField("Movie Director",text: $movieEditEntry.movieDirector)
                TextEditor(text: $movieEditEntry.movieComment)
                Text(String(repeating: "⭐️", count: Int(movieEditEntry.movieRating)))
                Slider(value:$movieEditEntry.movieRating , in : 1...5 , step: 1)
                DatePicker("Date",selection: $movieEditEntry.movieDate, displayedComponents: .date)
            }
            .navigationTitle("Edit Mode")
            .toolbar{
                Button("Delete") {
                    modelContext.delete(movieEditEntry)
                    dismiss()
                }
                .font(.title3)
                .bold()
                .foregroundStyle(.red)
                Button("Done"){
                    editMode = false
                }
                .bold()
            }
        }else {
            MovieDetailView(movieDetailView: movieEditEntry)
                .toolbar {
                    Button("Edit") {
                        editMode = true
                    }
                }
        }
    }
}
#Preview {
    NavigationStack{
        MovieEditEntry(movieEditEntry: MovieEntry(movieName : "The Prestige", movieDirector: "Chris Nolan", movieComment: "Amazing movie !", movieRating: 5, movieDate: Date()))
    }
        
}
   
