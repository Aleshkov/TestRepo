//
//  RecipeModel.swift
//  Test
//
//  Created by andrey on 14/03/2018.
//  Copyright © 2018 andrey. All rights reserved.
//

import Foundation

struct Recipe: Decodable {
    let uuid: String
    let name: String
    let images: [String]
    let lastUpdated: Int
    let instructions: String
    let difficulty: Int
    let description: String?
}

struct RecipeList: Decodable {
    let recipes: [Recipe]
}
