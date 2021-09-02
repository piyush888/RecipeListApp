//
//  DataService.swift
//  RecipeListApp
//
//  Created by Piyush Garg on 01/09/21.
//

import Foundation

class DataService {
    static func getLocalData(jsonFileName: String) -> [Recipe] {
        let pathString = Bundle.main.path(forResource: jsonFileName, ofType: "json")
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let recipeData = try JSONDecoder().decode([Recipe].self, from: data)
            
            for r in recipeData {
                r.id = UUID()
                for ingredient in r.ingredients {
                    ingredient.id = UUID()
                }
            }
            
            return recipeData
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
