//
//  MovieModel.swift
//  movieListTest
//
//  Created by Клоун on 31.08.2022.
//

import Foundation

struct MovieModel {
    let title: String
    let year: String
    
    static func createMovie(title: String, year: String) -> MovieModel {
        MovieModel(title: title, year: year)
    }
}

extension MovieModel: Equatable {
    static func ==(lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.title == rhs.title && lhs.year == rhs.year
    }
}
