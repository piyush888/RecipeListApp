//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Piyush Garg on 02/09/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isDetailedViewShowing = false
    @State var tabSelectionIndex = 0
   
    var body: some View {
        VStack (alignment: .leading){
            Text("Featured Recipes")
                .bold()
                .padding()
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    ForEach (0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                self.isDetailedViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                        
                                        Text(model.recipes[index].name)
                                            .padding()
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailedViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-30, height: geo.size.height-100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.8), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading){
                Text("Preparation Time: ")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights: ")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                
            }.padding()
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
