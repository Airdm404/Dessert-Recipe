//
//  MealDetails.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/29/24.
//

import SwiftUI

struct MealDetails: View {
    @StateObject var mealDetails = MealDetailModel()
    let mealId: String
    
    
    
    var body: some View {
        
        ScrollView {
            if mealDetails.isLoading {
                ProgressView("Loading...")
            } else if let mealDetail = mealDetails.mealDetail {
                VStack(alignment: .leading, spacing: 10) {
                    Text(mealDetail.strMeal)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    AsyncImage(url: URL(string: mealDetail.strMealThumb)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ForEach(Array(zip(mealDetail.measurements, mealDetail.ingredients)), id: \.0) { measure, ingredient in
                            Text("\(measure) \(ingredient)")
                        }
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ForEach(mealDetail.strInstructions.split(separator: "\r\n").enumerated().map({ $0 }), id: \.0) { index, step in
                            Text("\(index + 1). \(String(step))") 
                                .padding(.bottom, 2)
                        }
                    }
                    
                }
                .padding(.horizontal)
            } else if let errorMessage = mealDetails.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            if mealDetails.mealDetail == nil && mealDetails.errorMessage == nil {
                mealDetails.loadMealDetail(mealId: mealId)
            }
        }
    }
}



struct MealDetails_Previews: PreviewProvider {
    static var previews: some View {
        MealDetails(mealId: "53049")
    }

}
