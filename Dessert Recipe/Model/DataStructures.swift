//
//  DataStructures.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//

import Foundation


struct ServerMeals: Codable {
    let meals: [Meal]
}


struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var id: String {
        return idMeal
    }
}


struct ServerMealDetail: Codable {
    let meals: [MealDetail]
}


struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    var ingredients: [String] = []
    var measurements: [String] = []
    
}
