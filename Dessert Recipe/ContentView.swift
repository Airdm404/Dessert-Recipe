//
//  ContentView.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MealList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MealsModel())
    }
}
