//
//  ListView.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            List{
                List(modelData.meals){ meal in
                    NavigationLink(
                        destination: mealDetail(m: meal),
                        label: {
                            Text(meal.meal)
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
            .environmentObject(ModelData())
    }
}
