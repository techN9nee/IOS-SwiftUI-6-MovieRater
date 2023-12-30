//
//  ContentView.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import SwiftUI
import SwiftData

struct MovieViewController: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MovieEntry.movieRating, order : .reverse) private var movieEntry: [MovieEntry]
    @State var showCreateView = false

    var body: some View {
        NavigationStack {
            List(movieEntry) {
                listedMovieEntry in NavigationLink(destination: MovieEditEntry(movieEditEntry: listedMovieEntry)){
                    MovieRowView(movieRowView: listedMovieEntry)
                }
            }
            .navigationTitle("\(movieEntry.count) Movie Review")
            
            .toolbar(){
                Button(action : {
                    showCreateView = true
                }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView) {
                MovieCreateEntry()
            }
            }
        }
    }

#Preview {
    MovieViewController()
        .modelContainer(for: MovieEntry.self, inMemory: true)
}
