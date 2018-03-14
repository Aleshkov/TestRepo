//
//  RecipeCell.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brown
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func setupCell() {
        addSubview(cellView)
//        cellView.widthAnchor.constraint(equalTo: widthAnchor, constant: 4).isActive = true
//        cellView.heightAnchor.constraint(equalTo: heightAnchor, constant: 4).isActive = true
//        cellView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
//        cellView.rightAnchor.constraint(equalTo: rightAnchor, constant: 4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
