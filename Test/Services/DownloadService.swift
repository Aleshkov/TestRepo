//
//  DownloadService.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import Foundation

struct DownloadService {
    
    private let imageCache = NSCache<AnyObject, AnyObject>()

    func downloadRecipes(stringUrl: String, completion: @escaping ([Recipe]) -> Void) {
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            completion(self.parseRecipes(recipesData: data))
            }.resume()
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
    
    func downloadImageData(url: String, completion: @escaping (Data) -> ()) {
        if let cachedData = imageCache.object(forKey: url as AnyObject) {
            completion(cachedData as! Data)
            return
        }
        let imageUrl = URL(string: url)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl!)
            guard data != nil else { return }
            
            self.imageCache.setObject(data as AnyObject, forKey: url as AnyObject)
            completion(self.imageCache.object(forKey: url as AnyObject) as! Data)
        }
    }
}

