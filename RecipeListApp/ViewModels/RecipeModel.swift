//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Piyush Garg on 01/09/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData(jsonFileName: "recipes")
    }
}
