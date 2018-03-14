//
//  RecipeCell.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
