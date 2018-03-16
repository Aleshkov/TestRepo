//
//  RecipeDetailsInfoTableViewCell.swift
//  Test
//
//  Created by Aleshkov Andrei on 3/16/18.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipeDetailsInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(RecipeDetailsPhotoCell.self, forCellWithReuseIdentifier: "recipePhotoCell")
            collectionView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.currentPageIndicatorTintColor = .black
            pageControl.backgroundColor = .white
            pageControl.currentPage = 0
            pageControl.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var difficultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func registerCollectionView<DataSource: UICollectionViewDataSource>(dataSource: DataSource) {
        self.collectionView.dataSource = dataSource
    }
}

extension RecipeDetailsInfoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension RecipeDetailsInfoTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
    }
}

