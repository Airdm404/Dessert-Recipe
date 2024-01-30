//
//  MealItem.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//
//  View for single meal item in a list, displaying its name and thumbnail image
//

import SwiftUI

struct MealItem: View {
    @EnvironmentObject var mealsModel: MealsModel
    
    let meal: Meal
    
    var body: some View {
        HStack {
            VStack {
                Text(meal.strMeal)
                    .font(Font.custom("Karla", size: 16).weight(.heavy))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
        
    }
}


struct MealItem_Previews: PreviewProvider {
    static var previews: some View {
        MealItem(meal: Meal(idMeal: "53049", strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"))
    }
}



