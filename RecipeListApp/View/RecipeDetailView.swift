//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by NAZISH ZOHAIB on 04/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                // MARK: Recipe Image
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                    
                // MARK: Ingredients
                    VStack(alignment: .leading){
                        Text("Ingredients").font(.headline)
                            .padding(.top,5)
                    Divider()
                    ForEach(recipe.ingredients){
                        r in
                        Text("•" + r.name)
                            .multilineTextAlignment(.leading)
                           
                    }
                    }.padding(.horizontal)
                // MARK: Directions
                   
                   VStack(alignment: .leading){
                    Text("Directions").font(.headline).multilineTextAlignment(.leading).padding(.vertical)
                    
                   
                    ForEach(0...recipe.directions.count-1,id:\.self){
                       index in
                        Text(String(index + 1) + ". " +  recipe.directions[index])
                            .padding(.vertical, 3.0)
                 }
                   }.padding(.horizontal)
                }
        }.navigationBarTitle(recipe.name)
           
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it into
       // detail view so we can see the view
         var model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
