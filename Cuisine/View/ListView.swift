//
//  ListView.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

struct ListView: View {
    
    //@EnvironmentObject var modelData: ModelData
    
    var meals : [String] = ["Breakfast", "Lunch", "Dinner"]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(meals, id: \.self){ meal in
                    NavigationLink(
                        destination: mealDetail(),
                        label: {
                            Text(meal)
                        })
                    
                }
                
            }
            .navigationTitle("Select a meal")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
