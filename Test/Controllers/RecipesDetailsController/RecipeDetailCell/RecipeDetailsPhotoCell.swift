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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
        
        recipeImageConteinerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        recipeImageConteinerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recipeImageConteinerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        recipeImageConteinerView.addSubview(recipeImageView)
        recipeImageView.centerXAnchor.constraint(equalTo: recipeImageConteinerView.centerXAnchor).isActive = true
        recipeImageView.centerYAnchor.constraint(equalTo: recipeImageConteinerView.centerYAnchor).isActive = true
        recipeImageView.heightAnchor.constraint(equalTo: recipeImageConteinerView.heightAnchor).isActive = true
        
        recipeImageConteinerView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

