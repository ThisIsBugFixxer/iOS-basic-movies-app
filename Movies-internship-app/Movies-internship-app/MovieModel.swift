//
//  MovieModel.swift
//  Movies-internship-app
//
//  Created by Priyam Mehta on 12/01/23.
//

import Foundation

class MovieModel: Codable {
    var movieId:Int?
    var movieTitle:String?
    var movieImageName:String?
    var movieDuration:Double?
  
    
    init() {
        
    }
    
    init(`var` movieId:Int, `var` movieTitle:String, `var` movieImageName:String, `var` movieDuration:Double) {
        self.movieId = movieId
        self.movieTitle = movieTitle
        self.movieImageName = movieImageName
        self.movieDuration = movieDuration
        
    }
}
