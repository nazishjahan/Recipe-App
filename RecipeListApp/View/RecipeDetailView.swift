//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by NAZISH ZOHAIB on 04/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var servingSizeSeletion = 2
    var recipe:Recipe
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                // MARK: Recipe Image
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
               
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top,20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size:24))
                
     
                VStack(alignment: .leading){
                    
                    Text("Select your Serving Size: ")
                
                // MARK: Serving size Picker
                Picker("",selection:$servingSizeSeletion){
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }.pickerStyle(SegmentedPickerStyle())
                .frame(width:160)
                }.padding()
                
                
                // MARK: Ingredients
                    VStack(alignment: .leading){
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.top,5)
                    Divider()
                    ForEach(recipe.ingredients){
                        item in
                        Text("•" + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: servingSizeSeletion) + " " + item.name)
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
        }
           
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create a dummy recipe and pass it into
       // detail view so we can see the view
         let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
