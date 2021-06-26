//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by NAZISH ZOHAIB on 03/06/2021.
//

import Foundation
class RecipeModel:ObservableObject{
    
   @Published var recipes = [Recipe]()
    
    init(){
        // creaate the instance of services and receive recipes
        
        self.recipes = ServiceData.getLocalJsonData()
    }
  static func getPortion(ingredient:Ingredient,recipeServings:Int, targetServings:Int) -> String {
     var portion = ""
     var numenator = ingredient.num ?? 1
     var denominator = ingredient.denom ?? 1
      var wholePortions = 0
    if ingredient.num != nil{
        
        // Get a single serving size by multiplying denominator by the recipe servings
    denominator *= recipeServings
        
        // Get target portion by multiplying numenator by target servings
    numenator *= targetServings
        
        // Reduce fraction by greatest common divisor
        let divisor = Rational.greatestCommonDivisor(numenator, denominator)
        
        numenator /= divisor
        denominator /= divisor
        // Get the whole portion if numenator is greater than the denominator
        if numenator > denominator{
            
            // Calculate the whole portion
            wholePortions = numenator / denominator
            
            // Calculate the remailnder
            numenator = numenator % denominator
            
            // assign to portion string
            portion += String(wholePortions)
        }
        // Express the remainder as a fraction
        if numenator > 0{
             // Assign remainder as fraction to the portion string
            portion += wholePortions > 0 ? " " : ""
            portion += "\(numenator) / \(denominator)"
        }
        if let unit = ingredient.unit{
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            //calculate appropriste suffix
            return portion + unit
        }
    }
        return portion
    }
}
