//
//  RecipesViewController.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {
    

    let tableView: UITableView = {
       let tv = UITableView()
//        tv.separatorStyle = .none
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.allowsSelection = false
        return tv
    }()
    
    let urlConstants = UrlConstants()
    let downloadService = DownloadService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadService.downloadRecipes(stringUrl: urlConstants.recipeUrl) { model in
            print(model.first?.description)
        }
        
        setupNavigationBar()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupNavigationBar() {
        navigationItem.title = "Recipes"
        navigationController?.navigationBar.barTintColor = UIColor.yellow
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RecipeCell.self, forCellReuseIdentifier: "recipeCell")
        
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeCell
        return cell
    }
}
