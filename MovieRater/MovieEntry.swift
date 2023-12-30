//
//  Item.swift
//  MovieRater
//
//  Created by Aytek Özgül on 30.12.2023.
//

import Foundation
import SwiftData

@Model
final class MovieEntry {
    var movieName = ""
    var movieDirector = ""
    var movieComment = ""
    var movieRating : Double = 1.0
    var movieDate : Date = Date()
    
    init(movieName: String = "", movieDirector: String = "", movieComment: String = "", movieRating: Int, movieDate: Date) {
        self.movieName = movieName
        self.movieDirector = movieDirector
        self.movieComment = movieComment
        self.movieRating = Double(movieRating)
        self.movieDate = movieDate
    
    }
}
/*
let movieEntry : [MovieEntry] = [MovieEntry(movieName : "The Prestige", movieDirector: "Chris Nolan", movieComment: "Amazing movie !", movieRating: 5, movieDate: Date())]

*/
