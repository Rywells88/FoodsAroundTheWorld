//
//  mealDetail.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

struct mealDetail: View {
    @Binding var showBreakfast : Bool
    
    var m: Meal
    
    var body: some View {
        NavigationView{
//            Button(action: {
//                       self.showBreakfast = false
//                   }) {
//                       Text("Dismiss").frame(height: 60)
//                   }
            VStack {
                Text(m.recipeName)
                Text(m.country)
            }
            .navigationBarItems(trailing: Button("Done", action: {self.showBreakfast = false}))
            .navigationBarTitle(m.recipeName, displayMode: .inline)
            
        }
        
        
       
    }
    
}

struct mealDetail_Previews: PreviewProvider {
    static var previews: some View {
        mealDetail(showBreakfast: .constant(true), m: ModelData().meals[0])
    }
}
