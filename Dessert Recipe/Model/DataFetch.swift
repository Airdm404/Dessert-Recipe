//
//  DataFetch.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//

import Foundation

//fetching the list of meals in the Desset category
func fetchMeals(completion: @escaping ([Meal]?) -> Void) {
    let baseUrl = "https://www.themealdb.com/api/json/v1/1/"
    let urlString = "\(baseUrl)filter.php?c=Dessert"
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        
        do {
            let serverMeals = try JSONDecoder().decode(ServerMeals.self, from: data)
            DispatchQueue.main.async {
                completion(serverMeals.meals)
            }
        } catch {
            print("Error decoding meals: \(error)")
            completion(nil)
        }
    }.resume()
}



//fetching the meal details by its ID
func fetchMealDetail(mealId: String, completion: @escaping (MealDetail?) -> Void) {
    let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        do {
            let decoder = JSONDecoder()
            let serverMealDetail = try decoder.decode(ServerMealDetail.self, from: data)
            if let mealDetail = serverMealDetail.meals.first {
                DispatchQueue.main.async {
                    completion(mealDetail)
                }
            } else {
                completion(nil)
            }
        } catch {
            print("Error decoding meal detail: \(error)")
            completion(nil)
        }


    }.resume()
}

