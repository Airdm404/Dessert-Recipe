//
//  MealsModel.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//



import Foundation
class MealsModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init() {
        loadMeals()
    }

    func loadMeals() {
        isLoading = true
        fetchMeals { [weak self] meals in
            self?.isLoading = false
            guard let meals = meals else {
                self?.errorMessage = "Failed to fetch meals."
                return
            }
            self?.meals = meals
            print(meals)
        }
    }
}
