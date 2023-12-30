//
//  MovieCreateEntry.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import SwiftUI

struct MovieCreateEntry: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var movieName = ""
    @State var movieDirector = ""
    @State var movieComment = "Write your comment ..."
    @State var movieRating : Double = 5.0
    @State var movieDate : Date = Date()
    
    var body: some View {
        NavigationStack{
            Form {
                
                TextField("Movie Name", text: $movieName)
                TextField("Movie Director" , text: $movieDirector)
                TextEditor(text: $movieComment)
                Text(String(repeating: "⭐️", count: Int(movieRating)))
                Slider(value: $movieRating , in: 1...5 , step: 1)
                DatePicker("Date", selection: $movieDate, displayedComponents: .date)
            }
            .navigationTitle("New Movie Entry")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                }
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Save") {
                            let newMovieEntry = MovieEntry(movieName: movieName, movieDirector: movieDirector , movieComment: movieComment, movieRating: Int(movieRating), movieDate: movieDate)
                            modelContext.insert(newMovieEntry)
                            dismiss()
                       
                    }
                }
            }
        }
    }
}

#Preview {
    MovieCreateEntry()
}
