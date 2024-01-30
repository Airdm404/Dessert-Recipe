//
//  MealList.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//
//  View for list of meals
//

import SwiftUI

struct MealList: View {
    @EnvironmentObject var mealsModel: MealsModel
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                DessertRecipeLogo()
                
                ZStack(alignment: .trailing) {
                    TextField("Search", text: $searchText)
                        .padding(8)
                        .background(Color.gray.opacity(0.1).cornerRadius(8))
                        .frame(width: UIScreen.main.bounds.width * 0.9)
                        
                    if !searchText.isEmpty {
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
                
                List(filteredMeals, id: \.id) { meal in
                    NavigationLink {
                        MealDetails(mealId: meal.idMeal)
                    } label: {
                        MealItem(meal: meal)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
    
    private var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return mealsModel.meals.sorted { $0.strMeal < $1.strMeal }
        } else {
            return mealsModel.meals.filter { $0.strMeal.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList().environmentObject(MealsModel())
    }
}
