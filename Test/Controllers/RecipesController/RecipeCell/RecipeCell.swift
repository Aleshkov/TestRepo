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
            recipeImageView.layer.cornerRadius = recipeImageView.frame.width / 4
            recipeImageView.translatesAutoresizingMaskIntoConstraints = false
            recipeImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var recipeNameLabel: UILabel! {
        didSet {
            
        }
    }
    @IBOutlet weak var recipeDescriptionLabel: UILabel! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
