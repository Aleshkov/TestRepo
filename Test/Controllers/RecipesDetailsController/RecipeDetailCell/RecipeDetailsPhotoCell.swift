//
//  RecipeDetailsPhotoCell.swift
//  Test
//
//  Created by Aleshkov Andrei on 3/15/18.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipeDetailsPhotoCell: UICollectionViewCell {
    
    let recipeImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "noimage"))
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        let recipeImageConteinerView = UIView()
        addSubview(recipeImageConteinerView)
        recipeImageConteinerView.translatesAutoresizingMaskIntoConstraints = false
        
        recipeImageConteinerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        recipeImageConteinerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recipeImageConteinerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        recipeImageConteinerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        recipeImageConteinerView.addSubview(recipeImageView)
        recipeImageView.topAnchor.constraint(equalTo: recipeImageConteinerView.topAnchor).isActive = true
        recipeImageView.leadingAnchor.constraint(equalTo: recipeImageConteinerView.leadingAnchor).isActive = true
        recipeImageView.trailingAnchor.constraint(equalTo: recipeImageConteinerView.trailingAnchor).isActive = true
        recipeImageView.bottomAnchor.constraint(equalTo: recipeImageConteinerView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

