//
//  JsonMovieModel.swift
//  Movies-internship-app
//
//  Created by Priyam Mehta on 13/01/23.
//

import Foundation



struct JsonMovieModel: Codable {
    let MovieList: [MovieM]
}

struct MovieM: Codable {
    let Title: String
    let Year: String
    let Summary: String
    let ShortSummary: String
    let Genres: String
    let IMDBID: String
    let Runtime: String
    let YouTubeTrailer: String
    let Rating: String
    let MoviePoster: String
    let Director: String
    let Writers: String
    let Cast: String
}
