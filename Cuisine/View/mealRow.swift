//
//  mealRow.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

struct mealRow: View {
    
    var meal: Meal
    

    var body: some View {
        
        HStack {
            meal.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(meal.meal)

            Spacer()
        }
      
    }
}

struct mealRow_Previews: PreviewProvider {
    static var previews: some View {
        mealRow(meal: meals[0])
    }
}
