//
//  DessertRecipeLogo.swift
//  Dessert Recipe
//
//  Created by Edem Ahorlu on 1/30/24.
//

import SwiftUI

struct DessertRecipeLogo: View {
    var body: some View {
        HStack {
            Text("🧁")
                .font(.largeTitle)
            
            Text("Dessert Recipe")
                .font(.custom("Chalkduster", size: 20))
                .foregroundColor(Color(red: 210/255, green: 180/255, blue: 140/255))
        }
    }
}

#Preview {
    DessertRecipeLogo()
}
