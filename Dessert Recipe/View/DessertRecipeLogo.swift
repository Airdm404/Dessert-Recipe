//
//  DessertRecipeLogo.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/30/24.
//
//  Custom logo for the app
//

import SwiftUI

struct DessertRecipeLogo: View {
    var body: some View {
        HStack {
            Text("🧁")
                .font(.largeTitle)
            
            Text("Dessert Recipe")
                .font(.custom("Chalkduster", size: 25))
                .foregroundColor(Color(red: 210/255, green: 180/255, blue: 140/255))
        }
    }
}

#Preview {
    DessertRecipeLogo()
}
