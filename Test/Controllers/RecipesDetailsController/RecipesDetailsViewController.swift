//
//  RecipesDetailsViewController.swift
//  Test
//
//  Created by Aleshkov Andrei on 3/15/18.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipesDetailsViewController: UIViewController  {
    
    var recipe: Recipe? = nil
    let downloadService = DownloadService()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = recipe?.name
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44.0
        tableView.separatorStyle = .none
        tableView.bouncesZoom = true
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nibName = UINib(nibName: "RecipeDetailsInfoTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "detailsCell")
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setDifficult(_ dif: Int) -> String {
        switch dif {
        case 1:
            return "Very easy"
        case 2:
            return "Easy"
        case 3:
            return "Normal"
        case 4:
            return "Hard"
        case 5:
            return "Very hard"
        default:
            return "Some"
        }
    }
}

extension RecipesDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (recipe?.images.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipePhotoCell", for: indexPath) as! RecipeDetailsPhotoCell
        downloadService.downloadImageData(url: (recipe?.images[indexPath.item])!) { data in
            DispatchQueue.main.async {
                cell.recipeImageView.image = UIImage(data: data)
            }
        }
        return cell
    }
}

extension RecipesDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! RecipeDetailsInfoTableViewCell
        detailCell.nameLabel.text = recipe?.name
        detailCell.descriptionLabel.text = recipe?.description
        detailCell.difficultLabel.text = setDifficult((recipe?.difficulty)!)
        detailCell.instructionTextView.text = recipe?.instructions
        detailCell.pageControl.numberOfPages = (recipe?.images.count)!
        detailCell.registerCollectionView(dataSource: self)
        return detailCell
    }
}
