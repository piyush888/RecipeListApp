//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Piyush Garg on 01/09/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text(recipe.name)
                    .bold()
                    .font(.largeTitle)
                    .padding([.leading, .top])
                
                // MARK: Serving Size Picker
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased()).padding(.bottom, 1)
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
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
