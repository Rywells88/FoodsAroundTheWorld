//
//  MealList.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-26.
//

import SwiftUI

struct MealList: View {
    var body: some View {

        NavigationView {
            List(meals){ meal in mealRow(meal: meal)
                
            }
            .navigationTitle("Select a Meal")
            .listStyle(InsetGroupedListStyle())
            .background(Color.red)
            
        }
        
    }
}

struct MealList_Previews: PreviewProvider {
    static var previews: some View {
        MealList()
    }
}
