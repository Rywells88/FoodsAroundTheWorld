//
//  mealDetail.swift
//  Cuisine
//
//  Created by Ryley Wells on 2021-05-21.
//

import SwiftUI

struct mealDetail: View {
    
    var m: Meal
    
    var body: some View {
        VStack {
            Text(m.recipeName)
            Text(m.country)
        }
    }
}

struct mealDetail_Previews: PreviewProvider {
    static var previews: some View {
        mealDetail(m: ModelData().meals[0])
    }
}
