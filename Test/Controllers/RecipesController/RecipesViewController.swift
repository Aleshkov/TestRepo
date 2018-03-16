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
    var recipeList = [Recipe]()
    var currentRecipeList = [Recipe]()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultContent()
        setupNavigationBar()
        setupTableView()
    }
    
    
    func setupDefaultContent() {
        downloadService.downloadRecipes(stringUrl: urlConstants.recipeUrl) { model in
            self.currentRecipeList = model.sorted(by: {$0.lastUpdated < $1.lastUpdated })
            self.recipeList = self.currentRecipeList
        }
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Recipes"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.scopeButtonTitles = ["For date", "For name"]
        navigationItem.searchController = searchController
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.keyboardDismissMode = .onDrag
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


extension RecipesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentRecipeList = recipeList.filter { recipe -> Bool in
            if searchText.isEmpty { return true }
            if recipe.description == nil {
                return recipe.name.lowercased().contains(searchText.lowercased()) || recipe.instructions.lowercased().contains(searchText.lowercased())
            } else {
                return recipe.name.lowercased().contains(searchText.lowercased()) || recipe.instructions.lowercased().contains(searchText.lowercased()) ||
                    recipe.description!.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentRecipeList = currentRecipeList.sorted(by: {$0.lastUpdated < $1.lastUpdated })
        case 1:
            currentRecipeList = currentRecipeList.sorted(by: {$0.name < $1.name})
        default:
            break
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.selectedScopeButtonIndex = 0
        currentRecipeList = recipeList
        tableView.reloadData()
    }
}


extension RecipesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vs = RecipesDetailsViewController()
        navigationController!.pushViewController(vs, animated: true)
        vs.recipe = currentRecipeList[indexPath.row]
    }
}

extension RecipesViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { downloadService.downloadImageData(url: currentRecipeList[$0.row].images.first!, completion: { _ in })
        }
    }
}

extension RecipesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentRecipeList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        cell.recipeNameLabel.text = currentRecipeList[indexPath.row].name
        cell.recipeDescriptionLabel.text = currentRecipeList[indexPath.row].description
        downloadService.downloadImageData(url: currentRecipeList[indexPath.row].images.first!) { data in
            DispatchQueue.main.async {
                print(indexPath.row)
                cell.recipeImageView.image = UIImage(data: data)
            }
        }
        return cell
    }
}
