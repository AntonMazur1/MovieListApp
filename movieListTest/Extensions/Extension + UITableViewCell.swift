//
//  Extension + UITableViewCell.swift
//  movieListTest
//
//  Created by Клоун on 31.08.2022.
//

import UIKit

extension UITableViewCell {
    func configureCell(with movieTitle: String, and movieYear: String) {
        var content = defaultContentConfiguration()
        content.text = movieTitle
        content.secondaryText = movieYear
        contentConfiguration = content
    }
}
