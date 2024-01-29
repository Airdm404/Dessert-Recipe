//
//  Dessert_RecipeApp.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/27/24.
//

import SwiftUI

@main
struct Dessert_RecipeApp: App {
    @StateObject private var mealsModel = MealsModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(mealsModel)
        }
    }
}
