//
//  Servicedata.swift
//  RecipeListApp
//
//  Created by NAZISH ZOHAIB on 03/06/2021.
//

import Foundation
class ServiceData {
    
    var recipes = [Recipe]()
    
   static func getLocalJsonData()->[Recipe]{
        
        // get the local json file path from the app bundle
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if it is nil otherwise do this
        guard  path != nil else {
            return [Recipe]()
        }
        
        // create url object of the path
        let url = URL(fileURLWithPath: path!)
        
        // get data of the url path
        do{
        let data =  try Data(contentsOf: url)
            
            // Decode data using JsonDecoder
            let decoder = JSONDecoder()
            do{
                
           let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add ids
                for r in recipeData{
                    r.id = UUID()
                    
                }
                return recipeData
            }
            catch{
                // Log the parsing error
                print(error)
            }
        }
        catch{
            // Execution come here if there is an error
            print(error)
        }
        return [Recipe]()
        
       
    }
    
}
