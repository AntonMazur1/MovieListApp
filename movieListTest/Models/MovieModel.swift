//
//  MovieModel.swift
//  movieListTest
//
//  Created by Клоун on 02.09.2022.
//

import Foundation

struct MovieModel: Hashable {
    let title: String
    let year: String
}

extension MovieModel: Equatable {
    static func ==(lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.title == rhs.title
    }
}
