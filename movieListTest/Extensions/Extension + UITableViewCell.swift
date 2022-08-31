//
//  Extension + UITableViewCell.swift
//  movieListTest
//
//  Created by Клоун on 31.08.2022.
//

import UIKit

extension UITableViewCell {
    func configureCell(with movie: MovieModel) {
        var content = defaultContentConfiguration()
        content.text = movie.title
        content.secondaryText = movie.year
        contentConfiguration = content
    }
}
