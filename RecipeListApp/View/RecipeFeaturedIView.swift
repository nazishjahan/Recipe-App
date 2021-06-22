//
//  RecipeFeaturedIView.swift
//  RecipeListApp
//
//  Created by NAZISH ZOHAIB on 11/06/2021.
//

import SwiftUI

struct RecipeFeaturedIView: View {
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        
        VStack(alignment: .leading,spacing:0){
            Text("Featured Recipe")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top,40)
        GeometryReader{geo in
            
            TabView{
                // Loop through each recipe
                ForEach(0..<model.recipes.count){index in
                    
                    //only shows thoes that should be featured
                    if model.recipes[index].featured{
                        
                    //Recipe Card
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                    
                   
                        
                            VStack( spacing: 0){
                            Image(model.recipes[index].image)
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                Text(model.recipes[index].name)
                        }
                        }.frame(width: geo.size.width - 40, height: geo.size.height-100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color:Color(.sRGB,red:0,blue:0,green:0,opacity:0.5),radius:10,x:-5,y:5)
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            VStack(alignment: .leading,spacing:10){
                Text("Prepration Time")
                    .bold()
                    .font(.headline)
                Text("1 Hour")
                Text("HighLights")
                    .bold()
                    .font(.headline)
                Text("Healthy,Hearty")
            }.padding()
            
        }
    }
}

struct RecipeFeaturedIView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedIView()
            .environmentObject(RecipeModel())
    }
}
