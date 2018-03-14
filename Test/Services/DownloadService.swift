//
//  DownloadService.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import Foundation

struct DownloadService {
    
    func downloadRecipes(stringUrl: String, completion: @escaping ([Recipe]) -> Void) {
        guard let url = URL(string: stringUrl) else { return }
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                completion(self.parseRecipes(recipesData: data))
            }.resume()
        }
    }
    
    fileprivate func parseRecipes(recipesData: Data) -> [Recipe] {
        var recipes: [Recipe] = []
        do {
            let recipeList = try JSONDecoder().decode(RecipeList.self, from: recipesData)
            recipes = recipeList.recipes
        } catch let jsonError {
            print("Error serializing json:", jsonError)
        }
        return recipes
    }
    
}
