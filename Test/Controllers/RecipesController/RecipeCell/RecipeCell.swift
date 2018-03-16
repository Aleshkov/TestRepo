//
//  RecipeCell.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView! {
        didSet {
            recipeImageView.layer.cornerRadius = 20
            recipeImageView.translatesAutoresizingMaskIntoConstraints = false
            recipeImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
