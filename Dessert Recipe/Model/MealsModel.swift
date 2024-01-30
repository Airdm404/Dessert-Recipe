//
//  MealsModel.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//



import Foundation

//class for meal object
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
        }
    }
}


// class for meal details object
class MealDetailModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    

    func loadMealDetail(mealId: String) {
        isLoading = true
        fetchMealDetail(mealId: mealId) { [weak self] mealDetail in
            self?.isLoading = false
            guard let mealDetail = mealDetail else {
                self?.errorMessage = "Failed to fetch meal details."
                return
            }
            self?.mealDetail = mealDetail
        }
    }
}
