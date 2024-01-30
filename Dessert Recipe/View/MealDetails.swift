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
                
                AsyncImage(url: URL(string: mealDetail.strMealThumb)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Rectangle())
                .frame(minHeight: 150)
                
                Text(mealDetail.strMeal)
                    .font(Font.custom("Markazi Text", size: 32))
                
                Spacer(minLength: 20)
                
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)

                    ForEach(Array(zip(mealDetail.measurements, mealDetail.ingredients)), id: \.0) { measure, ingredient in
                        Text("\(measure) \(ingredient)")
                            .font(Font.custom("Markazi Text", size: 18))
                            
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                

                
                Spacer(minLength: 20)
                
                VStack(alignment: .leading) {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.semibold)

                    ForEach(mealDetail.strInstructions.split(separator: "\r\n").enumerated().map({ $0 }), id: \.0) { index, step in
                        Text("\(index + 1). \(String(step))")
                            .font(Font.custom("Markazi Text", size: 18))
                            .padding(.bottom, 2)
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
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        
    }
    
}



struct MealDetails_Previews: PreviewProvider {
    static var previews: some View {
        MealDetails(mealId: "53049")
    }

}
