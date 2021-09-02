//
//  RecipeHighlights.swift
//  RecipeListApp
//
//  Created by Piyush Garg on 02/09/21.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(highlights: [String]) {
        for highlight in highlights {
            allHighlights += highlight+", "
        }
        allHighlights = String(allHighlights.dropLast(2))
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "test2", "test3"])
    }
}
