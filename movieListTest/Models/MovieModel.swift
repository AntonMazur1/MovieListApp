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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

extension MovieModel: Equatable {
    static func ==(lhs: MovieModel, rhs: MovieModel) -> Bool {
        return lhs.title == rhs.title
    }
}
