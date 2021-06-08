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
}
