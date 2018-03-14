//
//  RecipesViewController.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    
    let urlConstants = UrlConstants()
    let downloadService = DownloadService()
    var recipeList: [Recipe] = []
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadService.downloadRecipes(stringUrl: urlConstants.recipeUrl) { model in
            self.recipeList = model
        }
        
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Recipes"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let nibName = UINib(nibName: "RecipeCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "recipeCell")
        
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}

extension RecipesViewController: UITableViewDelegate {
    
}

extension RecipesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        cell.recipeNameLabel.text = recipeList[indexPath.row].name
        cell.recipeDescriptionLabel.text = recipeList[indexPath.row].description
        downloadService.downloadImageData(url: recipeList[indexPath.row].images.first!) { data in
            DispatchQueue.main.async {
                cell.recipeImageView.image = UIImage(data: data)
            }
        }
        return cell
    }
}
