//
//  MealList.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//

import SwiftUI

struct MealList: View {
    @EnvironmentObject var mealsModel: MealsModel
    
    var body: some View {
        NavigationView {
            List(sortedMeals, id: \.id) { meal in
                NavigationLink {
                    MealDetails()
                } label: {
                    MealItem(meal: meal)
                }
            }
            .navigationTitle("Dessert")
        }
    }
    
    private var sortedMeals: [Meal] {
        mealsModel.meals.sorted { $0.strMeal < $1.strMeal }
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList().environmentObject(MealsModel())
    }
}
