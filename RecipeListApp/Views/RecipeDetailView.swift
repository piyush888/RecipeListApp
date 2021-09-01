//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Piyush Garg on 01/09/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach (recipe.ingredients, id: \.self) { item in
                        Text("- "+item).padding(.bottom, 1)
                    }
                }
                .padding()
                Divider()
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach (0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1)+". "+recipe.directions[index]).padding(.bottom, 2)
                    }
                    
                }.padding(.horizontal)
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
